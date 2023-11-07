/// error_code : 0
/// data : {}
/// message : "success"

class RespCheckOut {
  RespCheckOut({
      num? errorCode, 
      dynamic data, 
      String? message,}){
    _errorCode = errorCode;
    _data = data;
    _message = message;
}

  RespCheckOut.fromJson(dynamic json) {
    _errorCode = json['error_code'];
    _data = json['data'];
    _message = json['message'];
  }
  num? _errorCode;
  dynamic _data;
  String? _message;
RespCheckOut copyWith({  num? errorCode,
  dynamic data,
  String? message,
}) => RespCheckOut(  errorCode: errorCode ?? _errorCode,
  data: data ?? _data,
  message: message ?? _message,
);
  num? get errorCode => _errorCode;
  dynamic get data => _data;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error_code'] = _errorCode;
    map['data'] = _data;
    map['message'] = _message;
    return map;
  }

}