import 'package:flutter/material.dart';

class ColorKeeper{
  static int defaultRed = 255;
  static int defaultGreen = 255;
Color defaultColor = Color.fromARGB(255, defaultRed, defaultGreen, 100);
late int userRed;
late int userGreen;
late Color userColor = Color.fromARGB(255, userRed, userGreen, 100);

set red (int userRed){
  this.userRed = userRed;
}
set green (int userGreen){
  this.userGreen = userGreen;
}
}

