// // // ignore_for_file: unnecessary_import, library_private_types_in_public_api

// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:pos_system/models/item.dart';
// // import 'package:pos_system/screens/add_item_page.dart';
// // import 'package:pos_system/utils/pdf_generator.dart';
// // import 'package:pos_system/widgets/cart_widget.dart';
// // import 'package:pos_system/widgets/item_card.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final List<Item> _cart = [];

// //   double get _totalPrice => _cart.fold(0, (sum, item) => sum + item.price);

// //   void _removeItemFromCart(Item item) {
// //     setState(() {
// //       _cart.remove(item);
// //     });
// //   }

// //   void _addItemToCart(Item item) {
// //     setState(() {
// //       _cart.add(item);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('POS System'),
// //       ),
// //       body: Row(
// //         children: [
// //           Expanded(
// //             flex: 3,
// //             child: ValueListenableBuilder(
// //               valueListenable: Hive.box<Item>('itemsBox').listenable(),
// //               builder: (context, Box<Item> box, _) {
// //                 if (box.values.isEmpty) {
// //                   return const Center(child: Text('No items'));
// //                 }

// //                 return GridView.builder(
// //                   padding: const EdgeInsets.all(10),
// //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 3, // Number of columns in the grid
// //                     childAspectRatio: 2 / 2, // Aspect ratio of each item
// //                     crossAxisSpacing: 10, // Horizontal space between items
// //                     mainAxisSpacing: 10, // Vertical space between items
// //                   ),
// //                   itemCount: box.values.length,
// //                   itemBuilder: (context, index) {
// //                     final item = box.getAt(index);
// //                     return GestureDetector(
// //                       onTap: () {
// //                         _addItemToCart(item);
// //                       },
// //                       child: ListView(
// //                         children: [
// //                           Padding(
// //                               padding: const EdgeInsets.all(10.0),
// //                               child: ItemCard(
// //                                 item: item!,
// //                               )),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           const VerticalDivider(),
// //           Expanded(
// //             flex: 2,
// //             child: Column(
// //               children: [
// //                 Expanded(
// //                   child: CartWidget(
// //                     cart: _cart,
// //                     onRemove: _removeItemFromCart,
// //                   ),
// //                 ),
// //                 const Divider(),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(
// //                     children: [
// //                       Text('Total: \$${_totalPrice.toStringAsFixed(2)}',
// //                           style: const TextStyle(fontSize: 18)),
// //                       const SizedBox(height: 10),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           generateAndPrintInvoice(_cart, _totalPrice);
// //                         },
// //                         child: const Text('Print Cart'),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const AddItemPage()),
// //           );
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

// // // ignore_for_file: library_private_types_in_public_api, unnecessary_import

// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:pos_system/models/item.dart';
// // import 'package:pos_system/screens/add_item_page.dart';
// // import 'package:pos_system/screens/manage_item_page.dart';
// // import 'package:pos_system/utils/pdf_generator.dart';
// // import 'package:pos_system/widgets/cart_widget.dart';
// // import 'package:pos_system/widgets/item_card.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final List<Item> _cart = [];

// //   double get _totalPrice =>
// //       _cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

// //   void _removeItemFromCart(Item item) {
// //     setState(() {
// //       if (item.quantity > 1) {
// //         item.quantity--;
// //       } else {
// //         _cart.remove(item);
// //       }
// //     });
// //   }

// //   void _addItemToCart(Item item) {
// //     setState(() {
// //       final existingItem = _cart.firstWhere(
// //           (cartItem) => cartItem.name == item.name,
// //           orElse: () => Item(name: '', price: 0, imagePath: ''));
// //       if (existingItem.name.isNotEmpty) {
// //         existingItem.quantity++;
// //       } else {
// //         _cart.add(Item(
// //             name: item.name,
// //             price: item.price,
// //             imagePath: item.imagePath,
// //             quantity: 1));
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.settings),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                     builder: (context) => const ManageItemsPage()),
// //               );
// //             },
// //           )
// //         ],
// //         title: const Text('POS System'),
// //       ),
// //       body: Row(
// //         children: [
// //           Expanded(
// //             flex: 3,
// //             child: ValueListenableBuilder(
// //               valueListenable: Hive.box<Item>('itemsBox').listenable(),
// //               builder: (context, Box<Item> box, _) {
// //                 if (box.values.isEmpty) {
// //                   return const Center(child: Text('No items'));
// //                 }

// //                 return GridView.builder(
// //                   padding: const EdgeInsets.all(10),
// //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 3,
// //                     childAspectRatio: 2 / 2,
// //                     crossAxisSpacing: 10,
// //                     mainAxisSpacing: 10,
// //                   ),
// //                   itemCount: box.values.length,
// //                   itemBuilder: (context, index) {
// //                     final item = box.getAt(index);
// //                     return GestureDetector(
// //                       onTap: () {
// //                         _addItemToCart(item);
// //                       },
// //                       child: ListView(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(10.0),
// //                             child: ItemCard(
// //                               item: item!,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           const VerticalDivider(),
// //           Expanded(
// //             flex: 2,
// //             child: Column(
// //               children: [
// //                 Expanded(
// //                   child: CartWidget(
// //                     cart: _cart,
// //                     onRemove: _removeItemFromCart,
// //                   ),
// //                 ),
// //                 const Divider(),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(
// //                     children: [
// //                       Text('Total: \$${_totalPrice.toStringAsFixed(2)}',
// //                           style: const TextStyle(fontSize: 18)),
// //                       const SizedBox(height: 10),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           generateAndPrintInvoice(_cart, _totalPrice);
// //                         },
// //                         child: const Text('Print Cart'),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const AddItemPage()),
// //           );
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

// // // ignore_for_file: library_private_types_in_public_api, unnecessary_import

// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:pos_system/models/item.dart';
// // import 'package:pos_system/screens/add_item_page.dart';
// // import 'package:pos_system/screens/manage_item_page.dart';
// // import 'package:pos_system/utils/pdf_generator.dart';
// // import 'package:pos_system/widgets/cart_widget.dart';
// // import 'package:pos_system/widgets/item_card.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final List<Item> _cart = [];

// //   double get _totalPrice =>
// //       _cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

// //   void _removeItemFromCart(Item item) {
// //     setState(() {
// //       if (item.quantity > 1) {
// //         item.quantity--;
// //       } else {
// //         _cart.remove(item);
// //       }
// //     });
// //   }

// //   void _addItemToCart(Item item) {
// //     setState(() {
// //       final existingItem = _cart.firstWhere(
// //           (cartItem) => cartItem.name == item.name,
// //           orElse: () => Item(name: '', price: 0, imagePath: ''));
// //       if (existingItem.name.isNotEmpty) {
// //         existingItem.quantity++;
// //       } else {
// //         _cart.add(Item(
// //             name: item.name,
// //             price: item.price,
// //             imagePath: item.imagePath,
// //             quantity: 1));
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.settings),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                     builder: (context) => const ManageItemsPage()),
// //               );
// //             },
// //           )
// //         ],
// //         title: const Text('POS System'),
// //       ),
// //       body: Row(
// //         children: [
// //           Expanded(
// //             flex: 3,
// //             child: ValueListenableBuilder(
// //               valueListenable: Hive.box<Item>('itemsBox').listenable(),
// //               builder: (context, Box<Item> box, _) {
// //                 if (box.values.isEmpty) {
// //                   return const Center(child: Text('No items'));
// //                 }

// //                 return GridView.builder(
// //                   padding: const EdgeInsets.all(10),
// //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 3,
// //                     childAspectRatio: 2 / 2,
// //                     crossAxisSpacing: 10,
// //                     mainAxisSpacing: 10,
// //                   ),
// //                   itemCount: box.values.length,
// //                   itemBuilder: (context, index) {
// //                     final item = box.getAt(index);
// //                     return GestureDetector(
// //                       onTap: () {
// //                         _addItemToCart(item);
// //                       },
// //                       child: ListView(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(10.0),
// //                             child: ItemCard(
// //                               item: item!,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           const VerticalDivider(),
// //           Expanded(
// //             flex: 2,
// //             child: Column(
// //               children: [
// //                 Container(
// //                   height: 50,
// //                 ),
// //                 const Divider(),
// //                 Expanded(
// //                   child: CartWidget(
// //                     cart: _cart,
// //                     onRemove: _removeItemFromCart,
// //                   ),
// //                 ),
// //                 const Divider(),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(
// //                     children: [
// //                       Text('Total: \$${_totalPrice.toStringAsFixed(2)}',
// //                           style: const TextStyle(fontSize: 18)),
// //                       const SizedBox(height: 10),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               generateAndPrintInvoice(_cart, _totalPrice);
// //                             },
// //                             child: const Text('Print Cart'),
// //                           ),
// //                           const SizedBox(width: 20),
// //                           ElevatedButton(
// //                             onPressed: () async {
// //                               await downloadInvoice(
// //                                   context, _cart, _totalPrice);
// //                             },
// //                             child: const Text('Download Cart'),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const AddItemPage()),
// //           );
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

// // //////////
// // // ignore_for_file: unnecessary_import, library_private_types_in_public_api

// // import 'package:flutter/material.dart';
// // import 'package:hive/hive.dart';
// // import 'package:hive_flutter/hive_flutter.dart';
// // import 'package:pos_system/models/item.dart';
// // import 'package:pos_system/screens/add_item_page.dart';
// // import 'package:pos_system/screens/manage_item_page.dart';
// // import 'package:pos_system/utils/pdf_generator.dart';
// // import 'package:pos_system/widgets/cart_widget.dart';
// // import 'package:pos_system/widgets/item_card.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final List<Item> _cart = [];
// //   String? _selectedTableNumber;
// //   final List<String> _tableNumbers =
// //       List<String>.generate(50, (index) => 'Table ${index + 1}');

// //   double get _totalPrice =>
// //       _cart.fold(0, (sum, item) => sum + (item.price * item.quantity));

// //   void _removeItemFromCart(Item item) {
// //     setState(() {
// //       if (item.quantity > 1) {
// //         item.quantity--;
// //       } else {
// //         _cart.remove(item);
// //       }
// //     });
// //   }

// //   void _addItemToCart(Item item) {
// //     setState(() {
// //       final existingItem = _cart.firstWhere(
// //           (cartItem) => cartItem.name == item.name,
// //           orElse: () => Item(name: '', price: 0, imagePath: ''));
// //       if (existingItem.name.isNotEmpty) {
// //         existingItem.quantity++;
// //       } else {
// //         _cart.add(Item(
// //             name: item.name,
// //             price: item.price,
// //             imagePath: item.imagePath,
// //             quantity: 1));
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.settings),
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                     builder: (context) => const ManageItemsPage()),
// //               );
// //             },
// //           )
// //         ],
// //         title: const Text('POS System'),
// //       ),
// //       body: Row(
// //         children: [
// //           Expanded(
// //             flex: 3,
// //             child: ValueListenableBuilder(
// //               valueListenable: Hive.box<Item>('itemsBox').listenable(),
// //               builder: (context, Box<Item> box, _) {
// //                 if (box.values.isEmpty) {
// //                   return const Center(child: Text('No items'));
// //                 }

// //                 return GridView.builder(
// //                   padding: const EdgeInsets.all(10),
// //                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 3,
// //                     childAspectRatio: 2 / 2,
// //                     crossAxisSpacing: 10,
// //                     mainAxisSpacing: 10,
// //                   ),
// //                   itemCount: box.values.length,
// //                   itemBuilder: (context, index) {
// //                     final item = box.getAt(index);
// //                     return GestureDetector(
// //                       onTap: () {
// //                         _addItemToCart(item);
// //                       },
// //                       child: ListView(
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.all(10.0),
// //                             child: ItemCard(
// //                               item: item!,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //           const VerticalDivider(),
// //           Expanded(
// //             flex: 2,
// //             child: Column(
// //               children: [
// //                 DropdownButton<String>(
// //                   value: _selectedTableNumber,
// //                   hint: const Text('Select Table Number'),
// //                   items: _tableNumbers.map((String value) {
// //                     return DropdownMenuItem<String>(
// //                       value: value,
// //                       child: Text(value),
// //                     );
// //                   }).toList(),
// //                   onChanged: (newValue) {
// //                     setState(() {
// //                       _selectedTableNumber = newValue;
// //                     });
// //                   },
// //                 ),
// //                 const Divider(),
// //                 Expanded(
// //                   child: CartWidget(
// //                     cart: _cart,
// //                     onRemove: _removeItemFromCart,
// //                   ),
// //                 ),
// //                 const Divider(),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(
// //                     children: [
// //                       Text('Total: \$${_totalPrice.toStringAsFixed(2)}',
// //                           style: const TextStyle(fontSize: 18)),
// //                       const SizedBox(height: 10),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               if (_selectedTableNumber != null) {
// //                                 generateAndPrintInvoice(
// //                                     _cart, _totalPrice, _selectedTableNumber!);
// //                               } else {
// //                                 ScaffoldMessenger.of(context).showSnackBar(
// //                                   const SnackBar(
// //                                       content:
// //                                           Text('Please select a table number')),
// //                                 );
// //                               }
// //                             },
// //                             child: const Text('Print Cart'),
// //                           ),
// //                           const SizedBox(width: 20),
// //                           ElevatedButton(
// //                             onPressed: () async {
// //                               if (_selectedTableNumber != null) {
// //                                 await downloadInvoice(context, _cart,
// //                                     _totalPrice, _selectedTableNumber!);
// //                               } else {
// //                                 ScaffoldMessenger.of(context).showSnackBar(
// //                                   const SnackBar(
// //                                       content:
// //                                           Text('Please select a table number')),
// //                                 );
// //                               }
// //                             },
// //                             child: const Text('Download Cart'),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const AddItemPage()),
// //           );
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
// // /////////////////////////////

// // screens/home_page.dart

// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:pos_system/screens/manage_items_widget.dart';
// import 'package:pos_system/screens/pos_widget.dart';
// import 'package:pos_system/screens/add_item_widget.dart';
// import 'package:pos_system/screens/settings_widget.dart';
// import 'package:pos_system/models/settings.dart';

// enum HomeSection { home, pos, addItems, manageItems, settings }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   HomeSection _selectedSection = HomeSection.pos;
//   late Box<Settings> settingsBox;
//   late Settings settings;

//   @override
//   void initState() {
//     super.initState();
//     settingsBox = Hive.box<Settings>('settingsBox');
//     settings = settingsBox.get('settings') ??
//         Settings(numberOfTables: 0, restaurantName: '');
//   }

//   void _navigateToSection(HomeSection section) {
//     setState(() {
//       _selectedSection = section;
//       if (section == HomeSection.pos) {
//         settings = settingsBox.get('settings') ??
//             Settings(numberOfTables: 0, restaurantName: '');
//       }
//     });
//   }

//   void _onSettingsChanged() {
//     setState(() {
//       settings = settingsBox.get('settings') ??
//           Settings(numberOfTables: 0, restaurantName: '');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(211, 255, 181, 102),
//         title: Text(settings.restaurantName.isEmpty
//             ? 'POS System'
//             : settings.restaurantName),
//         centerTitle: true,
//       ),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.pos
//                       ? Colors.blue
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.pos);
//                   },
//                   child: const Text(
//                     'POS',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.addItems
//                       ? Colors.blue
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.addItems);
//                   },
//                   child: const Text(
//                     'Add Items',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.manageItems
//                       ? Colors.blue
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.manageItems);
//                   },
//                   child: const Text(
//                     'Manage Items',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.settings
//                       ? Colors.blue
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.settings);
//                   },
//                   child: const Text(
//                     'Settings',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const VerticalDivider(),
//           Expanded(
//             flex: 4,
//             child: _selectedSection == HomeSection.pos
//                 ? const POSWidget()
//                 : _selectedSection == HomeSection.addItems
//                     ? AddItemWidget(
//                         onItemAdded: () {
//                           _navigateToSection(HomeSection.pos);
//                         },
//                       )
//                     : _selectedSection == HomeSection.manageItems
//                         ? const ManageItemsWidget()
//                         : _selectedSection == HomeSection.settings
//                             ? SettingsWidget(
//                                 onSettingsChanged: _onSettingsChanged,
//                               )
//                             : Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // screens/home_page.dart

// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:pos_system/screens/manage_items_widget.dart';
// import 'package:pos_system/screens/pos_widget.dart';
// import 'package:pos_system/screens/add_item_widget.dart';
// import 'package:pos_system/screens/settings_widget.dart';
// import 'package:pos_system/screens/invoice_list_widget.dart';
// import 'package:pos_system/models/settings.dart';

// enum HomeSection { home, pos, addItems, manageItems, invoices, settings }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   HomeSection _selectedSection = HomeSection.pos;
//   late Box<Settings> settingsBox;
//   late Settings settings;

//   @override
//   void initState() {
//     super.initState();
//     settingsBox = Hive.box<Settings>('settingsBox');
//     settings = settingsBox.get('settings') ??
//         Settings(numberOfTables: 0, restaurantName: '');
//   }

//   void _navigateToSection(HomeSection section) {
//     setState(() {
//       _selectedSection = section;
//       if (section == HomeSection.pos) {
//         settings = settingsBox.get('settings') ??
//             Settings(numberOfTables: 0, restaurantName: '');
//       }
//     });
//   }

//   void _onSettingsChanged() {
//     setState(() {
//       settings = settingsBox.get('settings') ??
//           Settings(numberOfTables: 0, restaurantName: '');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(settings.restaurantName.isEmpty
//             ? 'POS System'
//             : settings.restaurantName),
//         centerTitle: true,
//       ),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.pos
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.pos);
//                   },
//                   child: const Text(
//                     'POS',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.addItems
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.addItems);
//                   },
//                   child: const Text(
//                     'Add Items',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.manageItems
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.manageItems);
//                   },
//                   child: const Text(
//                     'Manage Items',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.invoices
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.invoices);
//                   },
//                   child: const Text(
//                     'Invoices',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.settings
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.settings);
//                   },
//                   child: const Text(
//                     'Settings',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const VerticalDivider(),
//           Expanded(
//             flex: 4,
//             child: _selectedSection == HomeSection.pos
//                 ? const POSWidget()
//                 : _selectedSection == HomeSection.addItems
//                     ? AddItemWidget(
//                         onItemAdded: () {
//                           _navigateToSection(HomeSection.pos);
//                         },
//                       )
//                     : _selectedSection == HomeSection.manageItems
//                         ? const ManageItemsWidget()
//                         : _selectedSection == HomeSection.invoices
//                             ? const InvoiceListWidget()
//                             : _selectedSection == HomeSection.settings
//                                 ? SettingsWidget(
//                                     onSettingsChanged: _onSettingsChanged,
//                                   )
//                                 : const Center(
//                                     child:
//                                         Text('Select an option from the menu.'),
//                                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// screens/home_page.dart

// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:pos_system/screens/manage_items_widget.dart';
// import 'package:pos_system/screens/pos_widget.dart';
// import 'package:pos_system/screens/add_item_widget.dart';
// import 'package:pos_system/screens/settings_widget.dart';
// import 'package:pos_system/models/settings.dart';

// enum HomeSection { home, pos, addItems, manageItems, settings }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   HomeSection _selectedSection = HomeSection.pos;
//   late Box<Settings> settingsBox;
//   late Settings settings;

//   @override
//   void initState() {
//     super.initState();
//     settingsBox = Hive.box<Settings>('settingsBox');
//     settings = settingsBox.get('settings') ??
//         Settings(numberOfTables: 0, restaurantName: '');
//   }

//   void _navigateToSection(HomeSection section) {
//     setState(() {
//       _selectedSection = section;
//       if (section == HomeSection.pos) {
//         settings = settingsBox.get('settings') ??
//             Settings(numberOfTables: 0, restaurantName: '');
//       }
//     });
//   }

//   void _onSettingsChanged() {
//     setState(() {
//       settings = settingsBox.get('settings') ??
//           Settings(numberOfTables: 0, restaurantName: '');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(settings.restaurantName.isEmpty
//             ? 'POS System'
//             : settings.restaurantName),
//         centerTitle: true,
//       ),
//       body: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.pos
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.pos);
//                   },
//                   child: const Text(
//                     'POS',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.addItems
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.addItems);
//                   },
//                   child: const Text(
//                     'Add Items',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.manageItems
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.manageItems);
//                   },
//                   child: const Text(
//                     'Manage Items',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 MaterialButton(
//                   height: 75,
//                   minWidth: double.infinity,
//                   color: _selectedSection == HomeSection.settings
//                       ? Theme.of(context).primaryColor
//                       : Colors.grey,
//                   onPressed: () {
//                     _navigateToSection(HomeSection.settings);
//                   },
//                   child: const Text(
//                     'Settings',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const VerticalDivider(),
//           Expanded(
//             flex: 4,
//             child: _selectedSection == HomeSection.pos
//                 ? const POSWidget()
//                 : _selectedSection == HomeSection.addItems
//                     ? AddItemWidget(
//                         onItemAdded: () {
//                           _navigateToSection(HomeSection.pos);
//                         },
//                       )
//                     : _selectedSection == HomeSection.manageItems
//                         ? const ManageItemsWidget()
//                         : _selectedSection == HomeSection.settings
//                             ? SettingsWidget(
//                                 onSettingsChanged: _onSettingsChanged,
//                               )
//                             : Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// home_page.dart

// ignore_for_file: library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pos_system/screens/manage_items_widget.dart';
import 'package:pos_system/screens/pos_widget.dart';
import 'package:pos_system/screens/add_item_widget.dart';
import 'package:pos_system/screens/settings_widget.dart';
import 'package:pos_system/models/settings.dart';
import 'package:pos_system/models/item.dart';

enum HomeSection { home, pos, addItems, manageItems, settings }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeSection _selectedSection = HomeSection.pos;
  late Box<Settings> settingsBox;
  late Settings settings;

  // State for POSWidget
  List<Item> _cart = [];
  String? _selectedTableNumber;

  @override
  void initState() {
    super.initState();
    settingsBox = Hive.box<Settings>('settingsBox');
    settings = settingsBox.get('settings') ??
        Settings(numberOfTables: 0, restaurantName: '');
  }

  void _navigateToSection(HomeSection section) {
    setState(() {
      _selectedSection = section;
      if (section == HomeSection.pos) {
        settings = settingsBox.get('settings') ??
            Settings(numberOfTables: 0, restaurantName: '');
      }
    });
  }

  void _onSettingsChanged() {
    setState(() {
      settings = settingsBox.get('settings') ??
          Settings(numberOfTables: 0, restaurantName: '');
    });
  }

  void _addItemToCart(Item item) {
    setState(() {
      final existingItem = _cart.firstWhere(
          (cartItem) => cartItem.name == item.name,
          orElse: () => Item(name: '', price: 0, imagePath: ''));
      if (existingItem.name.isNotEmpty) {
        existingItem.quantity++;
      } else {
        _cart.insert(
            0,
            Item(
                // Changed from _cart.add to _cart.insert
                name: item.name,
                price: item.price,
                imagePath: item.imagePath,
                quantity: 1));
      }
    });
  }

  void _removeItemFromCart(Item item) {
    setState(() {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        _cart.remove(item);
      }
    });
  }

  void _selectTableNumber(String? tableNumber) {
    setState(() {
      _selectedTableNumber = tableNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settings.restaurantName.isEmpty
            ? 'POS System'
            : settings.restaurantName),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MaterialButton(
                  height: 75,
                  minWidth: double.infinity,
                  color: _selectedSection == HomeSection.pos
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  onPressed: () {
                    _navigateToSection(HomeSection.pos);
                  },
                  child: const Text(
                    'POS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  height: 75,
                  minWidth: double.infinity,
                  color: _selectedSection == HomeSection.addItems
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  onPressed: () {
                    _navigateToSection(HomeSection.addItems);
                  },
                  child: const Text(
                    'Add Items',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  height: 75,
                  minWidth: double.infinity,
                  color: _selectedSection == HomeSection.manageItems
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  onPressed: () {
                    _navigateToSection(HomeSection.manageItems);
                  },
                  child: const Text(
                    'Manage Items',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  height: 75,
                  minWidth: double.infinity,
                  color: _selectedSection == HomeSection.settings
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  onPressed: () {
                    _navigateToSection(HomeSection.settings);
                  },
                  child: const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(),
          Expanded(
            flex: 4,
            child: _selectedSection == HomeSection.pos
                ? POSWidget(
                    cart: _cart,
                    selectedTableNumber: _selectedTableNumber,
                    tableNumbers: List<String>.generate(settings.numberOfTables,
                        (index) => 'Table ${index + 1}'),
                    restaurantName: settings.restaurantName,
                    onAddItem: _addItemToCart,
                    onRemoveItem: _removeItemFromCart,
                    onSelectTableNumber: _selectTableNumber,
                  )
                : _selectedSection == HomeSection.addItems
                    ? AddItemWidget(
                        onItemAdded: () {
                          _navigateToSection(HomeSection.pos);
                        },
                      )
                    : _selectedSection == HomeSection.manageItems
                        ? const ManageItemsWidget()
                        : _selectedSection == HomeSection.settings
                            ? SettingsWidget(
                                onSettingsChanged: _onSettingsChanged,
                              )
                            : Container(),
          ),
        ],
      ),
    );
  }
}
