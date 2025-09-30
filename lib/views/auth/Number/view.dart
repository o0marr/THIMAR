import 'package:Thimar_amit/core/design/app_button.dart';
import 'package:Thimar_amit/core/design/app_input.dart';
import 'package:Thimar_amit/core/logic/input_validator.dart';
import 'package:Thimar_amit/features/auth/Number/bloc.dart';
import 'package:Thimar_amit/views/auth/components/auth_header.dart';
import 'package:Thimar_amit/views/auth/components/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class NumberView extends StatefulWidget {
  const NumberView({Key? key}) : super(key: key);

  @override
  State<NumberView> createState() => _NumberViewState();
}

class _NumberViewState extends State<NumberView> {
  late final bloc = GetIt.I<NumberBloc>()..add(GetNumberEvent());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: bloc.formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [
                Column(
                  children: [
                    AuthHeader(
                      title: "نسيت كلمة المرور",
                      desc: "أدخل رقم الجوال المرتبط بحسابك",
                    ),
                    AppInput(
                      controller: bloc.phoneController,
                      label: "رقم الجوال",
                      validator: InputValidator.phone,
                      isPhone: true,
                      inputType: TextInputType.phone,
                      prefixIcon: "Phone.png",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          if (state is GetNumberLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return AppButton(
                                text: "تأكيد رقم الجوال",
                                onPress: () async {

                                  }
                                  // print(phoneController.text);
                                  // print(passwordController.text);
                                  // await CachHelper.setIsAuth();
                                  // await CachHelper.setPassword(
                                  //     passwordController.text);
                                  // await CachHelper.setPhone(phoneController.text);


                                  // navigateTo(HomeNavView(), KeepHistory: false);

                            );
                          }
                        }),
                    LoginOrRegister(
                      isFromLogin: false,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
