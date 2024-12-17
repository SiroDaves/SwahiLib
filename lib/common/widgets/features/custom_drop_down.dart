import 'package:flutter/material.dart';

class CustomDropdownItem extends StatelessWidget {
  final String value;
  final String selectedOption;

  const CustomDropdownItem({
    super.key,
    required this.value,
    required this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == selectedOption;
    return Container(
      padding: const EdgeInsets.all(10),
      color: isSelected ? Colors.blue : Colors.white,
      child: Text(
        value,
        style: TextStyle(
          fontSize: 16,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
