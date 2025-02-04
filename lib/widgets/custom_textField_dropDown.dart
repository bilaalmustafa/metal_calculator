import 'package:flutter/material.dart';
import 'custom_text_field1.dart';

buildInputRow(
  String label,
  TextEditingController controller,
  String unit,
  ValueChanged<String?> onChanged,
  List<String> unitList,
  String text,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Expanded(
      child:
          customTextField1(label, controller, unit, onChanged, unitList, text),
    ),
  );
}
