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
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  cursorColor: const Color.fromARGB(248, 44, 1, 1),
                  decoration: InputDecoration(
                    hintText: '----',
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    suffixIcon: unitList.length >
                            1 // Show dropdown only if multiple units exist
                        ? GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 90,
                              decoration: BoxDecoration(
                                color:
                                    AppColors.contentColorCyan.withOpacity(0.8),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  style: TextStyle(fontSize: 12),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  isDense: true, // Reduces internal padding
                                  isExpanded:
                                      false, // Prevents full-width stretching
                                  underline: const SizedBox(),
                                  dropdownColor: Colors.grey.shade200,
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
                            ),
                          )
                        : GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    AppColors.contentColorCyan.withOpacity(0.8),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              width: 90,
                              child: Center(
                                child: Text(
                                  text,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ), // Hide if only one unit
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
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
                      borderSide: BorderSide(
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
            ),
          ],
        ),
      );
    },
  );
}
