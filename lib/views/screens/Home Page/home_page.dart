// import 'package:clock_app/views/components/button.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const Drawer(
//         child: Column(
//           children: [
//             UserAccountsDrawerHeader(
//               currentAccountPicture: CircleAvatar(
//                 foregroundImage: NetworkImage(
//                     "https://cdn.vectorstock.com/i/preview-1x/13/04/male-profile-picture-vector-2041304.jpg"),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.black,
//               ),
//               accountName: Text("Clock App"),
//               accountEmail: Text("clockapp@demo.io"),
//             ),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       backgroundColor: Colors.black54,
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Center(
//               child: buttonRow(
//                 btnName: "Clock page",
//                 button: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pushNamed('clock_page');
//                   },
//                   child: const Text("Clock Page"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//

import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            height: double.infinity,
            child: Image(
              image: AssetImage("lib/assets/images/clock.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: CardSwiper(
              cardsCount: Routes.clock.length,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) =>
                      GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.clock[index]['route'],
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        Routes.clock[index]['image'],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
