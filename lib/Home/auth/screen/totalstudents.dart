import 'package:flutter/material.dart';

class StudentListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> students = [
    {'name': 'Ahmed Khan', 'roll': 'A001', 'paid': 5000, 'due': 5000},
    {'name': 'Ayesha Ali', 'roll': 'A002', 'paid': 10000, 'due': 0},
    {'name': 'Zainab Noor', 'roll': 'A003', 'paid': 0, 'due': 10000},
    {'name': 'Ali Raza', 'roll': 'A004', 'paid': 8000, 'due': 2000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Students'),
        backgroundColor: Color(0xFF2AC9A0),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          final isPaid = student['due'] == 0;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isPaid ? Colors.green : Colors.red,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text('${student['name']}'),
              subtitle: Text('Roll: ${student['roll']}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Paid: ₹${student['paid']}'),
                  Text('Due: ₹${student['due']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
