import 'dart:async';

import 'package:Thimar_amit/core/design/app_image.dart';
import 'package:Thimar_amit/core/logic/cache_helper.dart';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:Thimar_amit/views/auth/login/view.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/home/Page.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SplachView extends StatefulWidget {
  const SplachView({Key? key}) : super(key: key);

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {

  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if(CachHelper.isAuth){
        navigateTo(HomePage(),KeepHistory: false);
      }else{
        navigateTo(LoginView(),KeepHistory: false);

      }

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          AppImage(
            "bg.svg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          PositionedDirectional(
            top: 350.79,
            start: 128.14,
            child: AppImage(
              "base.png",
              height: 125,
              width: 140,
              fit: BoxFit.fill,
            ),
          ),
          PositionedDirectional(
            top: 375.63,
            start: 208,
            child: SpinPerfect(
              duration: Duration(seconds: 2),
              child: AppImage(
                "branch.png",
                height: 108.02,
                width: 84,
                fit: BoxFit.fill,
              ),
            ),
          ),
          PositionedDirectional(
            top: 328,
            start: 173.94,
            child: SlideInDown(
              duration: Duration(seconds: 2),
              child: AppImage(
                "leves.png",
                height: 28,
                width: 46,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
