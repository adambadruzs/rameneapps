import 'dart:convert';
import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();
  var res = await dio.get('http://localhost:3000/users');
  print(res.data);
  print("\n");
  res = await dio.get('http://localhost:3000/data');
  print(res.data);
}
