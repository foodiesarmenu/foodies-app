import 'package:injectable/injectable.dart';

import '../model/place.dart';
import '../model/place_suggestions.dart';
import '../../data/places_web_services.dart';

@injectable
class MapsRepository {
  PlacesWebservices placesWebservices;

  @factoryMethod
  MapsRepository(this.placesWebservices);

  Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken) async {
    final suggestions =
        await placesWebservices.fetchSuggestions(place, sessionToken);

    return suggestions
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }

  Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
    final place =
    await placesWebservices.getPlaceLocation(placeId, sessionToken);
    // var readyPlace = Place.fromJson(place);
    return Place.fromJson(place);
  }
}
