// // ignore_for_file: unnecessary_import, library_private_types_in_public_api, unused_element, unused_import

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:pos_system/models/item.dart';
// import 'package:pos_system/utils/pdf_generator.dart';
// import 'package:pos_system/widgets/cart_widget.dart';
// import 'package:pos_system/widgets/item_card.dart';
// import 'package:pos_system/models/settings.dart';

// class POSWidget extends StatefulWidget {
//   const POSWidget({super.key});

//   @override
//   _POSWidgetState createState() => _POSWidgetState();
// }

// class _POSWidgetState extends State<POSWidget> {
//   final List<Item> _cart = [];
//   String? _selectedTableNumber;
//   // final List<String> _tableNumbers =
//   //     List<String>.generate(50, (index) => 'Table ${index + 1}');
// List<String> _tableNumbers = [];

//   double get _totalPrice =>
//       _cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

//   void _removeItemFromCart(Item item) {
//     setState(() {
//       if (item.quantity > 1) {
//         item.quantity--;
//       } else {
//         _cart.remove(item);
//       }
//     });
//   }

//   void _addItemToCart(Item item) {
//     setState(() {
//       final existingItem = _cart.firstWhere(
//           (cartItem) => cartItem.name == item.name,
//           orElse: () => Item(name: '', price: 0, imagePath: ''));
//       if (existingItem.name.isNotEmpty) {
//         existingItem.quantity++;
//       } else {
//         _cart.add(Item(
//             name: item.name,
//             price: item.price,
//             imagePath: item.imagePath,
//             quantity: 1));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: ValueListenableBuilder(
//             valueListenable: Hive.box<Item>('itemsBox').listenable(),
//             builder: (context, Box<Item> box, _) {
//               if (box.values.isEmpty) {
//                 return const Center(child: Text('No items'));
//               }

//               return GridView.builder(
//                 padding: const EdgeInsets.all(10),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 2 / 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: box.values.length,
//                 itemBuilder: (context, index) {
//                   final item = box.getAt(index);
//                   return GestureDetector(
//                     onTap: () {
//                       _addItemToCart(item);
//                     },
//                     child: ListView(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: ItemCard(
//                             item: item!,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//         const VerticalDivider(),
//         Expanded(
//           flex: 1,
//           child: Column(
//             children: [
//               DropdownButton<String>(
//                 value: _selectedTableNumber,
//                 hint: const Text('Select Table Number'),
//                 items: _tableNumbers.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedTableNumber = newValue;
//                   });
//                 },
//               ),
//               const Divider(),
//               Expanded(
//                 child: CartWidget(
//                   cart: _cart,
//                   onRemove: _removeItemFromCart,
//                 ),
//               ),
//               const Divider(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text('Total: \$${_totalPrice.toStringAsFixed(2)}',
//                         style: const TextStyle(fontSize: 18)),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_selectedTableNumber != null) {
//                               generateAndPrintInvoice(
//                                   _cart, _totalPrice, _selectedTableNumber!);
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content:
//                                         Text('Please select a table number')),
//                               );
//                             }
//                           },
//                           child: const Text('Print Cart'),
//                         ),
//                         const SizedBox(width: 20),
//                         ElevatedButton(
//                           onPressed: () async {
//                             if (_selectedTableNumber != null) {
//                               await downloadInvoice(context, _cart, _totalPrice,
//                                   _selectedTableNumber!);
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content:
//                                         Text('Please select a table number')),
//                               );
//                             }
//                           },
//                           child: const Text('Download Cart'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// // floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const AddItemPage()),
// //           );
// //         },
// //         child: const Icon(Icons.add),
// //       ),

// // ignore_for_file: unnecessary_import, library_private_types_in_public_api, unused_element, unused_import

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:pos_system/models/item.dart';
// import 'package:pos_system/utils/pdf_generator.dart';
// import 'package:pos_system/widgets/cart_widget.dart';
// import 'package:pos_system/widgets/item_card.dart';
// import 'package:pos_system/models/settings.dart';

// class POSWidget extends StatefulWidget {
//   const POSWidget({super.key});

//   @override
//   _POSWidgetState createState() => _POSWidgetState();
// }

// class _POSWidgetState extends State<POSWidget> {
//   final List<Item> _cart = [];
//   String? _selectedTableNumber;
//   List<String> _tableNumbers = [];
//   String _restaurantName = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() {
//     final settingsBox = Hive.box<Settings>('settingsBox');
//     final settings = settingsBox.get('settings') ??
//         Settings(numberOfTables: 0, restaurantName: '');
//     setState(() {
//       _tableNumbers = List<String>.generate(
//           settings.numberOfTables, (index) => 'Table ${index + 1}');
//       _restaurantName = settings.restaurantName;
//     });
//   }

//   double get _totalPrice =>
//       _cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

//   void _removeItemFromCart(Item item) {
//     setState(() {
//       if (item.quantity > 1) {
//         item.quantity--;
//       } else {
//         _cart.remove(item);
//       }
//     });
//   }

//   void _addItemToCart(Item item) {
//     setState(() {
//       final existingItem = _cart.firstWhere(
//           (cartItem) => cartItem.name == item.name,
//           orElse: () => Item(name: '', price: 0, imagePath: ''));
//       if (existingItem.name.isNotEmpty) {
//         existingItem.quantity++;
//       } else {
//         _cart.add(Item(
//             name: item.name,
//             price: item.price,
//             imagePath: item.imagePath,
//             quantity: 1));
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 2,
//           child: ValueListenableBuilder(
//             valueListenable: Hive.box<Item>('itemsBox').listenable(),
//             builder: (context, Box<Item> box, _) {
//               if (box.values.isEmpty) {
//                 return const Center(child: Text('No items'));
//               }

//               return GridView.builder(
//                 padding: const EdgeInsets.all(10),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 2 / 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemCount: box.values.length,
//                 itemBuilder: (context, index) {
//                   final item = box.getAt(index);
//                   return GestureDetector(
//                     onTap: () {
//                       _addItemToCart(item);
//                     },
//                     child: ListView(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: ItemCard(
//                             item: item!,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//         const VerticalDivider(),
//         Expanded(
//           flex: 1,
//           child: Column(
//             children: [
//               DropdownButton<String>(
//                 value: _selectedTableNumber,
//                 hint: const Text('Select Table Number'),
//                 items: _tableNumbers.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (newValue) {
//                   setState(() {
//                     _selectedTableNumber = newValue;
//                   });
//                 },
//               ),
//               const Divider(),
//               Expanded(
//                 child: CartWidget(
//                   cart: _cart,
//                   onRemove: _removeItemFromCart,
//                 ),
//               ),
//               const Divider(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Text('Total: \$${_totalPrice.toStringAsFixed(2)}',
//                         style: const TextStyle(fontSize: 18)),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             if (_selectedTableNumber != null) {
//                               generateAndPrintInvoice(_cart, _totalPrice,
//                                   _selectedTableNumber!, _restaurantName);
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content:
//                                         Text('Please select a table number')),
//                               );
//                             }
//                           },
//                           child: const Text('Print Cart'),
//                         ),
//                         const SizedBox(width: 20),
//                         ElevatedButton(
//                           onPressed: () async {
//                             if (_selectedTableNumber != null) {
//                               await downloadInvoice(context, _cart, _totalPrice,
//                                   _selectedTableNumber!, _restaurantName);
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                     content:
//                                         Text('Please select a table number')),
//                               );
//                             }
//                           },
//                           child: const Text('Download Cart'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// pos_widget.dart

// ignore_for_file: library_private_types_in_public_api, unused_import, unnecessary_import

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pos_system/models/item.dart';
import 'package:pos_system/utils/pdf_generator.dart';
import 'package:pos_system/widgets/cart_widget.dart';
import 'package:pos_system/widgets/item_card.dart';
import 'package:pos_system/models/settings.dart';

class POSWidget extends StatefulWidget {
  final List<Item> cart;
  final String? selectedTableNumber;
  final List<String> tableNumbers;
  final String restaurantName;
  final Function(Item) onAddItem;
  final Function(Item) onRemoveItem;
  final Function(String?) onSelectTableNumber;

  const POSWidget({
    super.key,
    required this.cart,
    this.selectedTableNumber,
    required this.tableNumbers,
    required this.restaurantName,
    required this.onAddItem,
    required this.onRemoveItem,
    required this.onSelectTableNumber,
  });

  @override
  _POSWidgetState createState() => _POSWidgetState();
}

class _POSWidgetState extends State<POSWidget> {
  double get _totalPrice =>
      widget.cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void _saveInvoice() async {
    final invoiceBox = await Hive.openBox('invoicesBox');
    final newInvoice = {
      'totalPrice': _totalPrice,
      'dateTime': DateTime.now().toString(),
    };
    invoiceBox.add(newInvoice);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ValueListenableBuilder(
            valueListenable: Hive.box<Item>('itemsBox').listenable(),
            builder: (context, Box<Item> box, _) {
              if (box.values.isEmpty) {
                return const Center(child: Text('No items'));
              }

              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.9 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  final item = box.getAt(index);
                  return GestureDetector(
                    onTap: () {
                      widget.onAddItem(item);
                    },
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ItemCard(
                            item: item!,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
        const VerticalDivider(),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              DropdownButton<String>(
                value: widget.selectedTableNumber,
                hint: const Text('Select Table Number'),
                items: widget.tableNumbers.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  widget.onSelectTableNumber(newValue);
                },
              ),
              const Divider(),
              Expanded(
                child: CartWidget(
                  cart: widget.cart,
                  onRemove: widget.onRemoveItem,
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Total: \$${_totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (widget.selectedTableNumber != null) {
                              generateAndPrintInvoice(
                                  widget.cart,
                                  _totalPrice,
                                  widget.selectedTableNumber!,
                                  widget.restaurantName);
                              _saveInvoice(); // Save the invoice when printing
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please select a table number')),
                              );
                            }
                          },
                          child: const Text('Print Cart'),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (widget.selectedTableNumber != null) {
                              await downloadInvoice(
                                  context,
                                  widget.cart,
                                  _totalPrice,
                                  widget.selectedTableNumber!,
                                  widget.restaurantName);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Please select a table number')),
                              );
                            }
                          },
                          child: const Text('Download Cart'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
