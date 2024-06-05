// import 'package:flutter/material.dart';
// import 'package:pos_system/models/item.dart';
// import 'dart:io';

// class CartWidget extends StatelessWidget {
//   final List<Item> cart;
//   final Function(Item) onRemove;

//   const CartWidget({
//     super.key,
//     required this.cart,
//     required this.onRemove,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: cart.length,
//       itemBuilder: (context, index) {
//         final item = cart[index];
//         return GestureDetector(
//           onTap: () => onRemove(item),
//           child: Card(
//             child: ListTile(
//               leading: Image.file(
//                 File(item.imagePath),
//                 cacheHeight: 150,
//                 cacheWidth: 150,
//               ),
//               title: Text(item.name),
//               subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:pos_system/models/item.dart';
import 'dart:io';

class CartWidget extends StatelessWidget {
  final List<Item> cart;
  final Function(Item) onRemove;

  const CartWidget({
    super.key,
    required this.cart,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (context, index) {
        final item = cart[index];
        return GestureDetector(
          onTap: () => onRemove(item),
          child: Card(
            child: ListTile(
              leading: Image.file(
                File(item.imagePath),
                cacheHeight: 150,
                cacheWidth: 150,
              ),
              title: Text(item.name),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              trailing: Text('Qty: ${item.quantity}'),
            ),
          ),
        );
      },
    );
  }
}
