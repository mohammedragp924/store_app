import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String? title;
  final TextInputType? inputType;
  final Function(String)? onChanged;

  const CustomTextFiled({
    super.key,
    required this.title,
    this.inputType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: title,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
