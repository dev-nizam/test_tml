/// id : 495
/// brand : "maybelline"
/// name : "Maybelline Face Studio Master Hi-Light Light Booster Bronzer"
/// price : "14.99"
/// image_link : "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png"
/// description : "Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert \nbalance of shade + shimmer illuminator for natural glow. Skin goes \nsoft-lit with zero glitz.\n\n\t\tFor Best Results: Brush over all shades in palette and gently sweep over \ncheekbones, brow bones, and temples, or anywhere light naturally touches\n the face.\n\n\t\t\n\t\n\n                    "
/// rating : 5

class TestModel {
  TestModel({
      num? id, 
      String? brand, 
      String? name, 
      String? price, 
      String? imageLink, 
      String? description, 
      num? rating,}){
    _id = id;
    _brand = brand;
    _name = name;
    _price = price;
    _imageLink = imageLink;
    _description = description;
    _rating = rating;
}
  static List<TestModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => TestModel.fromJson(value)).toList();
  }
  TestModel.fromJson(dynamic json) {
    _id = json['id'];
    _brand = json['brand'];
    _name = json['name'];
    _price = json['price'];
    _imageLink = json['image_link'];
    _description = json['description'];
    _rating = json['rating'];
  }
  num? _id;
  String? _brand;
  String? _name;
  String? _price;
  String? _imageLink;
  String? _description;
  num? _rating;
TestModel copyWith({  num? id,
  String? brand,
  String? name,
  String? price,
  String? imageLink,
  String? description,
  num? rating,
}) => TestModel(  id: id ?? _id,
  brand: brand ?? _brand,
  name: name ?? _name,
  price: price ?? _price,
  imageLink: imageLink ?? _imageLink,
  description: description ?? _description,
  rating: rating ?? _rating,
);
  num? get id => _id;
  String? get brand => _brand;
  String? get name => _name;
  String? get price => _price;
  String? get imageLink => _imageLink;
  String? get description => _description;
  num? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['brand'] = _brand;
    map['name'] = _name;
    map['price'] = _price;
    map['image_link'] = _imageLink;
    map['description'] = _description;
    map['rating'] = _rating;
    return map;
  }

}