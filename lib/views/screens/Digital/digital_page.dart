import 'package:flutter/material.dart';

class DigitalClockPage extends StatefulWidget {
  const DigitalClockPage({super.key});

  @override
  State<DigitalClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<DigitalClockPage> {
  int s = 00, m = 00, h = 00;
  void StartClock() {
    m = DateTime.now().minute;
    s = DateTime.now().second;
    h = DateTime.now().hour;
    setState(() {});
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        setState(
          () {
            StartClock();
          },
        );
      },
    );
  }

  @override
  void initState() {
    StartClock();
    super.initState();
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
                "Digital Clock",
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 900,
                      ),
                      Text(
                        '${h % 12}:'.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$m:'.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '$s'.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        StartClock();
                      },
                      child: const Text(
                        'Start Clock',
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            h = 00;
                            m = 00;
                            s = 00;
                          },
                        );
                      },
                      child: const Text(
                        'Reset Clock',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
