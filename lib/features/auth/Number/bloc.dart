import 'dart:async';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';

part 'states.dart';

class NumberBloc extends Bloc<NumberEvents, NumberStates> {
  final formKey= GlobalKey<FormState>();
  final phoneController = TextEditingController();


  NumberBloc() : super(NumberStates()) {
    on<GetNumberEvent>(_getData);
  }



  Future<void> _getData(GetNumberEvent event,
      Emitter<NumberStates> emit,) async {
    emit(GetNumberLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(GetNumberSuccessState(msg: "Success"));
  }
}
