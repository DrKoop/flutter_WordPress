import 'package:flutter/material.dart';
import 'package:flutter_drk_woocommerce/blog_w.dart';
import 'package:flutter_drk_woocommerce/home.dart';
import 'package:flutter_drk_woocommerce/navbar.dart';
import 'package:flutter_drk_woocommerce/screens/posts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlogWordPress(),   //HomePageproducts(),
      initialRoute: BlogWordPress.routeName,
      routes: {
        BlogWordPress.routeName :(context) => BlogWordPress(),
        DetailPost.routeName :(context) => DetailPost(),
        HomePageproducts.routeName :(context) =>  HomePageproducts()
      },
    );
  }
}
