import 'package:flutter/cupertino.dart';

extension NavigatorEnxtension on BuildContext{
  Future<Object?> pushNamed(String routName,{Object? arguments}){
    return Navigator.pushNamed(this, routName);
  }
  Future<Object?> pushReplacementNamed(String routName,{Object? arguments}){
    return Navigator.pushReplacementNamed(this, routName);
  }
  void pop(){
    return Navigator.pop(this);
  }
}