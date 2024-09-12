import 'headers.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      Routes.SplashScreen: (context) => const SplashScreen(),
      Routes.HomePage: (context) => const HomePage(),
      Routes.clock[0]['route']: (context) => const ClockPage(),
      Routes.clock[1]['route']: (context) => const DigitalClockPage(),
      Routes.clock[2]['route']: (context) => const StrapClock(),
      Routes.clock[3]['route']: (context) => const StopClock(),
    });
  }
}
