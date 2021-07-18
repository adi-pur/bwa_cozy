part of 'widgets.dart';

class TipsCardWidget extends StatelessWidget {
  final Tips tips;
  const TipsCardWidget({Key? key, required this.tips}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: tips != tipsList.last ? 20 : 0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                image: AssetImage(tips.photo),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.name,
                style: mediumBlackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Updated ${tips.updatedAt}',
                style: lightGreyTextStyle,
              )
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ),
          )
        ],
      ),
    );
  }
}
