import 'package:car_ecommerce/bloc/car_bloc.dart';
import 'package:car_ecommerce/model/car_model.dart';
import 'package:car_ecommerce/screens/car_details_screen.dart';
import 'package:car_ecommerce/screens/post_ad_screen.dart';
import 'package:car_ecommerce/widgets/card/carlist_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _carBloc = ProductBloc();


  @override
  void initState() {
    super.initState();
    _carBloc.getContactData();
    //_carBloc.getCarList();
  }

  final appBar =  AppBar(
    title: Column(
      children: <Widget>[
        Text('AutoCity', style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),),
        Text('Buy your dream car', style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),),
      ],
    ),
    elevation: 0.0,
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: (){})
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('AutoCity', style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0
                ),),
                Text('Buy your dream car from AutoCity', style: TextStyle(
                    color: Colors.deepPurple[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0
                ),),
              ],
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: (){})
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () => Navigator.push(context, MaterialPageRoute(fullscreenDialog: true,builder: (_) => PostAdScreen())),
            label: Text('Post Ad'),
            icon: Icon(Icons.add),
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
                            onTap: () => Navigator.push(
                                context, MaterialPageRoute(builder: (_) => CarDetailsScreen(car: car,))),
                            child: CarListCard(
                              car: car,
                            ));
                      });
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
