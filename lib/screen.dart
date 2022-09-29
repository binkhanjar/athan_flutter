import 'package:athan/api_serveces.dart';
import 'package:athan/location.dart';
import 'package:athan/model.dart';

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class ScreenTime extends StatefulWidget {
  const ScreenTime({super.key});

  @override
  State<ScreenTime> createState() => _ScreenTimeState();
}

class _ScreenTimeState extends State<ScreenTime> {
  //final ApiServices _apiServices = ApiServices();
  final LocationCity _locationCity = LocationCity();

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    HijriCalendar.setLocal('ar');
    var _hijri = HijriCalendar.now();
    var day = DateTime.now();
    var format = DateFormat('EEE d MMM yyyy');
    var formatted = format.format(day);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: _size.height * 0.25, // 25 %
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/maca.jpg'),
                  ),
                ),
                //margin: EdgeInsets.all(8.0),
                //padding: EdgeInsets.all(8.0),
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          //color: Colors.black26,
                          //alignment: Alignment.topRight,
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: RichText(
                            text: TextSpan(children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    _hijri.hDay.toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    _hijri.longMonthName,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    _hijri.hYear.toString(),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        // const SizedBox(
                        //   height: 120,
                        // ),
                        Container(
                          //alignment: Alignment.bottomCenter,
                          decoration: const BoxDecoration(
                            //shape: BoxShape.circle,
                            color: Colors.black38,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            formatted,
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: FutureBuilder(
                        future:
                            _locationCity.getLocation(), //_apiServices.getTime
                        builder: (BuildContext context,
                            AsyncSnapshot<TimeModel> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return const Icon(Icons.sync_problem);
                            case ConnectionState.waiting:
                            case ConnectionState.active:
                              return const Padding(
                                padding: EdgeInsets.all(150),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            case ConnectionState.done:
                              return ListView(children: [
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('City'),
                                        Text(snapshot.data!.timezone),
                                      ],
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Fajer'),
                                          Text(snapshot.data!.fajr),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Shuroq'),
                                          Text(snapshot.data!.shurooq),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Dhuhr'),
                                          Text(snapshot.data!.dhuhr),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Asr'),
                                          Text(snapshot.data!.asr),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Maghrib'),
                                          Text(snapshot.data!.maghrib),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                      child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Isha'),
                                        Text(snapshot.data!.isha),
                                      ],
                                    ),
                                  ))
                                ]),
                              ]);
                          }
                        })))
          ],
        )));
  }
}
                             
                

     
    
  
   

// Container(
//             height: _size.height * 0.25, // 25 %
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage('images/maca.jpg'),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   //crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                           style:
//                               const TextStyle(backgroundColor: Colors.black12),
//                           children: [
//                             WidgetSpan(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Text(
//                                   _hijri.hDay.toString(),
//                                   style: const TextStyle(
//                                     fontSize: 16.0,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             WidgetSpan(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Text(
//                                   _hijri.longMonthName,
//                                   style: const TextStyle(
//                                     fontSize: 16.0,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             WidgetSpan(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(4.0),
//                                 child: Text(
//                                   _hijri.hYear.toString(),
//                                   style: const TextStyle(
//                                     fontSize: 16.0,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ]),
//                     ),
//                     const SizedBox(
//                       height: 120,
//                     ),
//                     Container(
//                       color: Colors.black12,
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         formatted,
//                         style: const TextStyle(
//                             fontSize: 16.0,
//                             // backgroundColor: Colors.black38,
//                             color: Colors.white),
//                       ),
//                     )
//                   ]),
//             ),
//           ),