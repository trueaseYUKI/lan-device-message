// lib/pages/routes/routes.dart
import 'package:flutter/material.dart';
import '../main_screen.dart';
import '../home.dart';
import '../chat.dart';
import '../settings.dart';

class AppRouter {
  static const String home = '/home';
  static const String chat = '/chat';
  static const String setting = '/settings';
  static const String main = '/main';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      case setting:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('页面未找到: ${settings.name}'))),
        );
    }
  }

  // 路由跳转方法
  static void push(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  // 替换当前路由
  static void pushReplacement(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  // 清除所有路由并跳转
  static void pushAndRemoveUntil(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}
