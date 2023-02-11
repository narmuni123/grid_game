import 'package:flutter/material.dart';
import 'package:grid_game/constant/text_constant.dart';

int? row;
int? column;
List value = List.filled(row! * column!, null, growable: false);

FormFieldValidator rowValidator() {
  return (val) {
    if (val!.isEmpty) {
      return TextConstants.ROW_EMPTY_VAL;
    } else {
      return null;
    }
  };
}

FormFieldValidator columnValidator() {
  return (val) {
    if (val!.isEmpty) {
      return TextConstants.COLUMN_EMPTY_VAL;
    } else {
      return null;
    }
  };
}
