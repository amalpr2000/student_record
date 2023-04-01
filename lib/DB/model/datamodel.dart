import 'package:hive_flutter/adapters.dart';
part 'datamodel.g.dart';
@HiveType(typeId: 1, adapterName: 'StudentAdapter')
class StudentModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;
  @HiveField(2)
  final String phone;
  @HiveField(3)
  final String email;
  @HiveField(4)
  late final String image;
  
  StudentModel({
    required this.name,
    required this.age,
    required this.phone,
    required this.email,
    required this.image,
  });
}
