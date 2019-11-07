import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:car_ecommerce/bloc/view_model.dart';
import 'package:car_ecommerce/model/car_model.dart';

class ProductBloc {
  final CarViewModel carViewModel = CarViewModel();
  final carController = BehaviorSubject<List<Car>>();
  Stream<List<Car>> get productItems => carController.stream;

  getCarList() {
    carController.add(carViewModel.getCars());
  }
}
