import 'package:car_ecommerce/model/car_model.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;

  CarDetailsScreen({this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text('Details'),
      ),
    );
  }
}
