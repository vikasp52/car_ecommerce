import 'package:car_ecommerce/model/car_model.dart';
import 'package:flutter/material.dart';

class CarListCard extends StatelessWidget {
  final Car car;

  CarListCard({this.car});

  Widget _buildCarDetails() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        elevation: 10.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                car.name,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Diesel, Automatic (17.1 kmpl)',
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '₹ ${car.price} Lakhs',
                style: TextStyle(fontSize: 20.0, color: Colors.red, fontWeight: FontWeight.bold, ),
              ),
            ),
            Center(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(car.imagePath, height: 200.0,),
            )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCarDetails();
  }
}
