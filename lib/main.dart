import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oo_quran/urls.dart';

import 'Controllors/Controllor_surahs.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff213239),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white60,
          fontSizeDelta: 18,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff213239),
          titleTextStyle: TextStyle(
            color: Colors.white60,
            fontSize: 19
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      getPages: Url.urlpage,
      initialBinding: BindingsBuilder(() => {Get.put(Controllor_surahs())}),
      initialRoute: "/",
    );
  }
}


