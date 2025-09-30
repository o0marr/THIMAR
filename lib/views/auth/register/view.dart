import 'package:Thimar_amit/core/design/app_button.dart';
import 'package:Thimar_amit/core/design/app_input.dart';
import 'package:Thimar_amit/core/logic/cache_helper.dart';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:Thimar_amit/core/logic/input_validator.dart';
import 'package:Thimar_amit/features/auth/register/bloc.dart';

import 'package:Thimar_amit/views/auth/Number/view.dart';
import 'package:Thimar_amit/views/auth/components/auth_header.dart';
import 'package:Thimar_amit/views/auth/components/login_or_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late RegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of(context);


  }

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
                      title: "مرحبا بك مرة أخرى",
                      desc: "يمكنك تسجيل حساب جديد الأن",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    AppInput(
                      controller:bloc.nameController,
                      label: "اسم المستخدم",
                      isName: true,
                      prefixIcon: "User.png",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),


                    AppInput(
                      controller:bloc.phoneController ,
                      label: "رقم الجوال",
                      validator: InputValidator.phone,
                      isPhone: true,
                      inputType: TextInputType.phone,
                      prefixIcon: "Phone.png",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),

                    AppInput(
                      controller:bloc.countryController ,
                      label: "المدينة",
                      isCountry: true,
                      prefixIcon: "Report.png",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppInput(
                      controller:bloc.passwordController ,
                      label: "كلمة المرور",
                      validator: InputValidator.password,
                      isPassword: true,
                      prefixIcon: "Unlock.png",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    AppInput(
                      controller: bloc.passwordConfirmController ,
                      label: "تأكيد كلمة المرور ",
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
                          "نسيت كلمة المرور ؟",
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
                          if (state is RegisterLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return AppButton(
                                text: "تسجيل",
                                onPress: () async {

                                  }
                                  // print(phoneController.text);
                                  // print(passwordController.text);
                                  // await CachHelper.setIsAuth();
                                  // await CachHelper.setPassword(
                                  // passwordController.text);
                                  // await CachHelper.setPhone(phoneController.text);


                                  // navigateTo(HomePage(), KeepHistory: false);

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

