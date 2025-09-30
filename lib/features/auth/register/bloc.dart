import 'dart:async';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';

part 'states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  final formKey= GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();


  RegisterBloc() : super(RegisterStates()) {
    on<RegisterEvent>(_Register);
  }


  Future<void> _Register(RegisterEvent event,
      Emitter<RegisterStates> emit,) async {
    emit(RegisterLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(RegisterSuccessState(msg: "Success"));
  }
}
