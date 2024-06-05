import 'package:flutter/material.dart';
import 'package:pos_system/models/item.dart';
import 'dart:io';

class ItemCard extends StatelessWidget {
  final Item item;
  // final VoidCallback onAddToCart;

  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.file(
            File(item.imagePath),
            cacheHeight: 150,
            cacheWidth: 150,
          ),
          Text(item.name),
          Text('\$${item.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
