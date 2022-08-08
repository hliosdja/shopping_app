import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future fetch({String? url}) async {
    var apiURl = Uri.parse(url!);
    var response = await http.get(apiURl);
    print(response.body);
    return jsonDecode(response.body);
  }
}
