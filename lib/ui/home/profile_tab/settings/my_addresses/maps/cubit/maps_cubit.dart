import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../../../../../domain/model/place.dart';
import '../../../../../../../domain/model/place_suggestions.dart';
import '../../../../../../../domain/repositoryContract/maps_repo.dart';
part 'maps_state.dart';

@injectable
class MapsCubit extends Cubit<MapsState> {
  MapsRepository mapsRepository;

  @factoryMethod
  MapsCubit(this.mapsRepository) : super(MapsInitial());

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepository.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepository.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }

}
