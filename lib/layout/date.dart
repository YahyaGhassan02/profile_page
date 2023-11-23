import 'package:flutter/material.dart';

class DateDisplay extends StatefulWidget {
  const DateDisplay({super.key});

  @override
  _DateDisplayState createState() => _DateDisplayState();
}

class _DateDisplayState extends State<DateDisplay> {
  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the date and time as a string
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    return Column(
      children: [
        Text(
          formattedDate,
          style: const TextStyle(fontSize: 9),
        ),
      ],
    );
  }
}

