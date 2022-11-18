import 'dart:convert';
import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();
  Map<String, String> uploadData = {'username': 'Emperor', 'password': 'Meong'};
  var res = await dio.post('http://localhost:3000/users', data: uploadData);
  print(res.data);
}
