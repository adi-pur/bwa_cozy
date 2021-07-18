part of 'widgets.dart';

class StarRatingWidget extends StatelessWidget {
  final int rating;
  const StarRatingWidget({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1, 2, 3, 4, 5]
          .map((index) => Image.asset(
                index <= rating
                    ? 'assets/images/icon_star.png'
                    : 'assets/images/icon_star_grey.png',
                width: 20,
              ))
          .toList(),
    );
  }
}
