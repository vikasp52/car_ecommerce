import 'dart:async';

import 'package:car_ecommerce/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  static final _userNameController = BehaviorSubject<String>();

  Stream<String> get usernameStream => _userNameController.stream.transform(validateEmptyField);

  Function(String) get usernameSink => _userNameController.sink.add;

  static final _passwordController = BehaviorSubject<String>();

  Stream<String> get passwordStream => _passwordController.stream.transform(validateEmptyField);

  Function(String) get passwordSink => _passwordController.sink.add;

  Stream<bool> get submitCheck => Observable.combineLatest2(usernameStream, passwordStream, (n, g) {
        if ((_userNameController.value != null &&
                _userNameController.value != '') &&
            (_passwordController.value != null &&
                _passwordController.value != '')) {
          return true;
        } else {
          return false;
        }
      });

  void validateUser({BuildContext context}){
    if((_userNameController.value == "test@aigen.tech") && (_passwordController.value == "AigenTech")){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage()));
    }else{
      print('Invalid credential');
    }

  }

  var validateEmptyField = StreamTransformer<String, String>.fromHandlers(handleData: (textField, sink) {
    print('TextField:: $textField');
    if (textField != null && textField.isNotEmpty) {
      sink.add(textField);
    } else {
      sink.addError('Field should not be blank');
    }
  });

  void dispose() {
    _userNameController.close();
    _passwordController.close();
  }
}
