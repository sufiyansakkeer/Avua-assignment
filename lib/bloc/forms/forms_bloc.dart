import 'package:avua_assignment/resources/hive_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/registration_form/registration_form_model.dart';

part 'forms_event.dart';
part 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(FormsInitial()) {
    on<GetAllForms>((event, emit) async {
      emit(FormsLoadingState());
      HiveFunctions functions = HiveFunctions();
      List<RegistrationFormModel> formList = await functions.getAllForms();
      if (formList.isNotEmpty) {
        emit(FormsLoadedState(registrationForms: formList));
      } else {
        emit(FormsInitial());
      }
    });
  }
}
