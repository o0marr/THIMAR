import 'package:Thimar_amit/core/design/app_button.dart';
import 'package:Thimar_amit/core/design/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FavsPage extends StatefulWidget {
  const FavsPage({Key? key}) : super(key: key);

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(
        "المفضلة",
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 15.sp,
        ),
      ),),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            childAspectRatio: 163.w / 250.h,
            mainAxisSpacing: 16.h),
        itemCount: 15,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(9.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment:  AlignmentDirectional.topEnd,
                  children: [
                    AppImage(
                      "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRemk0pOj3avWb06RvabQarkPJ-BUaZPIT9UjLWrwM6xL8TyRbj",
                      height: 110.h,
                      width: double.infinity.w,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 1.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(11.r),
                                bottomStart: Radius.circular(7.r)
                            ),
                          color: Theme.of(context).primaryColor),
                      child: Text(
                        textDirection: TextDirection.ltr,
                        "-45%",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.4.h),
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "طماطم",
                style: TextStyle(
                    fontSize: 16.sp,
                    height: 2.1.h,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor),
              ),
              Text(
                "السعر / 1كجم",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff808080)),
              ),
              Row(
                children: [
                  Text(
                    "45 ر.س",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    "56 ر.س",
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.lineThrough,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 9.h,
              ),
              SizedBox(
                height: 30.h,
                width: double.infinity,
                child: AppButton(
                  text: "أضف للسلة",
                  onPress: () {},
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.09),
                    offset: Offset(0,2),
                    blurRadius: 11,
                    blurStyle: BlurStyle.outer
                )
              ]
          ),
        ),
      ) ,
    );
  }
}
