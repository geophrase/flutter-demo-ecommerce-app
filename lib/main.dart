import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      home: const MyHomePage(title: 'Demo Ecommerce Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/tshirt.png'),
                          SizedBox(height: 8,),
                          Text('T-Shirt', textAlign: TextAlign.center,),
                          SizedBox(height: 8,),
                          Text('₹190', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
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
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 150,
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/shoe.png'),
                          SizedBox(height: 8,),
                          Text('Shoe', textAlign: TextAlign.center,),
                          SizedBox(height: 8,),
                          Text('₹400', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
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
                ),
              ],
            ),
            SizedBox(height: 32,),
            FilledButton.icon(
              onPressed: () => {},
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Go to cart'),
              iconAlignment: IconAlignment.start,
            ),
          ],
        ),
      ),
    );
  }
}
