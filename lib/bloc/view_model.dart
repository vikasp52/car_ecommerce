import 'package:car_ecommerce/model/car_model.dart';
import 'package:flutter/material.dart';

class CarViewModel {
  List<Car> CarsItems;

  CarViewModel({this.CarsItems});

  getCars() => <Car>[
        Car(
            brand: "Levis",
            description: "Print T-shirt",
            image: "https://mosaic02.ztat.net/vgs/media/pdp-zoom/LE/22/1D/02/2A/12/LE221D022-A12@16.1.jpg",
            name: "THE PERFECT",
            price: "£19.99",
            rating: 4.0,
            color: "Red",
            carType: "Disel"),
        Car(
            brand: "Levis",
            description: "Print T-shirt",
            image: "https://mosaic02.ztat.net/vgs/media/pdp-zoom/LE/22/1D/02/2A/12/LE221D022-A12@16.1.jpg",
            name: "THE PERFECT",
            price: "£19.99",
            rating: 4.0,
            color: "Red",
            carType: "Disel"),
        Car(
            brand: "Levis",
            description: "Print T-shirt",
            image: "https://mosaic02.ztat.net/vgs/media/pdp-zoom/LE/22/1D/02/2A/12/LE221D022-A12@16.1.jpg",
            name: "THE PERFECT",
            price: "£19.99",
            rating: 4.0,
            color: "Red",
            carType: "Disel"),
        Car(
            brand: "Levis",
            description: "Print T-shirt",
            image: "https://mosaic02.ztat.net/vgs/media/pdp-zoom/LE/22/1D/02/2A/12/LE221D022-A12@16.1.jpg",
            name: "THE PERFECT",
            price: "£19.99",
            rating: 4.0,
            color: "Red",
            carType: "Disel"),
      ];
}
