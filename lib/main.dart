import 'package:flutter/material.dart';
import 'package:store_app/screens/home-page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductService.id: (context) => UpdateProductService(),
      },
      initialRoute: HomePage.id,
    );
  }
}
