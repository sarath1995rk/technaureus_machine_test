import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 2)
class CustomerModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String address;

  CustomerModel(this.id, this.name, this.image, this.address);


}