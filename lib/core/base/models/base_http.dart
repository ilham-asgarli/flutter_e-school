import 'package:emekteb/core/base/models/base_model.dart';

class BaseHttp implements BaseModel {
  String? message;
  dynamic code;

  BaseHttp({this.message, this.code});

  @override
  fromJson(Map<String, dynamic> json) {
    print(json);
    return BaseHttp(
      message: json["message"],
      code: json["code"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
      };
}
