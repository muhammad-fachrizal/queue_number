import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:queue_number/src/personal_information_controller.dart';
import 'package:queue_number/src/theme_manager/text_style_manager.dart';

class CustomTextFieldwidget extends StatefulWidget {
  const CustomTextFieldwidget({
    super.key,
    required this.controller,
    required this.labelName,
    required this.hintText,
    required this.flgField,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String labelName;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String flgField;

  @override
  State<CustomTextFieldwidget> createState() => _CustomTextFieldwidgetState();
}

class _CustomTextFieldwidgetState extends State<CustomTextFieldwidget> {
  final PersonalInformationController personalInformationController =
      Get.put(PersonalInformationController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelName,
          style: getRubikTextStyle(),
        ),
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
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
          maxLines: widget.maxLines,
          onChanged: (String value) {
            if (value.trim().isEmpty) {
              personalInformationController.resetFlag(widget.flgField);
            } else {
              personalInformationController.raiseFlag(widget.flgField);
            }
          },
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
