part of 'forms_bloc.dart';

abstract class FormsState extends Equatable {
  const FormsState();

  @override
  List<Object> get props => [];
}

class FormsInitial extends FormsState {}

class FormsLoadingState extends FormsState {}

class FormsLoadedState extends FormsState {
  final List<RegistrationFormModel> registrationForms;

  const FormsLoadedState({required this.registrationForms});
}
