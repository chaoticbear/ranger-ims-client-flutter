import 'package:flutter/material.dart';

class IncidentReportsScreen extends StatelessWidget {
  const IncidentReportsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 196, 240),
      alignment: Alignment.center,
      child: const Text(
        'Incident Reports',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
