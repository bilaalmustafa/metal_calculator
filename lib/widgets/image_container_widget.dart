import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFF2F5F9), // Light background color
        boxShadow: [
          // Light shadow (top-left) for 3D effect
          BoxShadow(
              color: Color(0xffF2F9F9),
              offset: const Offset(-1, -2),
              blurRadius: 6,
              spreadRadius: 2),
          // Dark shadow (bottom-right) for depth
          BoxShadow(
            color: Color(0xffCCD8E1),
            offset: const Offset(4, 6),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
