import 'dart:convert';
import 'package:http/http.dart' as http;

final dominio = 'https://drkoopdev.com/wp-json/wp/v2/posts?_embed';

Future<List> blog()async {
  final response = await http.get(Uri.parse(dominio), headers: {'Accept' : 'application/json'});
  var converJson = jsonDecode(response.body);
  return converJson;
}