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
      selectedBorderColor: AppColors.accentColor,
      selectedColor: Colors.white,
      fillColor: AppColors.accentColor,
      color: Colors.black,
      renderBorder: false,
      children: widget.options.map(
        (option) {
          final isSelected =
              widget.selectedIndex == widget.options.indexOf(option);
          final isFirst = widget.options.indexOf(option) == 0;
          final isLast =
              widget.options.indexOf(option) == widget.options.length - 1;
          return Container(
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.accentColor
                  : AppColors.appBarTextColor,
              borderRadius: BorderRadius.only(
                topLeft: isFirst
                    ? const Radius.circular(5.0)
                    : Radius.circular(isSelected ? 5.0 : 0.0),
                bottomLeft: isFirst
                    ? const Radius.circular(5.0)
                    : Radius.circular(isSelected ? 5.0 : 0.0),
                topRight: isLast
                    ? const Radius.circular(5.0)
                    : Radius.circular(isSelected ? 5.0 : 0.0),
                bottomRight: isLast
                    ? const Radius.circular(5.0)
                    : Radius.circular(isSelected ? 5.0 : 0.0),
              ),
              boxShadow: [
                isSelected
                    ? BoxShadow(
                        color: AppColors.boxShadowColor,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 1),
                      )
                    : BoxShadow(
                        color: AppColors.buttonColor1,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: const Offset(0, 1),
                      ),
              ],
            ),
            child: Text(
              option,
              style: AppTextStyles.titleSmall.copyWith(
                color: isSelected
                    ? AppColors.contentColorWhite
                    : AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ).toList(),
    );
  }
}
