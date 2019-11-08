import 'package:car_ecommerce/bloc/car_details_bloc.dart';
import 'package:car_ecommerce/model/car_model.dart';
import 'package:car_ecommerce/widgets/textfield/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;

  CarDetailsScreen({this.car});

  @override
  Widget build(BuildContext context) {
    final _carDetailBloc = CarDetailsBloc();

    Future contactDialog() {
      return Alert(
        context: context,
        type: AlertType.info,
        title: "CONTACT SELLER",
        content: Column(
          children: <Widget>[
            AddTextField(
              label: 'Name',
              stream: _carDetailBloc.nameStream,
              onChange: _carDetailBloc.nameSink,
            ),
            AddTextField(
              label: 'Message',
              stream: _carDetailBloc.messageStream,
              onChange: _carDetailBloc.mesageSink,
              maxLine: 3,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: Colors.black,
            child: Text(
              "Send",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              _carDetailBloc.sendMail();
              Navigator.pop(context);
            },
            width: 60.0,
          ),
        ],
      ).show();
    }

    final appBar =  AppBar(
      title: Text(car.name, style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
      ),),
      elevation: 0.0,
    );


    Widget detailsCard({
      Widget icons,
      Widget text,
    }){
      return Card(
        elevation: 10.0,

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              icons,
              Divider(color: Colors.black,),
              text
            ],
          ),
        ),
      );
    }


    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Image.asset(car.imagePath, height: 200.0,),
              ),
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${car.name} Premium Plus', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.blue[900],
                    ),),
                    SizedBox(height: 10.0,),
                    Text('₹ ${car.price} Lakhs onwards', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.red[900],
                    ),),
                    SizedBox(height: 16.0,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          detailsCard(
                            icons: Icon(Icons.stars, color: Colors.blueAccent,size: 35.0,),
                            text: Text(car.rating, style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          detailsCard(
                            icons: Icon(Icons.color_lens, color: Colors.blueAccent,size: 35.0,),
                            text: Text(car.color, style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                          detailsCard(
                            icons: Icon(Icons.security, color: Colors.blueAccent,size: 35.0,),
                            text: Text(car.carType, style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Text('Description', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black,
                    ),),
                    SizedBox(height: 10.0,),
                    Text(car.description, style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 17.0,
                      color: Colors.grey[600],
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(onPressed: ()=>contactDialog(), child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Contact Seller', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white
                  ),),
                ),color: Colors.blue,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
