import 'package:Thimar_amit/core/design/app_button.dart';
import 'package:Thimar_amit/core/design/app_input.dart';
import 'package:Thimar_amit/core/logic/cache_helper.dart';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:Thimar_amit/core/logic/input_validator.dart';
import 'package:Thimar_amit/features/auth/login/bloc.dart';
import 'package:Thimar_amit/views/auth/Number/view.dart';
import 'package:Thimar_amit/views/auth/components/auth_header.dart';
import 'package:Thimar_amit/views/auth/components/login_or_register.dart';
import 'package:Thimar_amit/views/forget_password/view.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/home/Page.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final bloc = GetIt.I <LoginBloc>() ;

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
                      title: "welcomeAgain".tr(),
                      desc: "youCanRegisterNow".tr(),
                    ),
                    AppInput(
                      controller: bloc.phoneController,
                      label: "phone".tr(),
                      validator: InputValidator.phone,
                      isPhone: true,
                      inputType: TextInputType.phone,
                      prefixIcon: "Phone.png",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppInput(
                      controller: bloc.passwordController,
                      label: "password".tr(),
                      validator: InputValidator.password,
                      isPassword: true,
                      prefixIcon: "Unlock.png",
                    ),
                    GestureDetector(
                      onTap: () {
                        // navigateTo(NumberView());
                      },
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "forgetPassword".tr(),
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff707070)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    BlocBuilder(
                        bloc: bloc,
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return AppButton(
                                text: "login".tr(),
                                onPress: () async {
                                  bloc.add(LoginEvent());
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
                      isFromLogin: true,),
                    IconButton(onPressed: () {
                      String currentLang=context.locale.languageCode;
                      context.setLocale(Locale(currentLang=="en"?"ar":"en"));
                    }, icon: Icon(Icons.language))
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
