class Car {
  int _adId;
  String _name;
  String _image;
  String _rating;
  String _price;
  String _color;
  String _carType;
  String _brand;
  String _description;

  Car(this._name, this._image, this._brand, this._price, this._color, this._carType, this._rating, this._description);

  Car.map(dynamic obj) {
    this._adId = obj["adId"];
    this._name = obj["name"];
    this._rating = obj["rating"];
    this._price = obj["price"];
    this._color = obj["color"];
    this._carType = obj["carType"];
    this._brand = obj["brand"];
    this._description = obj["description"];
    this._image = obj["imagePath"];
  }

  int get adId => _adId;

  String get name => _name;

  String get rating => _rating;

  String get price => _price;

  String get color => _color;

  String get carType => _carType;

  String get brand => _brand;

  String get description => _description;

  String get imagePath => _image;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["rating"] = _rating;
    map["price"] = _price;
    map["color"] = _color;
    map["carType"] = _carType;
    map["brand"] = _brand;
    map["description"] = _description;
    map["imagePath"] = _image;
    if (_adId != null) {
      map["adId"] = _adId;
    }
    return map;
  }

  Car.fromMap(Map<String, dynamic> map) {
    this._adId = map["adId"];
    this._name = map["name"];
    this._rating = map["rating"];
    this._price = map["price"];
    this._color = map["color"];
    this._carType = map["carType"];
    this._brand = map["brand"];
    this._description = map["description"];
    this._image = map["imagePath"];
  }
}
