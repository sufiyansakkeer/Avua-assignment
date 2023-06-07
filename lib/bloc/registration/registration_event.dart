// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationInitialEvent extends RegistrationEvent {}

class RegistrationAddEvent extends RegistrationEvent {
  final RegistrationFormModel registrationFormModel;
  final BuildContext context;

  const RegistrationAddEvent({
    required this.registrationFormModel,
    required this.context,
  });
}

class RegistrationFilePick extends RegistrationEvent {}
