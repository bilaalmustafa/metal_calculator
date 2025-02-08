import 'package:flutter/material.dart';
import 'custom_text_field1.dart';
import 'custom_text_field2.dart';

class AddMetalDialog extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController densityController;
  final String selectedUnitLength;
  final Function(String?) onUnitChanged;

  const AddMetalDialog({
    super.key,
    required this.nameController,
    required this.densityController,
    required this.selectedUnitLength,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: const Color(0xFFF2F5F9),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Add Metal",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xffabaeab),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 60),
                Container(
                  width: 35,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffEEEEEE),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 20,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: customTextField2(
                    'name',
                    nameController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Density",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: customTextField1(
                    'name',
                    densityController,
                    selectedUnitLength,
                    onUnitChanged,
                    ["mm"],
                    "gr/cm",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
