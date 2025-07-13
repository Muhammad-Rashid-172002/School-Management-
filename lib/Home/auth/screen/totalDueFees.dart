import 'package:flutter/material.dart';

class TotalDueFees extends StatefulWidget {
  const TotalDueFees({super.key});

  @override
  State<TotalDueFees> createState() => _TotalDueFeesState();
}

class _TotalDueFeesState extends State<TotalDueFees> {
  List<Map<String, dynamic>> dueStudents = [
    {'name': 'Zainab Noor', 'roll': 'A003', 'due': 5000},
    {'name': 'Ali Raza', 'roll': 'A004', 'due': 7000},
  ];

  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final feeController = TextEditingController();
  int? editingIndex;

  void showStudentDialog({Map<String, dynamic>? student, int? index}) {
    if (student != null) {
      nameController.text = student['name'];
      rollController.text = student['roll'];
      feeController.text = student['due'].toString();
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
              editingIndex == null ? 'Add Due Student' : 'Edit Student',
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: rollController,
                  decoration: const InputDecoration(labelText: 'Roll Number'),
                ),
                TextField(
                  controller: feeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Due Amount'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final newStudent = {
                    'name': nameController.text,
                    'roll': rollController.text,
                    'due': int.tryParse(feeController.text) ?? 0,
                  };

                  setState(() {
                    if (editingIndex == null) {
                      dueStudents.add(newStudent);
                    } else {
                      dueStudents[editingIndex!] = newStudent;
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
    final student = dueStudents[index];

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
                    dueStudents.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }

  int get totalDue =>
      dueStudents.fold<int>(0, (sum, student) => sum + (student['due'] as int));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Due Fees'),
        backgroundColor: const Color(0xFF2AC9A0),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Total Due: ₹$totalDue',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dueStudents.length,
              itemBuilder: (context, index) {
                final student = dueStudents[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.red),
                    title: Text(student['name']),
                    subtitle: Text('Roll: ${student['roll']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('₹${student['due']}'),
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
