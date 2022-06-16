import 'package:http/http.dart' as http;

class CallRegisterApi {
  final String _url = "http://192.168.1.33:8085/api";
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
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    };
