class TimeModel {
  // final String? date;
  // final String? city;
  final String fajr;
  final String shurooq;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final double latitude;
  final double longitude;
  final String timezone;

  TimeModel(
      {required this.latitude,
      required this.longitude,
      required this.timezone,
      required this.fajr,
      required this.shurooq,
      required this.dhuhr,
      required this.asr,
      required this.maghrib,
      required this.isha});

  factory TimeModel.fromJSON(Map<String, dynamic> json) {
    return TimeModel(
        timezone: json['data']['meta']['timezone'],
        fajr: json['data']['timings']['Fajr'],
        shurooq: json['data']['timings']['Sunrise'],
        dhuhr: json['data']['timings']['Dhuhr'],
        asr: json['data']['timings']['Asr'],
        maghrib: json['data']['timings']['Maghrib'],
        isha: json['data']['timings']['Isha'],
        latitude: json['data']['meta']['latitude'],
        longitude: json['data']['meta']['longitude']);
  }
}

// class Meta {
//   Meta({
//     this.latitude,
//     this.longitude,
//     this.timezone,
//     this.method,
//     this.latitudeAdjustmentMethod,
//     this.midnightMode,
//     this.school,
//     required this.offset,
//   });

//   double? latitude;
//   double? longitude;
//   String? timezone;
//   Method? method;
//   String? latitudeAdjustmentMethod;
//   String? midnightMode;
//   String? school;
//   Map<String, int> offset;

//   factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//         timezone: json["timezone"],
//         method: Method.fromJson(json["method"]),
//         latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
//         midnightMode: json["midnightMode"],
//         school: json["school"],
//         offset:
//             Map.from(json["offset"]).map((k, v) => MapEntry<String, int>(k, v)),
//       );

//   Map<String, dynamic> toJson() => {
//         "latitude": latitude,
//         "longitude": longitude,
//         "timezone": timezone,
//         "method": method.toJson(),
//         "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
//         "midnightMode": midnightMode,
//         "school": school,
//         "offset":
//             Map.from(offset).map((k, v) => MapEntry<String, dynamic>(k, v)),
//       };
// }

// https://muslimsalat.com/amman.json?key=da7f38e5d29bf7634e29fd796c8bfaf6

// https://muslimsalat.com/daily.json


// city: json['address'],
//         fajr: json['items'][0]['fajr'],
//         shurooq: json['items'][0]['shurooq'],
//         dhuhr: json['items'][0]['dhuhr'],
//         asr: json['items'][0]['asr'],
//         maghrib: json['items'][0]['maghrib'],
//         isha: json['items'][0]['isha']);