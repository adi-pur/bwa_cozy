part of 'widgets.dart';

class PopularCardWidget extends StatelessWidget {
  final Cities cities;

  const PopularCardWidget({
    Key? key,
    required this.cities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: cities != citiesList.last ? 20 : defaultPadding,
          left: cities == citiesList.first ? defaultPadding : 0),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: cardBackgroundColor),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            child: Stack(
              children: [
                Image.asset(
                  cities.photo,
                ),
                cities.isFavorite
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(36)),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/icon_star.png',
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 11, bottom: 13),
            child: Text(
              cities.name,
              style: mediumBlackTextStyle.copyWith(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
