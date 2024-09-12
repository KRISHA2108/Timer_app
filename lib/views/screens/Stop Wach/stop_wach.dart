import 'dart:async';

import 'package:flutter/material.dart';

class StopClock extends StatefulWidget {
  const StopClock({super.key});

  @override
  State<StopClock> createState() => _StopClockState();
}

class _StopClockState extends State<StopClock> {
  List flags = [];

  DateTime dateTime = DateTime.now();
  Timer? timer;
  int minute = 00;
  int second = 00;
  int mills = 00;
  bool stop = false;

  void _timer() {
    stop = true;
    Future.delayed(
      const Duration(milliseconds: 10),
      () {
        setState(() {
          if (stop) {
            mills++;
          }
          if (mills > 60) {
            second++;
            mills = 0;
          }
          if (second > 60) {
            minute++;
            second = 0;
          }
          if (minute > 23) {
            minute = 0;
          }
        });
        if (stop) {
          _timer();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _addFlag() {
    setState(() {});
    flags.add(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            height: double.infinity,
            child: Image(
              image: AssetImage("lib/assets/images/clock.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                // Time
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " ${minute.toString().padLeft(2, '0')} : ${second.toString().padLeft(2, '0')} : ${mills.toString().padLeft(2, '0')} ",
                        style: const TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                //Icons
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (!stop) {
                            _timer();
                          }
                          setState(() {});
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          stop = false;
                          setState(() {});
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _addFlag();
                          setState(() {});
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: const Icon(
                          Icons.flag,
                          color: Colors.white,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          flags.clear();
                          stop = false;
                          minute = 00;
                          second = 00;
                          mills = 00;
                          setState(() {});
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.white.withOpacity(0.3),
                          ),
                        ),
                        child: const Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                //Flag Print
                Expanded(
                  flex: 4,
                  child: ListView.builder(
                    itemCount: flags.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "🏳️ ${flags[index].hour.toString().padLeft(2, '0')} : ${flags[index].second.toString().padLeft(2, '0').padLeft(2, '0')} ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
