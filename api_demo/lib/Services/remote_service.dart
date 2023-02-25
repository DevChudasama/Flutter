import 'package:api/Models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'https://63ec906f31ef61473b2493e2.mockapi.io';

class Remoteservice {
  var client = http.Client();

  //get data=fetch data
  Future<List<User>?> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {
      print('loading.....');
    }
  }

  // post data=add data
  Future<List<User>?> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {'Content-Type': 'application/json'};
    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      var json = response.body;
      return userFromJson(json);
    } else {
      print('loading.....');
    }
  }

  //put data=edit data
  Future<List<User>?> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {'Content-Type': 'application/json'};
    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {
      print('loading.....');
    }
  }

  //delete data=delete data
  Future<List<User>?> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var response = await client.delete(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {
      print('loading.....');
    }
  }
}
