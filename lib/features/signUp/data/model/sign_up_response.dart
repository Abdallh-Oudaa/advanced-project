import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';
@JsonSerializable()
class SignUpResponse {
  SignUpResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});
factory SignUpResponse.fromJson(Map<String,dynamic> data)=>_$SignUpResponseFromJson(data);

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