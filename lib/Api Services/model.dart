class CarList {
  int? id;
  String? category;
  String? brand;
  String? rent;
  String? car;
  String? rating;
  String? imagepath;

  CarList(
      {this.id,
      this.category,
      this.brand,
      this.rent,
      this.car,
      this.rating,
      this.imagepath});

  CarList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    brand = json['brand'];
    rent = json['rent'];
    car = json['car'];
    rating = json['rating'];
    imagepath = json['imagepath'];
  }
 
  static List<CarList> fromJsonList(List<dynamic> jsonLst) {
   
    jsonLst.forEach((car) {
      cars.add(CarList.fromJson(car));
    });
    return cars;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category'] = this.category;
    data['brand'] = this.brand;
    data['rent'] = this.rent;
    data['car'] = this.car;
    data['rating'] = this.rating;
    data['imagepath'] = this.imagepath;
    return data;
  }
}
  List<CarList> cars = [];