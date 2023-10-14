import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
const String url = "https://www.balldontlie.io/api/v1/games";
Future<List<dynamic>> getAllGames() async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return convert.jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
