import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  LoginResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});
factory LoginResponse.fromJson(Map<String,dynamic> data)=>_$LoginResponseFromJson(data);

  String? message;
  Data? data;
  bool? status;
  int? code;



}
@JsonSerializable()
class Data {
  Data({
      this.token, 
      this.userName,});
factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  String? token;
@JsonKey(name: "username")
  String? userName;



}