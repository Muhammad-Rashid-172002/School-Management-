import 'package:flutter/material.dart';

class CustomizeButton extends StatefulWidget {
  const CustomizeButton({super.key});

  @override
  State<CustomizeButton> createState() => _CustomizeButtonState();
}

class _CustomizeButtonState extends State<CustomizeButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Button'),
        backgroundColor: const Color(0xFF2AC9A0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            height: 100,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
                print('Student button pressed -----> ');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2AC9A0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.search, size: 40, color: Colors.white),
                  const Text(
                    'search',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
