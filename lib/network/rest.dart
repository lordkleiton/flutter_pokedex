import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class RestConnection {
  static const String base_url = 'https://pokeapi.co/api/v2';

  Future<Map<String, dynamic>> get(
      String data, String endpoint, int limit, int skip) async {
    final String url = '$base_url/$endpoint/$data';
    final http.Response r = await http.get('$url?limit=$limit&offset=$skip');

    if (r.statusCode == 200) {
      return json.decode(r.body);
    } else {
      throw Exception('error requesting $url');
    }
  }
}
