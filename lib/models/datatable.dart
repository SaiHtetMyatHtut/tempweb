import 'dart:convert';

List<TableData> dataTableFromJson(String str) =>
    List<TableData>.from(json.decode(str).map((x) => TableData.fromJson(x)));

String dataTableToJson(List<TableData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableData {
  TableData({
    required this.agentId,
    required this.amount,
    required this.gameType,
    required this.id,
    required this.luckNum,
    required this.poukTee,
    required this.timeStamp,
  });

  int agentId;
  String amount;
  String gameType;
  int id;
  String luckNum;
  String poukTee;
  String timeStamp;

  factory TableData.fromJson(Map<String, dynamic> json) => TableData(
        agentId: json["agent_id"],
        amount: json["amount"],
        gameType: json["game_type"],
        id: json["id"],
        luckNum: json["luck_num"],
        poukTee: json["pouk_tee"],
        timeStamp: json["time_stamp"],
      );

  Map<String, dynamic> toJson() => {
        "agent_id": agentId,
        "amount": amount,
        "game_type": gameType,
        "id": id,
        "luck_num": luckNum,
        "pouk_tee": poukTee,
        "time_stamp": timeStamp,
      };
}
