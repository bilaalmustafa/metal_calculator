import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

customTextField2(
  String label,
  TextEditingController controller,
) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.all(2),
    height: 45,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFFF2F5F9), // Light background color
      boxShadow: [
        BoxShadow(
          color: Color(0xffF2F9F9),
          offset: const Offset(-4, -4),
          blurRadius: 6,
        ),
        BoxShadow(
          color: Color(0xffCCD8E1),
          offset: const Offset(4, 4),
          blurRadius: 6,
        ),
      ],
    ),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            cursorColor: const Color.fromARGB(248, 44, 1, 1),
            decoration: InputDecoration(
              hintText: '----',
              floatingLabelAlignment: FloatingLabelAlignment.start,
              contentPadding: const EdgeInsets.only(left: 10),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white70,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white70,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorStyle: AppTextStyles.bodySmall.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
