import 'package:hive/hive.dart';

part 'registration_form_model.g.dart';

@HiveType(typeId: 1)
class RegistrationFormModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final int phoneNumber;
  @HiveField(6)
  final String resume;

  RegistrationFormModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.date,
    required this.email,
    required this.phoneNumber,
    required this.resume,
  });
}
