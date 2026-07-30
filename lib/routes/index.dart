import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

// 返回 App 根级组件
Widget getRootWidget() {
  return MaterialApp(
    initialRoute: "/",
    routes: getRouteRoutes(),
  );
}

// 路由
Map<String, Widget Function(BuildContext)> getRouteRoutes() {
  return {
    "/":(context) => MainPage(),
    "/login":(context) => LoginPage(),
  };
}