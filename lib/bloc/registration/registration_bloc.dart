import 'dart:developer';
import 'dart:io';

import 'package:avua_assignment/model/registration_form/registration_form_model.dart';
import 'package:avua_assignment/repository/hive_functions.dart';
import 'package:avua_assignment/repository/registration_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    RegistrationServices reg = RegistrationServices();
    HiveFunctions functions = HiveFunctions();
    // file Picking event
    on<RegistrationFilePick>((event, emit) async {
      final result = await reg.getFile();
      if (result != null) {
        File pdfPath = File(result.files.single.path!);
        File pdfName = File(result.files.single.name);

        emit(RegistrationInitial());

        emit(RegistrationPickedState(pdfName: pdfName, pdfPath: pdfPath.path));
      } else {
        emit(RegistrationInitial());
      }
    });
    on<RegistrationInitialEvent>((event, emit) {
      emit(RegistrationInitial());
    });
    on<RegistrationAddEvent>((event, emit) async {
      await functions.addUser(event.registrationFormModel, event.context);

      log(event.registrationFormModel.toString());
    });
  }
}
