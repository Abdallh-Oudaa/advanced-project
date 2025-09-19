import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  SignUpRequest(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.passwordConfirmation,
      required this.gender});

  String? name;
  String? email;
  String? phone;
  String? password;
  @JsonKey(name: "password_confirmation")
  String? passwordConfirmation;

  int? gender;

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
