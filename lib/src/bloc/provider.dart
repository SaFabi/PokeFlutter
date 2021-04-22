import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';

class Provider  extends InheritedWidget {



  static Provider _instanciActual;

  factory Provider({Key key,Widget child}){
    if(_instanciActual == null){
      _instanciActual = new Provider._internal(key: key,child: child,);
    }

    return _instanciActual;
  }

  Provider._internal({Key key,Widget child})
      : super(key: key,child: child);

  final loginBloc = LoginBbloc();
  
  // Provider({Key key,Widget child})
  //   : super(key: key,child: child);      

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;


  static LoginBbloc of( BuildContext context){
     return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
  }

}