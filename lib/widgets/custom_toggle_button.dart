import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomToggleButton extends StatefulWidget {
  final List<String> options;
  final Function(int index) onChanged;
  final int selectedIndex;

  const CustomToggleButton({
    super.key,
    required this.options,
    required this.onChanged,
    required this.selectedIndex,
  });

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: List.generate(
        widget.options.length,
        (index) => index == widget.selectedIndex,
      ),
      onPressed: (index) {
        if (index != widget.selectedIndex) {
          widget.onChanged(index);
        }
      },
      borderRadius: BorderRadius.circular(5.0),
      selectedBorderColor: AppColors.contentColorWhite,
      selectedColor: Colors.white,
      fillColor: AppColors.contentColorWhite,
      color: Colors.black,
      renderBorder: false,
      children: widget.options.map(
        (option) {
          final isSelected =
              widget.selectedIndex == widget.options.indexOf(option);
          return Container(
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: isSelected ? AppColors.buttonGradient : null,
              color: isSelected
                  ? AppColors.accentColor
                  : AppColors.appBarTextColor,
            ),
            child: Text(
              option,
              style: AppTextStyles.titleSmall.copyWith(
                color:
                    isSelected ? AppColors.textColor : AppColors.hintsTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ).toList(),
    );
  }
}
