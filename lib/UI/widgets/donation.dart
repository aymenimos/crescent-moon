import 'header.dart';
import 'skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/pay.dart';
import '../../data/models.dart';
import '../pages/details.dart';

class donationcard extends StatelessWidget {
  const donationcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AssetProvider>(builder: (context, value, child) {
      return FutureBuilder<List<Donation>>(
        future: DonationsProvider.getdonationdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            Future.delayed(const Duration(seconds: 100));
            return const Skeleton();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Donation> donationslist = snapshot.data ?? [];

            return Column(
              children: [
                const Header(
                  title: 'Donation Types',
                  fontSize: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: donationslist.length,
                    itemBuilder: (context, index) {
                      Donation dno = donationslist[index];
                      return GestureDetector(
                          onTap: () {
                            // debugPrint(index as String?);
                            Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => Details(
                                    donationtype: index,
                                    title: dno.title,
                                  ),
                                ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 130,
                                  width: 155,
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    image: DecorationImage(
                                        image: AssetImage(dno.img),
                                        fit: BoxFit.cover,
                                        alignment: Alignment.center),
                                  ),
                                ),

                                // TEXT
                                Container(
                                    width: 155,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      dno.title,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'Nexa'),
                                    )),

                                //BUTTON
                                SizedBox(
                                  width: 155,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: const ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(25),
                                                bottomLeft:
                                                    Radius.circular(25))),
                                        backgroundColor:
                                            Colors.redAccent.shade700),
                                    onPressed: () {
                                      Navigator.push<void>(
                                          context,
                                          MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  Details(
                                                    donationtype: 3,
                                                    title: dno.title,
                                                  )));
                                    },
                                    child: const Text(
                                      "Donate",
                                      style: TextStyle(fontFamily: 'Nexa'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                  ),
                ),
              ],
            );
          }
        },
      );
    });
  }
}
