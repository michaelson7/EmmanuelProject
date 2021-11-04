//StationStatsModel
class StationStatsModel {
  StationStatsModel({
    required this.year,
    required this.stationStatsModel,
  });

  dynamic year;
  List<StationStatsModelElement> stationStatsModel;

  factory StationStatsModel.fromJson(Map<String, dynamic> json) =>
      StationStatsModel(
        year: json["year"],
        stationStatsModel: List<StationStatsModelElement>.from(
          json["stationStatsModel"]
              .map((x) => StationStatsModelElement.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "stationStatsModel":
            List<dynamic>.from(stationStatsModel.map((x) => x.toJson())),
      };
}

class StationStatsModelElement {
  StationStatsModelElement({
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

  factory StationStatsModelElement.fromJson(Map<String, dynamic> json) =>
      StationStatsModelElement(
        year: json["year"],
        month: convertToMonth(json["month"]),
        waterLevel: json["waterLevel"].toDouble(),
        riverFlow: json["riverFlow"].toDouble(),
        temperature: json["temperature"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "waterLevel": waterLevel,
        "riverFlow": riverFlow,
        "temperature": temperature,
      };
}

convertToMonth(int month) {
  String monthValue = 'Jan';
  switch (month) {
    case 1:
      monthValue = 'Jan';
      break;
    case 2:
      monthValue = 'Feb';
      break;
    case 3:
      monthValue = 'March';
      break;
    case 4:
      monthValue = 'April';
      break;
    case 5:
      monthValue = 'May';
      break;
    case 6:
      monthValue = 'June';
      break;
    case 7:
      monthValue = 'July';
      break;
    case 8:
      monthValue = 'August';
      break;
    case 9:
      monthValue = 'September';
      break;
    case 10:
      monthValue = 'October';
      break;
    case 11:
      monthValue = 'November';
      break;
    case 11:
      monthValue = 'December';
      break;
  }
  return monthValue;
}
