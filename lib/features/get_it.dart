import 'package:Thimar_amit/features/auth/Number/bloc.dart';
import 'package:Thimar_amit/features/auth/login/bloc.dart';
import 'package:Thimar_amit/features/auth/register/bloc.dart';
import 'package:Thimar_amit/features/main/categories/bloc.dart';
import 'package:Thimar_amit/features/main/products/bloc.dart';
import 'package:Thimar_amit/features/main/slider/bloc.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/favs/view.dart';
import 'package:get_it/get_it.dart';

void initGetIt(){
  final container = GetIt.instance;
  container.registerFactory(() =>  RegisterBloc());
  container.registerFactory(() =>  LoginBloc());
  // container.registerFactory(() =>  NumberBloc());
  container.registerFactory(() =>  FavsPage());
  container.registerFactory(() =>  SliderBloc());
  container.registerFactory(() =>  ProductsBloc());
  container.registerFactory(() =>  CategoriesBloc());

}
