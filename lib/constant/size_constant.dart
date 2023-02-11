import 'package:flutter/material.dart';

double height(context) {
  return MediaQuery.of(context).size.height;
}

double width(context) {
  return MediaQuery.of(context).size.width;
}

SizedBox heightBox(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox widthBox(double width) {
  return SizedBox(
    width: width,
  );
}
