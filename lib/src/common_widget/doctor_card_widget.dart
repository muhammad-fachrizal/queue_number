import 'package:flutter/material.dart';
import 'package:queue_number/src/theme_manager/text_style_manager.dart';

class DoctorCardWidget extends StatelessWidget {
  const DoctorCardWidget({
    super.key,
    required this.doctorsType,
    required this.fontSize,
    required this.materialSymbol,
  });

  final String doctorsType;
  final double fontSize;
  final IconData materialSymbol;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                materialSymbol,
                size: 86,
                color: Colors.blue,
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  doctorsType,
                  style: getRubikTextStyle(fontSize: fontSize),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
