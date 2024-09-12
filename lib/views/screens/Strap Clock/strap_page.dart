import 'package:flutter/material.dart';

class StrapClock extends StatefulWidget {
  const StrapClock({super.key});

  @override
  State<StrapClock> createState() => _StrapClockState();
}

class _StrapClockState extends State<StrapClock> {
  DateTime dateTime = DateTime.now();
  void startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      dateTime = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    startClock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
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
                  "Strap Clock",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Transform.scale(
              scale: 8.0,
              child: CircularProgressIndicator(
                color: Colors.lightBlueAccent,
                value: dateTime.hour % 12 / 12,
                strokeWidth: 2,
              ),
            ),
            Transform.scale(
              scale: 6.0,
              child: CircularProgressIndicator(
                color: Colors.yellow,
                value: dateTime.minute / 60,
                strokeWidth: 2,
              ),
            ),
            Transform.scale(
              scale: 4.0,
              child: CircularProgressIndicator(
                color: Colors.red,
                value: dateTime.second / 60,
                strokeWidth: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
