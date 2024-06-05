// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_system/models/item.dart';
import 'package:pos_system/screens/edit_item_page.dart';

class ManageItemsPage extends StatelessWidget {
  const ManageItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Items'),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Item>('itemsBox').listenable(),
        builder: (context, Box<Item> box, _) {
          if (box.values.isEmpty) {
            return const Center(child: Text('No items'));
          }

          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index) {
              final item = box.getAt(index);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    subtitle: Text('\$${item?.price.toStringAsFixed(2)}'),
                    title: Text(item!.name),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditItemPage(item: item),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog(context, box, index);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Box<Item> box, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                box.deleteAt(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
