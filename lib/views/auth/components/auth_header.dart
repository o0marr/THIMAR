import 'package:Thimar_amit/core/design/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AuthHeader extends StatelessWidget {
  final String title,desc;
  const AuthHeader({Key? key, required this.title, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: AppImage(
            "Groups 1.png",
            height: 125.72,
            width: 129.83,
          ),
        ),
        SizedBox(height: 21.h),
        Text(
          title,
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor),
        ),
        SizedBox(height: 10.h),
        Text(
         desc,
          style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xff707070)),
        ),
        SizedBox(
          height: 28.h,
        ),
      ],
    );
  }
}
