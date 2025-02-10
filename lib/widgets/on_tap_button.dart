import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class OnClickButton extends StatelessWidget {
  const OnClickButton({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.contentColorCyan.withOpacity(0.8),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      icon: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
