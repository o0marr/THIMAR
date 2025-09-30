import 'package:Thimar_amit/core/design/app_button.dart';
import 'package:Thimar_amit/core/design/app_image.dart';
import 'package:Thimar_amit/features/main/products/bloc.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/home/components/item_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({Key? key}) : super(key: key);

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  final bloc = GetIt.I<ProductsBloc>()..add(GetProductsEvent());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 27.9.h,
            ),
            Text(
              "الأصناف",
            ),
            SizedBox(
              height: 7.h,
            ),
            BlocBuilder(
                bloc: bloc,
                builder: (context, state) {
                  if (state is GetProductsFailedState) {
                    return Text(state.msg);
                  } else if (state is GetProductsSuccessState) {
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          childAspectRatio: 163.w / 250.h,
                          mainAxisSpacing: 16.h),
                      itemCount: state.list.length,
                      itemBuilder: (context, index) => ItemProducts(model: state.list[index]),
                    );
                  } else {
                    return _Loading();
                  }
                }),
          ],
        ));
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
