import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

class CarDetailsBloc{

  static final _nameController = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream.transform(validateEmptyField);

  Function(String) get nameSink => _nameController.sink.add;


  static final _messageController = BehaviorSubject<String>();

  Stream<String> get messageStream => _messageController.stream.transform(validateEmptyField);

  Function(String) get mesageSink => _messageController.sink.add;

  var validateEmptyField = StreamTransformer<String, String>.fromHandlers(handleData: (textField, sink) {
    print('TextField:: $textField');
    if (textField != null && textField.isNotEmpty) {
      sink.add(textField);
    } else {
      sink.addError('Field should not be blank');
    }
  });


  sendMail()async{
    final MailOptions mailOptions = MailOptions(
      body: _messageController.value,
      subject: '${_nameController.value} : Enquiry about car.',
      recipients: ['example@example.com'],
      isHTML: true,
    );

    await FlutterMailer.send(mailOptions);
  }

  void dispose(){
    _nameController.close();
    _messageController.close();
  }

}