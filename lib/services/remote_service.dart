import 'dart:convert';
import 'dart:developer';
import 'package:it_intership_jobs_r2s/models/company.dart';
import 'package:it_intership_jobs_r2s/models/user.dart';
import 'package:http/http.dart' as http;

import '../models/candidate.dart';

class RemoteService {
  static String uri = 'http://10.0.2.2:8085';

  static Future<List<User>?> getUsers() async {
    final response = await getHTTP('/api/user');
    if (response.statusCode == 200) {
      return (json.decode(utf8.decode(response.bodyBytes)) as List)
          .map((data) => User.fromJson(data))
          .toList();
    } else {
      // throw Exception('Failed to load getUsersAPI');
      log('Failed to load getUsersAPI');
    }
    return null;
  }

  static Future<User?> getUser(String username) async {
    final response = await getHTTP('/api/user/$username');

    if (response.statusCode == 200) {
      if (response.body != '') {
        return User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } else {
      // throw Exception('Failed to load getUserAPI');
      log('Failed to load getUserAPI');
    }
    return null;
  }

  static Future<Company?> getCompany(String id) async {
    final response = await getHTTP('/api/company/$id');

    if (response.statusCode == 200) {
      if (response.body != '') {
        return Company.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } else {
      // throw Exception('Failed to load getUserAPI');
      log('Failed to load getCompanyAPI');
    }
    return null;
  }

  static Future<Candidate?> getCandidate(String username) async {
    final response = await getHTTP('/api/candidate/u/$username');

    if (response.statusCode == 200) {
      if (response.body != '') {
        return Candidate.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }
    } else {
      // throw Exception('Failed to load getUserAPI');
      log('Failed to load getUserAPI');
    }
    return null;
  }

  static Future<http.Response> postLogin(
      String username, String password) async {
    Map data = {'username': username, 'password': password};
    http.Response response = await postHTTP('/api/signin', data);
    // log(response.body);
    // log('${response.statusCode}');
    return response;
  }

  static Future<http.Response> getHTTP(apiUrl) async {
    final response = await http.get(Uri.parse('$uri$apiUrl'));
    return response;
  }

  static Future<http.Response> postHTTP(apiUrl, data) async {
    String fullUrl = uri + apiUrl;
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    var response = await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: headers,
    );

    // log('${response.statusCode}');
    // log(response.body);
    return response;
  }
}
