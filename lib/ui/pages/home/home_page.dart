import 'package:flutter/material.dart';

final List<Map<String, dynamic>> items = [
  {'name': 'T-Shirt', 'price': 190, 'image': 'tshirt'},
  {'name': 'Shoe', 'price': 400, 'image': 'shoe'},
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
                      height: 300,
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
                                    Image.asset('assets/${item['image']}.png'),
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
                                      onPressed: () => {},
                                      icon: const Icon(Icons.add_shopping_cart),
                                      label: const Text('Add to cart'),
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
              onPressed: () => {},
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Go to cart (0)'),
              iconAlignment: IconAlignment.start,
            ),
          ],
        ),
      ),
    );
  }
}
