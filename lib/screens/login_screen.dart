import 'package:car_ecommerce/bloc/login_bloc.dart';
import 'package:car_ecommerce/widgets/textfield/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  final _loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {

    Widget _buildLoginForm(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AddTextField(
                label: 'Username',
                stream: _loginBloc.usernameStream,
                onChange: _loginBloc.usernameSink,
              ),
              AddTextField(
                label: 'Password',
                stream: _loginBloc.passwordStream,
                onChange: _loginBloc.passwordSink,
                obscureText: true,
              ),
              StreamBuilder(
                  stream: _loginBloc.invalidCredentialStream,
                  builder: (context, snapshotInvalidCredential) {

                    if(snapshotInvalidCredential.hasData && snapshotInvalidCredential.data){
                      Fluttertoast.showToast(
                          msg:
                          "Invalid Credential",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 10,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20.0);
                    }

                    return StreamBuilder<bool>(
                        stream: _loginBloc.submitCheck,
                        initialData: false,
                        builder: (context, snapshot) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),

                              ),
                              color: Colors.deepPurpleAccent,
                              onPressed: (snapshot.hasData && snapshot.data)
                                  ? () {
                                _loginBloc.validateUser(context: context);
                              }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0),
                                child: Text('Login', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            ),
                          );
                        });
                  })
            ],
          ),
        ),
      );
    }


    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/login.png'),
              _buildLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
