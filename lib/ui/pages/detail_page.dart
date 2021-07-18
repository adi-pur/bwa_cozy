part of 'pages.dart';

class DetailPage extends StatefulWidget {
  final Space space;
  const DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    _launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // throw 'Could not launch $url';
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));
      }
    }

    Future<void> _confirmationDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Are you sure you want to contact the home owner?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _launchUrl('tel:${widget.space.phoneNumber}');
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Image.network(
            widget.space.photo,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(
                height: 308,
                width: 1,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30, horizontal: defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.space.name,
                                style:
                                    mediumBlackTextStyle.copyWith(fontSize: 22),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$${widget.space.price}',
                                    style: mediumPurpleTextStyle.copyWith(
                                        fontSize: 16),
                                  ),
                                  Text(
                                    ' / month',
                                    style: lightGreyTextStyle.copyWith(
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                          StarRatingWidget(
                            rating: widget.space.rating,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(
                        'Main Facilities',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 12,
                          bottom: 30,
                          left: defaultPadding,
                          right: defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilitiesCardWidget(
                              imageUrl: 'assets/images/icon_kitchen.png',
                              name: 'kitchen',
                              value: widget.space.kitchen),
                          FacilitiesCardWidget(
                              imageUrl: 'assets/images/icon_bedroom.png',
                              name: 'bedroom',
                              value: widget.space.bedroom),
                          FacilitiesCardWidget(
                              imageUrl: 'assets/images/icon_cupboard.png',
                              name: 'Big Lemari',
                              value: widget.space.bigLemari)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(
                        'Photos',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, bottom: 30),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.space.photoList
                              .map((photos) => Container(
                                    margin: EdgeInsets.only(
                                        right: photos !=
                                                widget.space.photoList.last
                                            ? 18
                                            : defaultPadding,
                                        left: photos ==
                                                widget.space.photoList.first
                                            ? defaultPadding
                                            : 0),
                                    width: 110,
                                    height: 88,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: NetworkImage(photos)),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Text(
                        'Location',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 6, left: defaultPadding, right: defaultPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.space.location}\n${widget.space.city}, ${widget.space.country}',
                            style: lightGreyTextStyle,
                          ),
                          InkWell(
                            onTap: () {
                              // _launchUrl('https://github.com/adi-pur');
                              _launchUrl(widget.space.url);
                            },
                            child: Image.asset(
                              'assets/images/btn_map.png',
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 40, horizontal: defaultPadding),
                      height: 50,
                      width: MediaQuery.of(context).size.width -
                          (2 * defaultPadding),
                      child: ElevatedButton(
                          onPressed: () {
                            _confirmationDialog();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17))),
                          child: Text(
                            'Book Now',
                            style: mediumWhiteTextStyle.copyWith(fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Image.asset(
                      isFavorite
                          ? 'assets/images/btn_wishlist_active.png'
                          : 'assets/images/btn_wishlist.png',
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
