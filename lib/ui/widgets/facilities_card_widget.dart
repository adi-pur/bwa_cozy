part of 'widgets.dart';

class FacilitiesCardWidget extends StatelessWidget {
  final String imageUrl, name;
  final int value;

  const FacilitiesCardWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          height: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              '$value ',
              style: mediumPurpleTextStyle,
            ),
            Text(
              name,
              style: lightGreyTextStyle,
            )
          ],
        ),
      ],
    );
  }
}
