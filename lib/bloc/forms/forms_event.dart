part of 'forms_bloc.dart';

abstract class FormsEvent extends Equatable {
  const FormsEvent();

  @override
  List<Object> get props => [];
}

class GetAllForms extends FormsEvent {}
