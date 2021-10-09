import 'dart:convert';

Profit profitFromJson(String str) => Profit.fromJson(json.decode(str));

String profitToJson(Profit data) => json.encode(data.toJson());

class Profit {
  final int totalIncome;
  int totalProfit;
  int totalRefund;
  Profit({
    required this.totalIncome,
    required this.totalProfit,
    required this.totalRefund,
  });

  factory Profit.fromJson(Map<String, dynamic> json) => Profit(
        totalIncome: json["totalIncome"],
        totalProfit: json["totalProfit"],
        totalRefund: json["totalRefund"],
      );

  Map<String, dynamic> toJson() => {
        "totalIncome": totalIncome,
        "totalProfit": totalProfit,
        "totalRefund": totalRefund,
      };
}
