import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';

import 'outlinedTextFormField.dart';

inputCard({
  required String title,
  required TextEditingController controller,
  Function(String)? onChange,
}) {
  return Material(
    child: Container(
      child: outlinedTextFormField(
        title: title,
        errorText: 'Please input Data',
        controller: controller,
        onChange: onChange,
        returnedParameter: (value) {
          //userName = value;
        },
      ),
    ),
  );
}
