import 'dart:io';

import 'package:car_ecommerce/model/car_model.dart';
import 'package:car_ecommerce/model/car_model.dart';
import 'package:car_ecommerce/util/database_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import 'car_bloc.dart';

class PostAdBloc {
  final db = new DataBaseHelper();
  final _carBloc = ProductBloc();

  static final _nameController = BehaviorSubject<String>();
  static final _imageController = BehaviorSubject<String>();
  static final _imagePathController = BehaviorSubject<File>();
  static final _ratingController = BehaviorSubject<String>();
  static final _priceController = BehaviorSubject<String>();
  static final _colorController = BehaviorSubject<String>();
  static final _carTypeController = BehaviorSubject<String>();
  static final _brandController = BehaviorSubject<String>();
  static final _descriptionController = BehaviorSubject<String>();
  static final _loadingController = BehaviorSubject<bool>.seeded(false);

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get imageStream => _imageController.stream;
  Stream<File> get imagePathStream => _imagePathController.stream;
  Stream<String> get ratingStream => _ratingController.stream;
  Stream<String> get priceStream => _priceController.stream;
  Stream<String> get colorStream => _colorController.stream;
  Stream<String> get carTypeStream => _carTypeController.stream;
  Stream<String> get brandStream => _brandController.stream;
  Stream<String> get descriptionStream => _descriptionController.stream;
  Stream<bool> get loadingStream => _loadingController.stream;

  Function(String) get nameSink => _nameController.sink.add;
  Function(String) get imageSink => _imageController.sink.add;
  Function(File) get imagePathSink => _imagePathController.sink.add;
  Function(String) get ratingSink => _ratingController.sink.add;
  Function(String) get priceSink => _priceController.sink.add;
  Function(String) get colorSink => _colorController.sink.add;
  Function(String) get carTypeSink => _carTypeController.sink.add;
  Function(String) get brandSink => _brandController.sink.add;
  Function(String) get descriptionSink => _descriptionController.sink.add;
  Function(bool) get loadingSink => _loadingController.sink.add;

  init() {
    _nameController.value = "";
    _imageController.value = "";
    _imagePathController.value = null;
    _ratingController.value = "";
    _priceController.value = "";
    _colorController.value = "";
    _carTypeController.value = "";
    _brandController.value = "";
    _descriptionController.value = "";
  }

  Future uploadImage({bool camera = true}) async {
    var tempImage = await ImagePicker.pickImage(source: camera ? ImageSource.camera : ImageSource.gallery);
    imagePathSink(tempImage);
    imageSink(tempImage.path);
    print('Image path: ${tempImage.path}');
  }

  //Car(this._name, this._image, this._brand, this._price, this._color, this._carType, this._rating, this._description);
  void saveCarAdData() async {
    Car formData = Car(
      _nameController.value,
      _imageController.value,
      _brandController.value,
      _priceController.value,
      _colorController.value,
      _carTypeController.value,
      _ratingController.value,
      _descriptionController.value,
    );

    print("Saved Data: $formData");

    await db.saveAdData(formData).then((data) {
      print("Saved Contact Data: $data");
      db.getContactList();
      _carBloc.getContactData();
      loadingSink(false);
    });
  }

  dispose() {
    _nameController.close();
    _imageController.close();
    _imagePathController.close();
    _ratingController.close();
    _priceController.close();
    _colorController.close();
    _carTypeController.close();
    _brandController.close();
    _descriptionController.close();
    _loadingController.close();
  }
}
