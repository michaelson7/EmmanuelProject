class HistoricalDataModel {
  HistoricalDataModel({
    required this.year,
    required this.stationStatsModel,
  });

  dynamic year;
  List<StationStatsModel>? stationStatsModel;

  factory HistoricalDataModel.fromJson(Map<String, dynamic> json) =>
      HistoricalDataModel(
        year: json["year"],
        stationStatsModel: List<StationStatsModel>.from(
            json["stationStatsModel"]
                .map((x) => StationStatsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "stationStatsModel":
            List<dynamic>.from(stationStatsModel!.map((x) => x.toJson())),
      };
}

class StationStatsModel {
  StationStatsModel({
    required this.year,
    required this.month,
    required this.waterLevel,
    required this.riverFlow,
    required this.temperature,
  });

  dynamic year;
  dynamic month;
  dynamic waterLevel;
  dynamic riverFlow;
  dynamic temperature;

  factory StationStatsModel.fromJson(Map<String, dynamic> json) =>
      StationStatsModel(
        year: json["year"],
        month: json["month"],
        waterLevel: json["waterLevel"],
        riverFlow: json["riverFlow"].toDouble(),
        temperature: json["temperature"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "waterLevel": waterLevel,
        "riverFlow": riverFlow,
        "temperature": temperature,
      };
}
