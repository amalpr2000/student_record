import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../DB/dbfunctions/dbfunctions.dart';
import '../DB/model/datamodel.dart';

class EditController extends GetxController {
  String imgPath = 'x';

  imgUpdate() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImg != null) {
      imgPath = pickedImg.path;
    }
    update();
  }
updateStudent(int index, StudentModel student) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentDB.putAt(index, student);
  // studentListNotifier.value.removeAt(index);
  // studentListNotifier.value.insert(index, student);
  // studentListNotifier.notifyListeners();
  getAllStudents();
}
  // updateStudentCt(int index, StudentModel student) async {
  //   // final studentDB = await Hive.openBox<StudentModel>('student_db');
  //   // studentDB.putAt(index, student);

  //   // getAllStudents();
  //   updateStudent(index, student);
  // }
}
