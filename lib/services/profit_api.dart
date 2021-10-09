import 'package:better_web_v2/constants/linkdata.dart';
import 'package:better_web_v2/models/profit.dart';
import 'package:http/http.dart' as http;

class ProfitAPI {
  static Stream<Profit> getProfit() =>
      Stream.periodic(const Duration(seconds: 1))
          .asyncMap((event) => getProfits());

  static Future<Profit> getProfits() async {
    final response = await http.get(Uri.parse(UriLink.uri + '/profit'));
    final jsonString = response.body;
    return profitFromJson(jsonString);
  }
}
