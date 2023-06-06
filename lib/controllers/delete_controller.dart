import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_record/DB/dbfunctions/dbfunctions.dart';
import 'package:student_record/DB/model/datamodel.dart';

class DeleteController {
  deleteStudent(int index) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentDB.deleteAt(index);
    // studentListNotifier.value.removeAt(index);
    // studentListNotifier.notifyListeners();
    getAllStudents();
  }
}
