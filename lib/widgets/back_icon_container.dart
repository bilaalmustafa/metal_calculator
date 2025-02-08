import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF2F2F2),
        boxShadow: [
          // Light shadow (top-left)
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-3, -3),
            blurRadius: 5,
          ),
          // Dark shadow (bottom-right)
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(3, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 16,
        ),
      ),
    );
  }
}
