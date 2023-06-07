part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationPickedState extends RegistrationState {
  final File pdfName;
  final String pdfPath;

  const RegistrationPickedState({required this.pdfName, required this.pdfPath});
}
