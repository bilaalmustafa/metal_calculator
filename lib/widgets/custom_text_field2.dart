import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

customTextField2(
  String label,
  TextEditingController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: controller,
      cursorColor: const Color.fromARGB(248, 44, 1, 1),
      decoration: InputDecoration(
        labelText: label,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        contentPadding: const EdgeInsets.only(left: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black26,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorStyle: AppTextStyles.bodySmall.copyWith(color: Colors.red),
      ),
    ),
  );
}
