/// id : 1
/// name : "Arun"
/// profile_pic : "/media/customers/avatar.jpg"
/// mobile_number : "9876543210"
/// email : "arun@example.com"
/// street : "abc street"
/// street_two : "street"
/// city : "kochi"
/// pincode : 675654
/// country : "India"
/// state : "kerala"
/// created_date : "2023-10-19"
/// created_time : "11:58:32.751027"
/// modified_date : "2023-10-19"
/// modified_time : "11:58:32.751041"
/// flag : true

class Customer {
  Customer({
    num? id,
    String? name,
    String? profilePic,
    String? mobileNumber,
    String? email,
    String? street,
    String? streetTwo,
    String? city,
    num? pincode,
    String? country,
    String? state,
    String? createdDate,
    String? createdTime,
    String? modifiedDate,
    String? modifiedTime,
    bool? flag,}){
    _id = id;
    _name = name;
    _profilePic = profilePic;
    _mobileNumber = mobileNumber;
    _email = email;
    _street = street;
    _streetTwo = streetTwo;
    _city = city;
    _pincode = pincode;
    _country = country;
    _state = state;
    _createdDate = createdDate;
    _createdTime = createdTime;
    _modifiedDate = modifiedDate;
    _modifiedTime = modifiedTime;
    _flag = flag;
  }

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _profilePic = json['profile_pic'];
    _mobileNumber = json['mobile_number'];
    _email = json['email'];
    _street = json['street'];
    _streetTwo = json['street_two'];
    _city = json['city'];
    _pincode = json['pincode'];
    _country = json['country'];
    _state = json['state'];
    _createdDate = json['created_date'];
    _createdTime = json['created_time'];
    _modifiedDate = json['modified_date'];
    _modifiedTime = json['modified_time'];
    _flag = json['flag'];
  }
  num? _id;
  String? _name;
  String? _profilePic;
  String? _mobileNumber;
  String? _email;
  String? _street;
  String? _streetTwo;
  String? _city;
  num? _pincode;
  String? _country;
  String? _state;
  String? _createdDate;
  String? _createdTime;
  String? _modifiedDate;
  String? _modifiedTime;
  bool? _flag;
  Customer copyWith({  num? id,
    String? name,
    String? profilePic,
    String? mobileNumber,
    String? email,
    String? street,
    String? streetTwo,
    String? city,
    num? pincode,
    String? country,
    String? state,
    String? createdDate,
    String? createdTime,
    String? modifiedDate,
    String? modifiedTime,
    bool? flag,
  }) => Customer(  id: id ?? _id,
    name: name ?? _name,
    profilePic: profilePic ?? _profilePic,
    mobileNumber: mobileNumber ?? _mobileNumber,
    email: email ?? _email,
    street: street ?? _street,
    streetTwo: streetTwo ?? _streetTwo,
    city: city ?? _city,
    pincode: pincode ?? _pincode,
    country: country ?? _country,
    state: state ?? _state,
    createdDate: createdDate ?? _createdDate,
    createdTime: createdTime ?? _createdTime,
    modifiedDate: modifiedDate ?? _modifiedDate,
    modifiedTime: modifiedTime ?? _modifiedTime,
    flag: flag ?? _flag,
  );
  num? get id => _id;
  String? get name => _name;
  String? get profilePic => _profilePic;
  String? get mobileNumber => _mobileNumber;
  String? get email => _email;
  String? get street => _street;
  String? get streetTwo => _streetTwo;
  String? get city => _city;
  num? get pincode => _pincode;
  String? get country => _country;
  String? get state => _state;
  String? get createdDate => _createdDate;
  String? get createdTime => _createdTime;
  String? get modifiedDate => _modifiedDate;
  String? get modifiedTime => _modifiedTime;
  bool? get flag => _flag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['profile_pic'] = _profilePic;
    map['mobile_number'] = _mobileNumber;
    map['email'] = _email;
    map['street'] = _street;
    map['street_two'] = _streetTwo;
    map['city'] = _city;
    map['pincode'] = _pincode;
    map['country'] = _country;
    map['state'] = _state;
    map['created_date'] = _createdDate;
    map['created_time'] = _createdTime;
    map['modified_date'] = _modifiedDate;
    map['modified_time'] = _modifiedTime;
    map['flag'] = _flag;
    return map;
  }

}