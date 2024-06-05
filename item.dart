// import 'package:hive/hive.dart';

// part 'item.g.dart';

// @HiveType(typeId: 0)
// class Item extends HiveObject {
//   @HiveField(0)
//   String name;

//   @HiveField(1)
//   double price;

//   @HiveField(2)
//   String imagePath;

//   Item({required this.name, required this.price, required this.imagePath});
// }

import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  String imagePath;

  @HiveField(3)
  int quantity;

  Item({
    required this.name,
    required this.price,
    required this.imagePath,
    this.quantity = 1,
  });
}
