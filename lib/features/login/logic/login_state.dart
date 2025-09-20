import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';
@Freezed()
class LoginState<T> with _$LoginState<T>{
  factory LoginState.initial()=_Initial;
  factory LoginState.loading()=Loading;

  factory LoginState.success(T data)=Success;
  factory LoginState.error(String message)=Error;

}