import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'student_model.g.dart'; // generated file

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String roll;

  @HiveField(2)
  int paid;

  @HiveField(3)
  int due;

  @HiveField(4)
  Uint8List? imageBytes; // NEW FIELD

  StudentModel({
    required this.name,
    required this.roll,
    required this.paid,
    required this.due,
    this.imageBytes,
  });
}
