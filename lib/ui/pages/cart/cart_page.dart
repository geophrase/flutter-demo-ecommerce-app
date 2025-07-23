import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late MyAppState _appState;

  @override
  void initState() {
    super.initState();
    _appState = Provider.of<MyAppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Route')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back! ${_appState.cartItems}'),
        ),
      ),
    );
  }
}
