
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/suras.dart';
import '../Models/surahs.dart';


class Service_Surahs{

  Future<List<surahs>> getPost() async{
    var res= await http.get(Uri.parse("http://api.alquran.cloud/v1/meta"));
    List<surahs> posts=[];
    if(res.statusCode == 200){

      var data=jsonDecode(res.body);
      var sura=data["data"]["surahs"];
      posts.add(surahs.fromJson(data));
      return posts;
    }
    throw Exception('surahs error');
  }

  Future<List<souras>> getDetail(int id) async{
    var res= await http.get(Uri.parse("https://api.alquran.cloud/v1/surah/$id/ar.asad"));
    List<souras> postssura=[];
    if(res.statusCode == 200){

      var data=jsonDecode(res.body);
      postssura.clear();
      postssura.add(souras.fromJson(data));
      return postssura;
    }
    throw Exception('surahs error');
  }
}