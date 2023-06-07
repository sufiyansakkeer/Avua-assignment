import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/registration_form/registration_form_model.dart';

part 'forms_event.dart';
part 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(FormsInitial()) {
    on<GetAllForms>((event, emit) {});
  }
}
