part of 'forms_bloc.dart';

abstract class FormsState extends Equatable {
  const FormsState();

  @override
  List<Object> get props => [];
}

class FormsInitial extends FormsState {}

class FormsLoadingState extends FormState {}

class FormsLoadedState extends FormState {
  final List<RegistrationFormModel> registrationForms;

  FormsLoadedState({required this.registrationForms});
}
