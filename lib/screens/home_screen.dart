import 'package:car_ecommerce/bloc/car_bloc.dart';
import 'package:car_ecommerce/model/car_model.dart';
import 'package:car_ecommerce/screens/car_details.dart';
import 'package:car_ecommerce/widgets/card/carlist_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _carBloc = ProductBloc();

  list() {
    return List.generate(4, (index) {
      return CarListCard();
    });
  }

  @override
  void initState() {
    super.initState();
    _carBloc.getCarList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: StreamBuilder<List<Car>>(
            stream: _carBloc.productItems,
            builder: (context, snapshotCarList) {
              if (snapshotCarList.hasData) {
                return ListView.builder(
                    itemCount: snapshotCarList.data.length,
                    itemBuilder: (context, index) {
                      Car car = snapshotCarList.data[index];
                      return InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(fullscreenDialog: true,builder: (_) => CarDetailsScreen())),
                          child: CarListCard(
                            car: car,
                          ));
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
