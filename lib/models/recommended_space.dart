part of 'models.dart';

class Space {
  int id, price, rating, kitchen, bedroom, bigLemari;
  String name, photo, city, country, location, url, phoneNumber;
  List photoList;

  Space(
      {required this.id,
      required this.name,
      required this.photo,
      required this.price,
      required this.city,
      required this.country,
      required this.rating,
      required this.kitchen,
      required this.bedroom,
      required this.bigLemari,
      required this.photoList,
      required this.location,
      required this.url,
      required this.phoneNumber});

  factory Space.fromJson(json) {
    return Space(
        id: json['id'],
        name: json['name'],
        photo: json['image_url'],
        price: json['price'],
        city: json['city'],
        country: json['country'],
        rating: json['rating'],
        kitchen: json['number_of_kitchens'],
        bedroom: json['number_of_bedrooms'],
        bigLemari: json['number_of_cupboards'],
        photoList: json['photos'],
        location: json['address'],
        url: json['map_url'],
        phoneNumber: json['phone']);
  }
}
