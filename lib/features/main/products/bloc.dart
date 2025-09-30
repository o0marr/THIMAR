import 'dart:async';
import 'package:Thimar_amit/core/logic/helper_methods.dart';
import 'package:Thimar_amit/features/main/products/model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';

part 'states.dart';

class ProductsBloc extends Bloc<ProductsEvents, ProductsStates> {
  ProductsBloc() : super(ProductsStates()) {
    on<GetProductsEvent>(_getData);
  }


  Future<void> _getData(GetProductsEvent event,
      Emitter<ProductsStates> emit,) async {
    emit(GetProductsLoadingState());
    final response= await Dio().get("https://thimar.amr.aait-d.com/api/products");
    final model =ProductsData.fromJson(response.data);
    print(model.list.length);
    emit(GetProductsSuccessState(msg: "Success",list: model.list));
  }
}
