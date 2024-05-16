import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class PlacesWebservices {
  late Dio dio;
  static const suggestionsBaseUrl =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static const googleAPIKey = 'AIzaSyDwproMFUGZzFhwlDh8YL4ULifz_tK7H-o';
  static const placeLocationBaseUrl =
      'https://maps.googleapis.com/maps/api/place/details/json';

  PlacesWebservices() {
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(milliseconds: 20 * 1000), // Convert to Duration
      receiveTimeout: Duration(milliseconds: 20 * 1000), // Convert to Duration
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }


  Future<List<dynamic>> fetchSuggestions(String place, String sessionToken) async {
    try {
      Response response = await dio.get(
        suggestionsBaseUrl,
        queryParameters: {
          'input': place,
          'types': 'address',
          'components': 'country:eg',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        },
      );
      print(response.data['predictions']);
      print(response.statusCode);
      return response.data['predictions'];
    } catch (error) {
      print(error.toString());
      return [];
    }
  }


  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      Response response = await dio.get(
        placeLocationBaseUrl,
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        },
      );
      return response.data;
    } catch (error) {
      return Future.error("Place location error : ",
          StackTrace.fromString(('this is its trace')));
    }
  }

}
