import 'package:avua_assignment/model/registration_form/registration_form_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveFunctions {
  final String _registrationDB = "RegistrationDataBase";
  // add function
  Future<void> addUser(
      RegistrationFormModel formModel, BuildContext context) async {
    var box = await Hive.openBox<RegistrationFormModel>(_registrationDB);
    box.put(formModel.id, formModel);
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  // get all data function
  Future<List<RegistrationFormModel>> getAllForms() async {
    var box = await Hive.openBox<RegistrationFormModel>(_registrationDB);
    List<RegistrationFormModel> formList = box.values.toList();
    return formList;
  }

  //
}
