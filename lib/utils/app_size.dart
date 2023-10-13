import 'package:flutter/cupertino.dart';

double h=0,w=0;
class AppSize
{
  static final size = AppSize._();
  AppSize._();

  void intiSize(BuildContext c)
  {
    h=  MediaQuery.of(c).size.height;
    w=  MediaQuery.of(c).size.width;
  }


}