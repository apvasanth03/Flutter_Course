import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future<Map<String, dynamic>?> getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      Map<String, dynamic> decodedData = jsonDecode(data);
      return decodedData;
    } else {
      return null;
    }
  }
}
