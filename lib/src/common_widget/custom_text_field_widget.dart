import 'package:flutter/material.dart';
import 'package:queue_number/src/theme_manager/text_style_manager.dart';

class CustomTextFieldwidget extends StatelessWidget {
  const CustomTextFieldwidget({
    super.key,
    required this.controller,
    required this.labelName,
    required this.hintText,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String labelName;
  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: getRubikTextStyle(),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: getRubikTextStyle(
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
          minLines: 1,
          maxLines: maxLines,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
