import 'header.dart';
import 'skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/pay.dart';
import '../../data/models.dart';
import '../pages/details.dart';

class circlecard extends StatelessWidget {
  const circlecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AssetProvider>(builder: (context, assets, child) {
      return FutureBuilder(
          future: SponsorsProvider.getsponsors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Skeleton3();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<BecomeSponsor> Sponsors = snapshot.data ?? [];

              return Column(
                children: [
                  const Header(
                    title: 'Become Sponsor',
                    fontSize: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: Sponsors.length,
                        itemBuilder: (context, index) {
                          BecomeSponsor Sponsor = Sponsors[index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          Sponsordetail(
                                        donationtype: assets.sponsor[index],
                                        title: Sponsor.reason,
                                      ),
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Image.asset(
                                        assets.sponsor[index],
                                        fit: BoxFit.cover,
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(Sponsor.reason)
                                  ],
                                ),
                              ));
                        }),
                  ),
                ],
              );
            }
          });
    });
  }
}
