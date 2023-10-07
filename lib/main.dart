import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quotes_app/screen/view/home_screen.dart';
import 'package:quotes_app/screen/view/quotes_screen.dart';
import 'package:quotes_app/screen/view/quoteread_screen.dart';
import 'package:quotes_app/screen/view/tab_screen.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => HomeScreen(),
        '/tab':(p0) => TabScreen(),
        '/quotes':(p0) => QuotesRead(),
      },
    )
  );
}