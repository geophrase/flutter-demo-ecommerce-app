import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../../utils/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late MyAppState _appState;
  late Set<String> _cartItems;

  @override
  void initState() {
    super.initState();
    _appState = Provider.of<MyAppState>(context, listen: false);
    _cartItems = _appState.cartItems;
  }

  void _removeFromCart(String item) {
    _appState.removeCartItem(item);
    _cartItems.remove(item);
    setState(() {
      _cartItems = _cartItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> cartItems = _cartItems.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Review Your Order'),
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final itemId = cartItems[index];
                final item = shoppingItems.firstWhere(
                  (element) => element['id'] == itemId,
                );

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Image.asset('assets/$itemId.png', height: 150),
                          Spacer(),
                          Column(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(item['name'], textAlign: TextAlign.center),
                              Text(
                                "₹${item['price'].toString()}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          OutlinedButton.icon(
                            onPressed: () => _removeFromCart(itemId),
                            icon: Icon(Icons.remove_shopping_cart),
                            label: Text('Remove'),
                            iconAlignment: IconAlignment.start,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
