import 'package:athan/location.dart';
import 'package:athan/model.dart';
import 'package:flutter/material.dart';

class ScreenTime2 extends StatefulWidget {
  const ScreenTime2({super.key});

  @override
  State<ScreenTime2> createState() => _ScreenTime2State();
}

class _ScreenTime2State extends State<ScreenTime2> {
  final LocationCity _locationCity = LocationCity();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<TimeModel>(
            future: _locationCity.getLocation(),
            builder: (BuildContext context, AsyncSnapshot<TimeModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Icon(Icons.sync_problem);
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Padding(
                    padding: EdgeInsets.all(150),
                    child: Center(child: CircularProgressIndicator()),
                  );
                case ConnectionState.done:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('City'),
                            Text(snapshot.data!.timezone),
                          ],
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Fajer'),
                              Text(snapshot.data!.fajr),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Shuroq'),
                              Text(snapshot.data!.shurooq),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Dhuhr'),
                              Text(snapshot.data!.dhuhr),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Asr'),
                              Text(snapshot.data!.asr),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Maghrib'),
                              Text(snapshot.data!.maghrib),
                            ],
                          ),
                        ),
                      ),
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Isha'),
                            Text(snapshot.data!.isha),
                          ],
                        ),
                      ))
                    ]),
                  );
              }
            }),
      ),
    );
  }
}
