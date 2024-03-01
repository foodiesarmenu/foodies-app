import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/users_response/user_response.dart';

class ApiManager {
  static const String baseUrl = 'foodies-backend-1.onrender.com';
  static const String authorization =
      'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWRiNTg4NWY3NTE1YTJjODcxOTBiN2MiLCJlbWFpbCI6ImFobWVkQGdtYWlsLmNvbSIsImNvdW50cnlDb2RlIjoiMjAiLCJwaG9uZU51bWJlciI6IjAxMiIsInR5cGUiOiJDbGllbnQiLCJpYXQiOjE3MDg5NjgyNTcsImV4cCI6MTc0MDUyNTg1N30.DfBbDEfGy8OTUT-D1zM673ZZ2Kwvc0hQPXxO57xkuu1HhY8kYx2uIMSMuWe70usooSBxkKn1cYxqcfCzKirAHkP9EAa_Mvn8pbajlnzSAEA-ghiawjodFK_GBc_qVBR9nfGA62I-zzt9Q0IpGOMRawNJwuFpIzIaOy079wfDL4SEPIvBBcIHMfvl7qaEpY13l910xcuxWmfm2nqlfgqiMf8f4lU1Z_76WkbxF9kBAfHGTzJqOzaK6KoL2_gTOWsXLvsGowokICIVmm-MACK5urmDEXV-yh5VWTaB-y5K5sUEBX9Jx9lWRq-jqNIqG8oXXAaAc4572E2Qj6xycaVZ0g';

  static Future<UserResponse> getSources() async {
    Uri uri = Uri.https(
      baseUrl,
      '/mobile/client',
    );
    var response = await http.get(
      uri,
      headers: {'Authorization': authorization},
    );
    var json = jsonDecode(response.body);
    var sourcesResponses = UserResponse.fromJson(json);
    return sourcesResponses;
  }
}
