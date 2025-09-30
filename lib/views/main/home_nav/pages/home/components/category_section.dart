import 'package:Thimar_amit/core/design/app_image.dart';
import 'package:Thimar_amit/features/main/categories/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final bloc = GetIt.I<CategoriesBloc>()..add(GetCategoriesEvent());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(children: [
              Text(
                "الأقسام",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15.sp),
              ),
              Spacer(),
              TextButton(
                onPressed: () {},
                child: Text("عرض الكل",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor,
                    )),
              ),
            ]),
          ),
          SizedBox(
            height: 102.h,
            child: BlocBuilder(
              bloc: bloc,
              builder: (context,state) {
                return BlocBuilder(
                        bloc: bloc,
                        builder: (context,state) {
                          if (state is GetCategoriesFailedState) {
                            return Text(state.msg);
                          } else if (state is GetCategoriesSuccessState) {
                            return ListView.separated(
                              itemCount: state.list.length,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 16.w,
                              ),
                              itemBuilder: (context, index) => Container(
                                height: 100.h,
                                width: 100.w,
                                child: Column(
                                  children: [
                                    Expanded(child: AppImage(
                                        state.list[index].media
                                    )),
                                    SizedBox(height: 2.h,),
                                    Text(
                                      state.list[index].name,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500

                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );

                          }else {
                            return _Loading();
                          }
                        }
                    );
              }
            ),
          )
        ],
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        child: Container(
          height: 180.h,
          margin: EdgeInsets.only(top: 16),
          width: double.infinity,
          color: Colors.grey.withOpacity(.6),
        ),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
      ),
    );
  }
}

