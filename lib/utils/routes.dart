class Routes {
  static String SplashScreen = '/';
  static String HomePage = 'home_page';

  static List<Map<String, dynamic>> clock = [
    {
      'name': "Analog_Clock",
      'route': 'analog_clock',
      'image': "lib/assets/images/analog.png",
    },
    {
      'name': "Digital_Clock",
      'route': 'digital_clock',
      'image': "lib/assets/images/digital.jpg",
    },
    {
      'name': "Strap_Clock",
      'route': 'strap_clock',
      'image': "lib/assets/images/image.png",
    },
    {
      'name': "Stop_watch",
      'route': 'stop_watch',
      'image': "lib/assets/images/stop.webp",
    },
  ];
}
