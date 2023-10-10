import '../widgets/carosoul.dart';
import '../widgets/storycard.dart';
import '../../controller/pay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/becomeSPonsor.dart';
import '../widgets/bottomgrid.dart';
import '../widgets/donation.dart';
import '../widgets/drawer.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AssetProvider>(builder: (context, value, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Home",
              style: TextStyle(
                  fontFamily: 'Nexa',
                  color: Color.fromARGB(221, 241, 184, 184),
                  fontSize: 15),
            ),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          ),
          drawer: const Drawer(
            child: drawer(),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                const Carosoul(),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: const donationcard()),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    debugPrint("DETAILS PAGE");
                  },
                  child: const SizedBox(
                    height: 300,
                    child: storycards(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 5,
                  effect: const WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    type: WormType.thinUnderground,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: circlecard(),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const grid(),
                const SizedBox(
                  height: 100,
                ),
              ]),
            ),
          ));
    });
  }
}
