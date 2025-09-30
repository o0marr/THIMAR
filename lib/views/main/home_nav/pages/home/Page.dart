import 'package:Thimar_amit/views/main/home_nav/pages/home/components/category_section.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/home/components/main_app_bar.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/home/components/product_section.dart';
import 'package:Thimar_amit/views/main/home_nav/pages/home/components/slider-section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SliderSection(),
            CategorySection(),
            ProductSection(),
          ],
        ),
      ),
    );
  }
}
