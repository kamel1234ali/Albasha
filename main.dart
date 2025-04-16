
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String image;
  final double price;

  Product({required this.name, required this.image, required this.price});
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(name: "ماء", image: "assets/images/water.png", price: 2.0),
    Product(name: "عصير", image: "assets/images/juice.png", price: 3.5),
    Product(name: "خبز", image: "assets/images/bread.png", price: 1.5),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ميني ماركت الباشا',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(products: products),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Product> products;

  HomePage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ميني ماركت الباشا")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Image.asset(product.image, fit: BoxFit.cover)),
                Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${product.price.toStringAsFixed(2)} k', style: TextStyle(color: Colors.teal)),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("أضف إلى السلة"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
