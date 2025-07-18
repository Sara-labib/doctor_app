import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> PushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> PushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }
  Future<dynamic>pushNamedAndRemoveUntil(String routeName,{Object? arguments, required RoutePredicate predicate}){
    return Navigator.of(this).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }
  void pop ()=>Navigator.of(this).pop;
}
