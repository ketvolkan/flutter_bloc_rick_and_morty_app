import '../../core/utils/serializer.dart';

class GeneralResponse extends BaseModel {
  dynamic data;
  String? message;
  int? status;

  GeneralResponse({this.data, this.status, this.message});

  GeneralResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    status = json['status'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['data'] = data;
    map['message'] = message;
    map['status'] = status;
    return map;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return GeneralResponse.fromJson(json);
  }

  @override
  String toString() {
    return 'GeneralResponse(status: $status \n message: $message \n data: $data)';
  }
}
