// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:pos_system/models/item.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            GestureDetector(
              onTap: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _imagePath = pickedFile.path;
                  });
                }
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey[200],
                child: _imagePath == null
                    ? const Icon(Icons.camera_alt)
                    : Image.file(File(_imagePath!)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newItem = Item(
                  name: _nameController.text,
                  price: double.parse(_priceController.text),
                  imagePath: _imagePath!,
                );
                Hive.box<Item>('itemsBox').add(newItem);
                Navigator.pop(context);
              },
              child: const Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
