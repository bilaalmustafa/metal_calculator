import 'package:flutter/material.dart';

class CalculateRow extends StatelessWidget {
  const CalculateRow({
    super.key,
    required this.shareOnTap,
    required this.copyOnTap,
    required this.calculatorOnTap,
  });
  final VoidCallback shareOnTap;
  final VoidCallback copyOnTap;
  final VoidCallback calculatorOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade50, // Shadow color
                blurRadius: 4, // Spread of shadow
                spreadRadius: 2, // Expansion of shadow
                offset: Offset(0, 2), // Moves shadow down
              ),
            ],
          ),
          child: FloatingActionButton(
            shape: CircleBorder(
              side: BorderSide(color: Colors.grey.shade100),
            ),
            backgroundColor: const Color(0xFFF2F5F9),
            onPressed: shareOnTap,
            child: const Icon(Icons.share, color: Colors.black),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100, // Shadow color
                blurRadius: 6, // Spread of shadow
                spreadRadius: 2, // Expansion of shadow
                offset: Offset(0, 2), // Moves shadow down
              ),
            ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFFF2F5F9), // Button background color
              foregroundColor: Colors.black, // Text color
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Matches container radius
              ),
            ),
            onPressed: calculatorOnTap,
            child: const Text(
              "CALCULATE",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade50, // Shadow color
                blurRadius: 6, // Spread of shadow
                spreadRadius: 2, // Expansion of shadow
                offset: Offset(0, 2), // Moves shadow down
              ),
            ],
          ),
          child: FloatingActionButton(
            shape: CircleBorder(
              side: BorderSide(color: Colors.grey.shade100),
            ),
            backgroundColor: const Color(0xFFF2F5F9),
            onPressed: copyOnTap,
            child: const Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
