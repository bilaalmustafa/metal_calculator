import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

customTextField1(
  String label,
  TextEditingController controller,
  String unit,
  ValueChanged<String?> onChanged,
  List<String> unitList,
  String text,
) {
  return Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextField(
          controller: controller,
          cursorColor: const Color.fromARGB(248, 44, 1, 1),
          decoration: InputDecoration(
            labelText: label,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            suffixIcon: unitList.length >
                    1 // Show dropdown only if multiple units exist
                ? Container(
                    width: 100,
                    // height: 30,
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.contentColorYellow,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: DropdownButton<String>(
                        isDense: true, // Reduces internal padding
                        isExpanded: false, // Prevents full-width stretching

                        underline: const SizedBox(),
                        value: unit,
                        items: unitList.map((String unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          );
                        }).toList(),
                        onChanged: onChanged,
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.contentColorYellow,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    width: 100,
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ), // Hide if only one unit
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
            errorStyle: AppTextStyles.bodySmall.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      );
    },
  );
}
