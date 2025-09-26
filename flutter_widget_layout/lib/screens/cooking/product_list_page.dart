import 'package:flutter/material.dart';
import 'package:testflutter/widgets/cooking/product_card.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {"name": "Orange", "stock": 1000, "price": 15},
    {"name": "Apple", "stock": 1000, "price": 20},
    {"name": "Banana", "stock": 1000, "price": 5},
    {"name": "Mango", "stock": 1000, "price": 15},
    {"name": "Orange", "stock": 1000, "price": 10},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ProductCard(
            name: item['name'],
            stock: item['stock'],
            price: item['price'],
          );
        },
      ),
    );
  }
}