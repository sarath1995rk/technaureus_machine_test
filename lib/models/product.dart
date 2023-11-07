class Product {
  Product({
    num? id,
    String? name,
    String? image,
    num? price,
    String? createdDate,
    String? createdTime,
    String? modifiedDate,
    String? modifiedTime,
    bool? flag,}){
    _id = id;
    _name = name;
    _image = image;
    _price = price;
    _createdDate = createdDate;
    _createdTime = createdTime;
    _modifiedDate = modifiedDate;
    _modifiedTime = modifiedTime;
    _flag = flag;
  }

  Product.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _price = json['price'];
    _createdDate = json['created_date'];
    _createdTime = json['created_time'];
    _modifiedDate = json['modified_date'];
    _modifiedTime = json['modified_time'];
    _flag = json['flag'];
  }
  num? _id;
  String? _name;
  String? _image;
  num? _price;
  String? _createdDate;
  String? _createdTime;
  String? _modifiedDate;
  String? _modifiedTime;
  bool? _flag;
  Product copyWith({  num? id,
    String? name,
    String? image,
    num? price,
    String? createdDate,
    String? createdTime,
    String? modifiedDate,
    String? modifiedTime,
    bool? flag,
  }) => Product(  id: id ?? _id,
    name: name ?? _name,
    image: image ?? _image,
    price: price ?? _price,
    createdDate: createdDate ?? _createdDate,
    createdTime: createdTime ?? _createdTime,
    modifiedDate: modifiedDate ?? _modifiedDate,
    modifiedTime: modifiedTime ?? _modifiedTime,
    flag: flag ?? _flag,
  );
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  num? get price => _price;
  String? get createdDate => _createdDate;
  String? get createdTime => _createdTime;
  String? get modifiedDate => _modifiedDate;
  String? get modifiedTime => _modifiedTime;
  bool? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['price'] = _price;
    map['created_date'] = _createdDate;
    map['created_time'] = _createdTime;
    map['modified_date'] = _modifiedDate;
    map['modified_time'] = _modifiedTime;
    map['flag'] = _flag;
    return map;
  }

}