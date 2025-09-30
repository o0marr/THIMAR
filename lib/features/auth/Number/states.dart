part of 'bloc.dart';

class NumberStates {}

class GetNumberLoadingState extends NumberStates {}

class GetNumberSuccessState extends NumberStates {
  final String msg;

  GetNumberSuccessState({required this.msg});
}

class GetNumberFailedState extends NumberStates {
  final String msg;

  GetNumberFailedState({required this.msg});
}
