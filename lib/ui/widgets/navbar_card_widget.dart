part of 'widgets.dart';

class NavbarCardWidget extends StatelessWidget {
  const NavbarCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavbarButtonWidget(
            iconUrl: 'assets/images/icon_home.png',
            isActived: true,
          ),
          NavbarButtonWidget(
            iconUrl: 'assets/images/icon_email.png',
            isActived: false,
          ),
          NavbarButtonWidget(
            iconUrl: 'assets/images/icon_card.png',
            isActived: false,
          ),
          NavbarButtonWidget(
            iconUrl: 'assets/images/icon_love.png',
            isActived: false,
          )
        ],
      ),
    );
  }
}
