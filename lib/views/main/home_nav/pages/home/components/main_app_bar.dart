import 'package:Thimar_amit/core/design/app_image.dart';
import 'package:Thimar_amit/core/logic/cache_helper.dart';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:Thimar_amit/views/auth/login/view.dart';
import 'package:Thimar_amit/views/main/cart/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 88.w,
      surfaceTintColor: Colors.transparent,
      leading: Row(
        children: [
          GestureDetector(
            onTap: () async{
              await CachHelper.logout();
              navigateTo(LoginView(),KeepHistory: false);
            },
            child: AppImage(
              "Groups 1.png",
              height: 20.h,
              width: 20.w,
            ),
          ),
          SizedBox(width: 2.w,),
          Text(
            "سلة ثمار",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor),
          )
        ],
      ),
      title: Column(
        children: [
          Text("التوصيل إلى",style: TextStyle(fontSize:12 ,fontWeight: FontWeight.w900,color: Theme.of(context).primaryColor),),
          Text("شارع الملك فهد - جدة",style: TextStyle(fontSize:14 ,fontWeight: FontWeight.w400,color: Theme.of(context).primaryColor),),
        ],
      ),
      bottom: PreferredSize(
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              prefixIcon: Padding(
                padding:  EdgeInsetsDirectional.only(start: 21.w,end: 11.w),
                child: AppImage("Search2.png",height:16.h ,width:16.w,   color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
              hintText: "ابحث عن ماتريد؟",
              hintStyle: TextStyle(fontSize:15.sp ,
              fontWeight: FontWeight.w300,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Colors.transparent)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.transparent)
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: BorderSide(color: Colors.transparent)
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.03)
            ),
          ),
        ) ,
        preferredSize: Size.fromHeight(55.h),
      ),
      actions: [

        GestureDetector(
          onTap: () {
            navigateTo(CartView());
          },
          child: Container(
              padding: EdgeInsets.all(7.5.r),
              margin: EdgeInsetsDirectional.only(end: 16.w),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(.13),
                borderRadius: BorderRadius.circular(9.r),
              ),

              child: AppImage("Bag.png",height:18.58.h ,width:16.51.w ,)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(125.h);
}
