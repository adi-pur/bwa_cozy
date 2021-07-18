part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: mediumBlackTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                textAlign: TextAlign.center,
                style: lightGreyTextStyle.copyWith(fontSize: 16),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 210,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17))),
                    child: Text(
                      'Back to Home',
                      style: mediumWhiteTextStyle.copyWith(fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
