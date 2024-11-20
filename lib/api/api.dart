import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Apihelper {
  static Apihelper apihelper = Apihelper._();
  Apihelper._();
  String api ='';
  Future<Map> fatch(String search) async {

    Uri url = Uri.parse('https://saavn.dev/api/search/songs?query=hindi');
   final  response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map data = jsonDecode(json);
      print("------------------------lkadsdsfhnldffb\n" + "$data");
      return data;
    } else {
      print('Failed to load data: ${response.statusCode}');
      return {};
    }
  }
  // Future<Map> fatch1(String search) async {
  //   Uri url = Uri.parse(api);
  //  final  response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     final json = response.body;
  //     Map data = jsonDecode(json);
  //     print("------------------------lkadsdsfhnldffb\n" + "$data");
  //     return data;
  //
  //   } else {
  //     print('Failed to load data: ${response.statusCode}');
  //     return {};
  //   }
  // }
}

