

import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static const String BASE_URL = "https://storage.googleapis.com/ember-deploy.appspot.com";

  Future<http.Response> _makerequest(String method, path, ) async {
    var url = Uri.parse("$BASE_URL$path");
    Map<String, String> headers = {

    };

    // var requestBody = json.encode(body);
    http.Response response;
    switch (method) {
      case "GET":
        response = await http.get(url, headers: headers);
        break;
      default:
        throw new Exception("Invalid Method");
    }
    return response;
  }

  Future<http.Response> getFoodList() async {
    return await _makerequest("GET", "/images/open-source.json");
  }

}




