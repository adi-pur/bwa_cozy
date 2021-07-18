part of 'models.dart';

class Tips {
  int id;
  String name;
  String photo;
  String updatedAt;

  Tips(
      {required this.id,
      required this.name,
      required this.photo,
      required this.updatedAt});
}

var tipsList = [
  Tips(
      id: 1,
      name: 'City Guidelines',
      photo: 'assets/images/tips1.png',
      updatedAt: '20 Apr'),
  Tips(
      id: 2,
      name: 'Jakarta Fairship',
      photo: 'assets/images/tips2.png',
      updatedAt: '11 Dec')
];
