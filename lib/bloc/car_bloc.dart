import 'dart:async';
import 'package:car_ecommerce/util/database_helper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:car_ecommerce/bloc/view_model.dart';
import 'package:car_ecommerce/model/car_model.dart';

class ProductBloc {
  final db = DataBaseHelper();

  final CarViewModel carViewModel = CarViewModel();
  final carController = BehaviorSubject<List<Car>>();
  Stream<List<Car>> get productItems => carController.stream;

static List<Car> calList = <Car>[
  Car("Audi Q8", 'assets/car2.png', "Audi", "60.0", "White", "Manual", "4.0",
      "Audi has unveiled the 2019 Q3. It gets an all-new design which is inspired by the flagship Q8. The new Q3 is based on the Volkswagen group’s MQB platform and is larger than its predecessor in size. Audi has also introduced a new 1.5-litre turbocharged petrol with the second-gen SUV. "),
  Car("Renault KWID", 'assets/car1.png', "KWID", "30.0", "Silver", "Automatic", "4.0",
      "Audi has unveiled the 2019 Q3. It gets an all-new design which is inspired by the flagship Q8. The new Q3 is based on the Volkswagen group’s MQB platform and is larger than its predecessor in size. Audi has also introduced a new 1.5-litre turbocharged petrol with the second-gen SUV. "),
  Car("Hyundai Elite i20", 'assets/car4.png', "Hyundai", "28.0", "Gray", "Manual", "4.0",
      "Audi has unveiled the 2019 Q3. It gets an all-new design which is inspired by the flagship Q8. The new Q3 is based on the Volkswagen group’s MQB platform and is larger than its predecessor in size. Audi has also introduced a new 1.5-litre turbocharged petrol with the second-gen SUV. "),
  Car("Maruti Baleno", 'assets/car5.jpeg', "Maruti", "60.0", "Green", "Automatic", "4.0",
      "Audi has unveiled the 2019 Q3. It gets an all-new design which is inspired by the flagship Q8. The new Q3 is based on the Volkswagen group’s MQB platform and is larger than its predecessor in size. Audi has also introduced a new 1.5-litre turbocharged petrol with the second-gen SUV. "),
  Car("BMW X1", 'assets/car6.jpg', "BMW", "60.0", "White", "Automatic", "4.0",
      "Audi has unveiled the 2019 Q3. It gets an all-new design which is inspired by the flagship Q8. The new Q3 is based on the Volkswagen group’s MQB platform and is larger than its predecessor in size. Audi has also introduced a new 1.5-litre turbocharged petrol with the second-gen SUV. "),
  Car("Mercedes-Benz", 'assets/car7.jpg', "Mercedes", "55.89", "Black", "Manual", "4.0",
      "Audi has unveiled the 2019 Q3. It gets an all-new design which is inspired by the flagship Q8. The new Q3 is based on the Volkswagen group’s MQB platform and is larger than its predecessor in size. Audi has also introduced a new 1.5-litre turbocharged petrol with the second-gen SUV. "),
];

  List<Car> _carList = <Car>[];

  getCarList() {
    for(int i =1; calList.length > 0 ; i++){
      print('Car List: ${calList[i]}');
      //_carList.add(carViewModel.getCars());
    }

    //carController.add(carViewModel.getCars());
  }

  getContactData() async {
    
    await db.getContactList().then((data) {
      print("Data is: $data");
      _carList = [];
      for(int i=0; i<data.length; i++){

        Car contactItems = Car.fromMap(data[i]);
        _carList.add(contactItems);

        print('Contact Item: $contactItems');

      }

      data.forEach((allContact){

        Car todoitems = Car.fromMap(allContact);
        print('Contact Item forexch: $todoitems');

      });

    });

    carController.add(_carList..addAll(calList));

    print('Contect lIst:: $_carList');
  }
}
