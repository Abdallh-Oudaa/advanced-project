import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_request.g.dart';
@JsonSerializable()
class SignUpRequest{
 final String? name;
 final String? email;
 final String? phone;

 final String? password;
  @JsonKey(name:"password_confirmation" )
  String? passwordConfirmation;
  final int? gender;
  SignUpRequest(this.phone,this.name,this.email,this.password,this.passwordConfirmation,this.gender);
Map<String,dynamic> toJson()=>_$SignUpRequestToJson(this);
}