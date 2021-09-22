import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';

Container outlinedTextFormField({
  required String title,
  required String errorText,
  bool obscureText = false,
  bool showAccent = false,
  required Function(String) returnedParameter,
  required TextEditingController controller,
}) {
  return Container(
    decoration: BoxDecoration(
      color: showAccent ? kAccent.withOpacity(0.1) : kAccent.withOpacity(0.0),
      borderRadius: kBorderRadiusCircular,
      border: Border.all(
        color: kCardBackgroundFaint,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: title,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return errorText;
            } else {
              returnedParameter(value);
            }
            return null;
          }),
    ),
  );
}
