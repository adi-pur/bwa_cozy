part of 'widgets.dart';

class NavbarButtonWidget extends StatelessWidget {
  final String iconUrl;
  final bool isActived;

  const NavbarButtonWidget(
      {Key? key, required this.iconUrl, required this.isActived})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          iconUrl,
          width: 26,
        ),
        Spacer(),
        isActived
            ? Container(
                width: 30,
                height: 3,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(
                width: 30,
                height: 3,
              )
      ],
    );
  }
}
