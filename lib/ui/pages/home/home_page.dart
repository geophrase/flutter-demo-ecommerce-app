import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../cart/cart_page.dart';


final List<Map<String, dynamic>> items = [
  {'name': 'T-Shirt', 'price': 190, 'id': 'tshirt'},
  {'name': 'Shoe', 'price': 400, 'id': 'shoe'},
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MyAppState _appState;
  Set<String> _cartItems = {};

  @override
  void initState() {
    super.initState();
    _appState = Provider.of<MyAppState>(context, listen: false);
  }

  void _addToCart(String item) {
    _appState.addCartItem(item);
    _cartItems.add(item);
    setState(() {
      _cartItems = _cartItems;
    });
  }

  void _removeFromCart(String item) {
    _appState.removeCartItem(item);
    _cartItems.remove(item);
    setState(() {
      _cartItems = _cartItems;
    });
  }

  void _goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('_cartItems: $_cartItems');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo Ecommerce Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 32),
                child: OutlinedButton.icon(
                  onPressed: () => const {},
                  icon: const Icon(Icons.login),
                  label: const Text('Sign In'),
                  iconAlignment: IconAlignment.start,
                ),
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center, // Center horizontally
                    child: SizedBox(
                      height: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 150,
                                height: 300,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/${item['id']}.png'),
                                    SizedBox(height: 8),
                                    Text(
                                      item['name'],
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "₹${item['price'].toString()}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    OutlinedButton.icon(
                                      onPressed: () => _cartItems.contains(item['id']) ? _removeFromCart(item['id']) : _addToCart(item['id']),
                                      icon: Icon(_cartItems.contains(item['id']) ? Icons.remove_shopping_cart : Icons.add_shopping_cart),
                                      label: Text(_cartItems.contains(item['id']) ? 'Remove' : 'Add'),
                                      iconAlignment: IconAlignment.start,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _goToCart,
              icon: const Icon(Icons.shopping_cart),
              label: Text('Go to cart (${_cartItems.length.toString()})'),
              iconAlignment: IconAlignment.start,
            ),
          ],
        ),
      ),
    );
  }
}
