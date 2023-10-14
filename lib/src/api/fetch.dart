import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

fetchData(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return(convert.jsonDecode(response.body))["data"];
  } else {
    throw Exception('Failed to load data');
  }
}
