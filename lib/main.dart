import 'package:consumindo_api_flutter/home/dio/dio_bindings.dart';
import 'package:consumindo_api_flutter/home/dio/dio_page.dart';
import 'package:consumindo_api_flutter/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Consumo de APIS',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/dio',
          page: () => const DioPage(),
          binding: DioBindings(),
        ),
      ],
    );
  }
}
