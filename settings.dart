// models/settings.dart

import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 1)
class Settings extends HiveObject {
  @HiveField(0)
  late int numberOfTables;

  @HiveField(1)
  late String restaurantName;

  Settings({required this.numberOfTables, required this.restaurantName});
}
