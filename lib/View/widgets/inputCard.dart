import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';

import 'outlinedTextFormField.dart';

inputCard({
  required String title,
  required TextEditingController controller,
}) {
  return Material(
    child: Container(
      child: outlinedTextFormField(
        title: title,
        errorText: 'Please input Data',
        controller: controller,
        returnedParameter: (value) {
          //userName = value;
        },
      ),
    ),
  );
}
