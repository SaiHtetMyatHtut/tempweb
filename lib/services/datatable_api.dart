import 'package:better_web_v2/constants/linkdata.dart';
import 'package:better_web_v2/models/datatable.dart';
import 'package:http/http.dart' as http;

class DataTableAPI {
  static Stream<List<TableData>> getTable(id) =>
      Stream.periodic(const Duration(seconds: 1))
          .asyncMap((event) => getData(id));
  static Future<List<TableData>> getData(id) async {
    final response = await http.get(Uri.parse(UriLink.uri + '/userdata/$id'));
    final jsonString = response.body;
    return dataTableFromJson(jsonString);
  }
}
