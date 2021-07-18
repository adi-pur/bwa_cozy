part of 'pages.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    List spaces = [];
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            //NOTE: HEADER
            Container(
              margin: EdgeInsets.only(
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Now',
                    style: mediumBlackTextStyle.copyWith(fontSize: 24),
                  ),
                  Text(
                    'Mencari kosan yang cozy',
                    style: lightGreyTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            //NOTE: POPULAR CITIES
            Container(
              margin:
                  EdgeInsets.only(top: 30, bottom: 16, left: defaultPadding),
              child: Text(
                'Popular Cities',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: citiesList.length,
                itemBuilder: (context, index) {
                  Cities cities = citiesList[index];
                  return PopularCardWidget(cities: cities);
                },
              ),
            ),
            //NOTE: RECOMMENDED SPACE
            Container(
              margin:
                  EdgeInsets.only(top: 30, bottom: 16, left: defaultPadding),
              child: Text(
                'Recommended Space',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: FutureBuilder(
                  future: spaceProvider
                      .getRecommendedSpace()
                      .then((value) => spaces = value),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: spaces
                            .map((space) => RecommendedCardWidget(
                                  space: space,
                                  spaceLast: spaces.last,
                                ))
                            .toList(),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )), //NOTE: RECOMMENDED SPACE
            Container(
              margin:
                  EdgeInsets.only(top: 30, bottom: 16, left: defaultPadding),
              child: Text(
                'Tips & Guidance',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children:
                    tipsList.map((tips) => TipsCardWidget(tips: tips)).toList(),
              ),
            ),
            SizedBox(
              height: 65 + defaultPadding,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavbarCardWidget(),
    );
  }
}
