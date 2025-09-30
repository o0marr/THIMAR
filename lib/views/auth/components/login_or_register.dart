import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:Thimar_amit/views/auth/login/view.dart';
import 'package:Thimar_amit/views/auth/register/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginOrRegister extends StatelessWidget {
  final bool isFromLogin;

  const LoginOrRegister({Key? key,this.isFromLogin=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 45.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
               isFromLogin? "noAccount".tr():"haveAccount".tr(),
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor),
            ),
            TextButton(
                onPressed: () {
                  if( isFromLogin){
                    navigateTo(RegisterView());
                  }else{
                    navigateTo(LoginView());

                  }
                },
                child: Text(
                  isFromLogin? "registerNow".tr():"login".tr(),
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColor),
                ))
          ],
        )
      ],
    );
  }
}
