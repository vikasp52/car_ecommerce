import 'package:car_ecommerce/model/car_model.dart';
import 'package:flutter/material.dart';

class CarListCard extends StatelessWidget {
  final Car car;


  CarListCard({this.car});

  Widget _buildCarDetails() {
    return Column(
      children: <Widget>[
        Text(
          car.name,
          style: TextStyle(fontSize: 25.0, color: Colors.black),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          car.description,
          style: TextStyle(fontSize: 22.0, color: Colors.grey),
        ),

        Text(
          '₹ 60.6 Lakhs',
          style: TextStyle(fontSize: 25.0, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildImage(){
    return Image(image: NetworkImage('https://banner2.cleanpng.com/20180125/crq/kisspng-bmw-x5-car-bmw-m5-bmw-5-series-white-bmw-5a6a7f728dea61.6936699415169288825813.jpg'));
  }

  Widget _buildNameImage() {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: _buildCarDetails(),
          ),
          Expanded(
            flex: 3,
            child: _buildImage(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildNameImage();
  }
}
