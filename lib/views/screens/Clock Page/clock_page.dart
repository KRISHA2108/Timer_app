import 'dart:math';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime d = DateTime.now();

  void startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

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
          Align(
            alignment: const Alignment(0, 0.8),
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: const Text(
                "Analog Clock",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ...List.generate(
                      60,
                      (index) => Transform.rotate(
                        angle: index * (pi * 2) / 60,
                        child: Divider(
                          endIndent: index % 5 == 0
                              ? size.width * 0.88
                              : size.width * 0.9,
                          thickness: 2,
                          color: index % 5 == 0 ? Colors.yellow : Colors.grey,
                        ),
                      ),
                    ),
                    //hourHand
                    Transform.rotate(
                      angle: pi / 2,
                      child: Transform.rotate(
                        angle: d.hour * (pi * 2) / 12,
                        child: Divider(
                          indent: 50,
                          endIndent: size.width * 0.5 - 16,
                          color: Colors.white,
                          thickness: 4,
                        ),
                      ),
                    ),
                    //minuteHand
                    Transform.rotate(
                      angle: pi / 2,
                      child: Transform.rotate(
                        angle: d.minute * (pi * 2) / 60,
                        child: Divider(
                          indent: 30,
                          endIndent: size.width * 0.5 - 16,
                          color: Colors.white,
                          thickness: 2,
                        ),
                      ),
                    ),
                    //secondHand
                    Transform.rotate(
                      angle: pi / 2,
                      child: Transform.rotate(
                        angle: d.second * (pi * 2) / 60,
                        child: Divider(
                          indent: 20,
                          endIndent: size.width * 0.5 - 16,
                          color: Colors.yellow,
                          thickness: 2,
                        ),
                      ),
                    ),
                    //dot
                    const CircleAvatar(
                      radius: 10,
                    ),
                    //allDials
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
