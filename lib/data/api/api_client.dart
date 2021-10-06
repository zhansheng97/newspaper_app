import 'dart:convert';

import 'package:http/http.dart';
import 'package:newspaper_app/data/api/apii_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    Uri uri =
        Uri.parse("${ApiConstants.baseUrl}$path&apiKey=${ApiConstants.apiKey}");
    final response = await _client.get(uri);
    if (response.statusCode == 200) {
      var jsonReponse = jsonDecode(response.body);
      return jsonReponse;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
