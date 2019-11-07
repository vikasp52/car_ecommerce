import 'package:car_ecommerce/bloc/login_bloc.dart';
import 'package:car_ecommerce/widgets/textfield/common_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AddTextField(
              label: 'Username',
              //hintText: 'e.g. Bollywood',
              stream: _loginBloc.usernameStream,
              onChange: _loginBloc.usernameSink,
              //maxCharecters: 20,
            ),
            AddTextField(
              label: 'Password',
              //hintText: 'e.g. Bollywood',
              stream: _loginBloc.passwordStream,
              onChange: _loginBloc.passwordSink,
              //maxCharecters: 20,
            ),
            StreamBuilder<bool>(
              stream: _loginBloc.submitCheck,
              initialData: false,
              builder: (context, snapshot) {
                return RaisedButton(onPressed: !snapshot.data?null:(){
                  _loginBloc.validateUser(context: context);
                }, child: Text('Login'),);
              }
            )
          ],
        ),
      ),
    );
  }
}
