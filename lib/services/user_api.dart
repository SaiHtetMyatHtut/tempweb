import 'package:better_web_v2/constants/linkdata.dart';
import 'package:better_web_v2/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static Stream<List<User>> getUser() =>
      Stream.periodic(const Duration(seconds: 1))
          .asyncMap((event) => getUsers());

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(UriLink.uri + '/user'));
    final jsonString = response.body;
    return userFromJson(jsonString);
  }
}
