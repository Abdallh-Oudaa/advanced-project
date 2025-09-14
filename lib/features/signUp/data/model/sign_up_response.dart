import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response.g.dart';
@JsonSerializable()
class SignUpResponse {
  SignUpResponse({
    this.message,
    this.userInfo,
    this.status,
    this.code,});


  String? message;
  @JsonKey(name: "data")
  UserInfo? userInfo;
  bool? status;
  int? code;

  factory SignUpResponse.fromJson(Map<String,dynamic> json)=>_$SignUpResponseFromJson(json);

}
@JsonSerializable()
class UserInfo {
  UserInfo({
    this.token,
    this.userName,});


  String? token;
  @JsonKey(name: "username")
  String? userName;
  factory UserInfo.fromJson(Map<String,dynamic> json)=>_$UserInfoFromJson(json);



}