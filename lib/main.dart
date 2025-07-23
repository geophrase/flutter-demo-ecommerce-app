import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo_ecommerce_app/ui/pages/home/home_page.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) {
        MyAppState myAppState = MyAppState();
        myAppState.setIsLoggedIn(false);
        return myAppState;
      },
      child: const MyApp(),
    ),
  );
}

class MyAppState extends ChangeNotifier {
  bool _isLoggedIn = false;
  final Set<String> _cartItems = {};

  bool get isLoggedIn => _isLoggedIn;
  Set<String> get cartItems => _cartItems;

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
    notifyListeners();
  }

  void addCartItem(String item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeCartItem(String item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Ecommerce',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}
