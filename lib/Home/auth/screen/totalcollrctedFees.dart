import 'package:flutter/material.dart';

class TotalCollectedFees extends StatefulWidget {
  const TotalCollectedFees({super.key});

  @override
  State<TotalCollectedFees> createState() => _TotalCollectedFeesState();
}

class _TotalCollectedFeesState extends State<TotalCollectedFees> {
  List<Map<String, dynamic>> paidStudents = [
    {'name': 'Ahmed Khan', 'roll': 'A001', 'paid': 5000},
    {'name': 'Ayesha Ali', 'roll': 'A002', 'paid': 10000},
  ];

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final feeController = TextEditingController();
  int? editingIndex;

  void showStudentDialog({Map<String, dynamic>? student, int? index}) {
    if (student != null) {
      nameController.text = student['name'];
      rollController.text = student['roll'];
      feeController.text = student['paid'].toString();
      editingIndex = index;
    } else {
      nameController.clear();
      rollController.clear();
      feeController.clear();
      editingIndex = null;
    }

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(
              editingIndex == null ? 'Add Paid Student' : 'Edit Student',
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: rollController,
                  decoration: InputDecoration(labelText: 'Roll Number'),
                ),
                TextField(
                  controller: feeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Paid Amount'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final newStudent = {
                    'name': nameController.text,
                    'roll': rollController.text,
                    'paid': int.tryParse(feeController.text) ?? 0,
                  };

                  setState(() {
                    if (editingIndex == null) {
                      paidStudents.add(newStudent);
                    } else {
                      paidStudents[editingIndex!] = newStudent;
                    }
                  });

                  Navigator.pop(context);
                },
                child: Text(editingIndex == null ? 'Add' : 'Update'),
              ),
            ],
          ),
    );
  }

  void confirmDeleteStudent(int index) {
    final student = paidStudents[index];

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Delete Confirmation'),
            content: Text(
              'Are you sure you want to delete ${student['name']}?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    paidStudents.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
            ],
          ),
    );
  }

  int get totalCollected => paidStudents.fold<int>(
    0,
    (sum, student) => sum + (student['paid'] as int),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Collected Fees'),
        backgroundColor: const Color(0xFF2AC9A0),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Total Collected: ₹$totalCollected',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: paidStudents.length,
              itemBuilder: (context, index) {
                final student = paidStudents[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.green),
                    title: Text(student['name']),
                    subtitle: Text('Roll: ${student['roll']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('₹${student['paid']}'),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed:
                              () => showStudentDialog(
                                student: student,
                                index: index,
                              ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => confirmDeleteStudent(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2AC9A0),
        child: const Icon(Icons.add),
        onPressed: () => showStudentDialog(),
      ),
    );
  }
}
