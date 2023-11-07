import 'package:technaures_machine_test/models/customer.dart';

/// error_code : 0
/// data : {"id":1,"name":"Arun","profile_pic":"/media/customers/avatar.jpg","mobile_number":"9876543210","email":"arun@example.com","street":"abc street","street_two":"street","city":"kochi","pincode":675654,"country":"India","state":"kerala","created_date":"2023-10-19","created_time":"11:58:32.751027","modified_date":"2023-10-19","modified_time":"11:58:32.751041","flag":true}
/// message : "success"

class RespCustomer {
  RespCustomer({
      num? errorCode, 
      Customer? data, 
      String? message,}){
    _errorCode = errorCode;
    _data = data;
    _message = message;
}

  RespCustomer.fromJson(dynamic json) {
    _errorCode = json['error_code'];
    _data = json['data'] != null ? Customer.fromJson(json['data']) : null;
    _message = json['message'];
  }
  num? _errorCode;
  Customer? _data;
  String? _message;
RespCustomer copyWith({  num? errorCode,
  Customer? data,
  String? message,
}) => RespCustomer(  errorCode: errorCode ?? _errorCode,
  data: data ?? _data,
  message: message ?? _message,
);
  num? get errorCode => _errorCode;
  Customer? get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = _errorCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

