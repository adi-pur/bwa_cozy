part of 'models.dart';

class Cities {
  int id;
  String name;
  String photo;
  bool isFavorite;

  Cities(
      {required this.id,
      required this.name,
      required this.photo,
      this.isFavorite = false});
}

var citiesList = [
  Cities(id: 1, name: "Jakarta", photo: 'assets/images/city1.png'),
  Cities(
      id: 2,
      name: "Bandung",
      photo: 'assets/images/city2.png',
      isFavorite: true),
  Cities(id: 3, name: "Surabaya", photo: 'assets/images/city3.png'),
  Cities(id: 4, name: "Palembang", photo: 'assets/images/city4.png'),
  Cities(
      id: 5, name: "Aceh", photo: 'assets/images/city5.png', isFavorite: true),
  Cities(id: 6, name: "Bogor", photo: 'assets/images/city6.png'),
];
