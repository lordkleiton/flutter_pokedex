import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class RestConnection {
  static const String base_url = 'https://pokeapi.co/api/v2';

  /// faz a request e retorna o json
  static Future<Map<String, dynamic>> _request(String url) async {
    final http.Response r = await http.get(url);

    if (r.statusCode == 200) {
      return json.decode(r.body);
    } else {
      throw Exception('error requesting $url');
    }
  }

  /// retorna json com dados genéricos do endpoint
  static Future<Map<String, dynamic>> find(
          String endpoint, int limit, int skip) async =>
      await _request('$base_url/$endpoint?limit=$limit&offset=$skip');

  /// retorna json com dados da requisição em específico
  static Future<Map<String, dynamic>> get(
          String data, String endpoint, int limit, int skip) async =>
      await _request('$base_url/$endpoint/$data?limit=$limit&offset=$skip');
}
