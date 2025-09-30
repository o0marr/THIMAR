import 'package:Thimar_amit/core/logic/cache_helper.dart';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:Thimar_amit/features/get_it.dart';
import 'package:Thimar_amit/firebase_options.dart';
import 'package:Thimar_amit/views/auth/login/view.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/home/Page.dart';
import 'package:Thimar_amit/views/my_account/addresses/view.dart';
import 'package:Thimar_amit/views/my_account/profile/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CachHelper.init();
  initGetIt();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        startLocale: Locale('en') ,
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: HomePage(),
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: child,
          title: 'Thimar',
          navigatorKey: navKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Tajawal",
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff9900ff)),
            useMaterial3: true,
            appBarTheme: AppBarTheme(
              color: Colors.white,
              centerTitle: true,
              surfaceTintColor: Colors.white,
              titleTextStyle: TextStyle(fontSize: 20,fontFamily: "Tajawal",fontWeight: FontWeight.w700,color: Color(
                  0xff9900ff)),


            ),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ))),
            filledButtonTheme: FilledButtonThemeData(
                style: FilledButton.styleFrom(
                    fixedSize: Size.fromHeight(60.h),
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ))),
            inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: Color(0xffF3F3F3),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
