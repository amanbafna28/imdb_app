import 'package:flutter/material.dart';

//Use Media Query for responsiveness on screen according to various devices of different screen and sizes

class Resp {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 100);
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 100);
  }
}
