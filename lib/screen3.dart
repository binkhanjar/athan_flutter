

// import 'package:location/location.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:location/location.dart';

// class PrayerScreen extends StatefulWidget {
//   const PrayerScreen({super.key});

//   @override
//   State<PrayerScreen> createState() => _PrayerScreenState();
// }

// class _PrayerScreenState extends State<PrayerScreen> {
//   Location location = Location();
//   LocationData? _currentPosition;
//   double? latitude, longitude;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             'Prayer Timings',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: FutureBuilder(
//             future: getLoc(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               // final myCoordinates = Coordinates(33.7699333, 72.8248431);
//               // final params = CalculationMethod.umm_al_qura.getParameters();
//               // params.madhab = Madhab.shafi;
//               // final prayerTimes = PrayerTimes.today(myCoordinates, params);

//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Sunrise',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.jm().format(prayerTimes.sunrise),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.black,
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Fajer',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.jm().format(prayerTimes.fajr),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.black,
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Dhuhr',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.jm().format(prayerTimes.dhuhr),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.black,
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Asr',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.jm().format(prayerTimes.asr),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.black,
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Maghrib',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.jm().format(prayerTimes.maghrib),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.black,
//                       thickness: 1,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Isha',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.jm().format(prayerTimes.isha),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                       color: Colors.black,
//                       thickness: 1,
//                     ),
//                   ],
//                 ),
//               );
//             }),
//       ),
//     );
//   }

//   getLoc() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//     _currentPosition = await location.getLocation();
//     latitude = _currentPosition!.latitude!;
//     longitude = _currentPosition!.longitude!;
//   }
// }











// // import 'package:athan/location.dart';
// // import 'package:athan/model.dart';
// // import 'package:flutter/material.dart';

// // class FutureBuilderExample extends StatefulWidget {
// //   const FutureBuilderExample({super.key});

// //   @override
// //   State<StatefulWidget> createState() {
// //     return _FutureBuilderExampleState();
// //   }
// // }

// // class _FutureBuilderExampleState extends State<FutureBuilderExample> {
// //   final LocationCity _locationCity = LocationCity();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Prayer Time'),
// //         ),
// //         body: SizedBox(
// //           width: double.infinity,
// //           child: Center(
// //             child: FutureBuilder<TimeModel>(
// //                 future: _locationCity.getLocation(),
// //                 builder:
// //                     (BuildContext context, AsyncSnapshot<TimeModel> snapshot) {
// //                   if (snapshot.connectionState == ConnectionState.waiting) {
// //                     return Column(
// //                       crossAxisAlignment: CrossAxisAlignment.center,
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: const [
// //                         CircularProgressIndicator(),
// //                       ],
// //                     );
// //                   } else if (snapshot.connectionState == ConnectionState.done) {
// //                     if (snapshot.hasError) {
// //                       return const Text('Error');
// //                     } else if (snapshot.hasData) {
// //                       return Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Column(
// //                           children: <Widget>[
// //                             Text(snapshot.data!.timezone),
// //                             Text(snapshot.data!.fajr),
// //                             Text(snapshot.data!.shurooq),
// //                             Text(snapshot.data!.dhuhr),
// //                             Text(snapshot.data!.asr),
// //                             Text(snapshot.data!.maghrib),
// //                             Text(snapshot.data!.isha),
// //                           ],
// //                         ),
// //                       );
// //                     }
// //                   }
// //                 }),
// //           ),
// //         ));
// //   }
// // }
