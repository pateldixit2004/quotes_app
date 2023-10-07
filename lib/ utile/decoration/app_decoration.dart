import 'package:flutter/material.dart';
import 'package:quotes_app/%20utile/textStyle/app_textStyle.dart';
import 'package:sizer/sizer.dart';

import '../app_color.dart';

BoxDecoration decorationHome = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
    color: redColors);


InputDecoration inputDecoration = InputDecoration(
  label: Text("Category",style: TextStyle(color: redColors),),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: redColors),
  ),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: redColors),),

);



InputDecoration inputDecorationQuotes = InputDecoration(
  label: Text("Quotes",style: TextStyle(color: redColors),),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: redColors),
  ),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: redColors),),

);


Decoration quotesDecoration =BoxDecoration(color: Colors.white70,boxShadow: [
  BoxShadow(color: Colors.grey.shade300,spreadRadius: 3,blurRadius: 4,)
],);