import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  LoginResponse({
      this.message, 
      this.userInfo,
      this.status, 
      this.code,});


  String? message;
  @JsonKey(name: "data")
  UserInfo? userInfo;
  bool? status;
  int? code;

factory LoginResponse.fromJson(Map<String,dynamic> json)=>_$LoginResponseFromJson(json);

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