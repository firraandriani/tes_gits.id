import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _selectedTime = '8:00 AM';
  @override
  Widget build(BuildContext context) {
    Future<void> _openTimePicker(BuildContext context) async {
      final t =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      if (t != null) {
        setState(() {
          _selectedTime = t.format(context);
        });
      }
    }

    return Scaffold(
      body: Center(
        child: RawMaterialButton(
          fillColor: Colors.blue,
          child: Text(
            _selectedTime,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            _openTimePicker(context);
          },
        ),
      ),
    );
  }
}
