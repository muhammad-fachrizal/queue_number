import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:queue_number/src/common_widget/doctor_card_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Make Appointment',
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: GridView.count(
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: (screenWidth <= 600) ? 2 : 4,
          children: const [
            DoctorCardWidget(
              doctorsType: '''General
Practitioner''',
              fontSize: 18,
              materialSymbol: Symbols.stethoscope,
            ),
            DoctorCardWidget(
              doctorsType: 'Dentist',
              fontSize: 28,
              materialSymbol: Symbols.dentistry,
            ),
            DoctorCardWidget(
              doctorsType: 'Neurology',
              fontSize: 28,
              materialSymbol: Symbols.neurology,
            ),
            DoctorCardWidget(
              doctorsType: 'Pediatrics',
              fontSize: 28,
              materialSymbol: Symbols.pediatrics,
            ),
          ],
        ),
      ),
    );
  }
}
