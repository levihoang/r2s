import 'dart:convert';

import 'package:it_intership_jobs_r2s/models/user.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  static String uri = 'http://192.168.1.27:8085/api';

  static Future<List<User>> getUsers() async {
    List<User> arr;
    final response = await http.get(Uri.parse('$uri/user'));

    if (response.statusCode == 200) {
      arr = (json.decode(utf8.decode(response.bodyBytes)) as List)
          .map((data) => User.fromJson(data))
          .toList();
      return arr;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
