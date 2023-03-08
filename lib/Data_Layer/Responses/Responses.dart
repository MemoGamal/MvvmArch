import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "NotificationsNum")
  int? notificationsNum;

  CustomerResponse(this.id, this.name, this.notificationsNum);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  int? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "Link")
  String? link;

  ContactsResponse(this.id, this.email, this.link);
}

class AuthResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  AuthResponse(this.customerResponse, this.contacts);
}
