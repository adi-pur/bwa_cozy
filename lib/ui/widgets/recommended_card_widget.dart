part of 'widgets.dart';

class RecommendedCardWidget extends StatelessWidget {
  final Space space, spaceLast;

  const RecommendedCardWidget({
    Key? key,
    required this.space,
    required this.spaceLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(space: space)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: space != spaceLast ? 30 : 0),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              width: 130,
              height: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(space.photo), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(18)),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 70,
                  height: 30,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        topRight: Radius.circular(18)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon_star.png',
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        '${space.rating}/5',
                        style: mediumWhiteTextStyle.copyWith(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    space.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: mediumBlackTextStyle.copyWith(fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2, bottom: 16),
                    child: Row(
                      children: [
                        Text(
                          '\$${space.price}',
                          style: mediumPurpleTextStyle.copyWith(fontSize: 16),
                        ),
                        Text(
                          ' / month',
                          style: lightGreyTextStyle.copyWith(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '${space.city}, ${space.country}',
                    style: lightGreyTextStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
