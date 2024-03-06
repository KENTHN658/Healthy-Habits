import 'package:flutter/material.dart';

class PurchaseHistoryPage extends StatefulWidget {
  @override
  _PurchaseHistoryPageState createState() => _PurchaseHistoryPageState();
}

class _PurchaseHistoryPageState extends State<PurchaseHistoryPage> {
  List<Product> purchasedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purchase History'),
      ),
      body: purchasedProducts.isEmpty
          ? Center(
        child: Text('No products purchased yet'),
      )
          : ListView.builder(
        itemCount: purchasedProducts.length,
        itemBuilder: (context, index) {
          final product = purchasedProducts[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} points'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a sample product to the purchase history
          final product = Product(name: 'Sample Product', price: 10);
          setState(() {
            purchasedProducts.add(product);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Define a Product class to represent each purchased product
class Product {
  final String name;
  final int price;

  Product({required this.name, required this.price});
}
