part of 'providers.dart';

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    Uri url = Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces');

    var result = await http.get(url);

    // print(result.statusCode);
    // print(result.body);

    if (result.statusCode == 200) {
      List jsonObject = jsonDecode(result.body);
      List spaces = jsonObject.map((e) => Space.fromJson(e)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
