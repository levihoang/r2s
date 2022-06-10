import 'dart:convert';

import 'package:http/http.dart' as http;

class CallRegisterApi {
  final String _url = "https://62a2af3b21232ff9b20db405.mockapi.io/api/";

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
      headers: _setHeader(),
    );
  }
}

_setHeader() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
