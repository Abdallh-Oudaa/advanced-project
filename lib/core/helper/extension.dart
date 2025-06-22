import 'package:flutter/cupertino.dart';

extension NavigatorEnxtension on BuildContext{
  pushNamed(String routName,{Object? arguments}){
    return Navigator.pushNamed(this, routName);
  }
  pushReplacementNamed(String routName,{Object? arguments}){
    return Navigator.pushReplacementNamed(this, routName);
  }
  pop(){
    return Navigator.pop(this);
  }
}