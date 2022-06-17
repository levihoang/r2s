import 'dart:convert';
import 'dart:developer';

import 'package:it_intership_jobs_r2s/models/user.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static String uri = 'http://192.168.1.28:8085';

  static Future<List<User>?> getUsers() async {
    final response = await http.get(Uri.parse('$uri/api/user'));
    if (response.statusCode == 200) {
      return (json.decode(utf8.decode(response.bodyBytes)) as List)
          .map((data) => User.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load getUsersAPI');
    }
    return null;
  }

  static Future<User?> getUser(String username) async {
    final response = await http.get(Uri.parse('$uri/api/user/$username'));

    if (response.statusCode == 200) {
      if (response.body != '') {
        return User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } else {
      throw Exception('Failed to load getUserAPI');
    }
    return null;
  }

  static postHTTP(apiUrl, data) async {
    String fullUrl = uri + apiUrl;
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    var response = await http.post(
      Uri.parse(fullUrl),
      body: data,
      headers: headers,
    );

    log('${response.statusCode}');
    log(response.body);
  }
}
