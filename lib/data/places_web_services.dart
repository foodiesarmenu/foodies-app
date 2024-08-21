import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:injectable/injectable.dart';

@singleton
@injectable
class PlacesWebservices {
  static const suggestionsBaseUrl =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  static const googleAPIKey = 'AIzaSyDwproMFUGZzFhwlDh8YL4ULifz_tK7H-o';
  static const placeLocationBaseUrl =
      'https://maps.googleapis.com/maps/api/place/details/json';

  PlacesWebservices();

  Future<List<dynamic>> fetchSuggestions(String place, String sessionToken) async {
    try {
      final response = await http.get(
        Uri.parse(suggestionsBaseUrl).replace(queryParameters: {
          'input': place,
          'types': 'address',
          'components': 'country:eg',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['predictions'];
      } else {
        print(
            'Failed to load suggestions. Status code: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print(error.toString());
      return [];
    }
  }

  Future<dynamic> getPlaceLocation(String placeId, String sessionToken) async {
    try {
      final response = await http.get(
        Uri.parse(placeLocationBaseUrl).replace(queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': googleAPIKey,
          'sessiontoken': sessionToken
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return Future.error(
          'Failed to load place location. Status code: ${response.statusCode}',
          StackTrace.fromString('this is its trace'),
        );
      }
    } catch (error) {
      return Future.error(
        'Place location error: ${error.toString()}',
        StackTrace.fromString('this is its trace'),
      );
    }
  }
}
