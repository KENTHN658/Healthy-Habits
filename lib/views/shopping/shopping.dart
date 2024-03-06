import 'package:flutter/material.dart';
import 'package:mobiletest3/provider/coin_display_provider.dart';
import 'package:mobiletest3/widgets/coindisplay.dart';
import 'package:provider/provider.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  // Define a list of products
  final List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    // Add more products as needed
  ];

  // Define a method to handle product purchase
  void purchaseProduct(BuildContext context, CoinDisplayProvider coinProvider, Product product) {
    // Check if the user has enough points to make the purchase
    if (coinProvider.scorePoints >= product.price) {
      // Show a confirmation dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirm Purchase'),
          content: Text('Do you want to buy ${product.name} for ${product.price} points?'),
          actions: [
            TextButton(
              onPressed: () {
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Deduct points from the user's account based on the product price
                coinProvider.decrementScorePoints(product.price);

                // Display a toast message to confirm the purchase
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Purchased ${product.name}')));

                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: Text('Buy'),
            ),
          ],
        ),
      );
    } else {
      // Display a message informing the user that they have insufficient points
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Insufficient points')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping'),
        actions: [
          CoinDisplay(), // Display the number of coins
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('${product.price} points'),
            onTap: () {
              // Show confirmation dialog when tapped
              final coinProvider = Provider.of<CoinDisplayProvider>(context, listen: false);
              purchaseProduct(context, coinProvider, product);
            },
          );
        },
      ),
    );
  }
}

// Define a Product class to represent each product
class Product {
  final String name;
  final int price;

  Product({required this.name, required this.price});
}
