import 'header.dart';
import 'skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/pay.dart';
import '../../data/models.dart';

class DonationProgressBar extends StatelessWidget {
  final double amountRaised;
  final double targetAmount;

  const DonationProgressBar(
      {super.key, required this.amountRaised, required this.targetAmount});

  @override
  Widget build(BuildContext context) {
    double progress = amountRaised / targetAmount;
    int percentage = (progress * 100).toInt();

    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Text(
            'Progress: $percentage%',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(10),
            minHeight: 10,
            value: progress,
            backgroundColor: Colors.grey,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          const SizedBox(height: 10),
          Text(
            'Amount Raised: ${amountRaised.toStringAsFixed(0)} BIRR',
            style: const TextStyle(fontSize: 16, fontFamily: "Nexa"),
          ),
          Text(
            'Target Amount: ${targetAmount.toStringAsFixed(0)} BIRR',
            style: const TextStyle(fontSize: 16, fontFamily: "Nexa"),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class storycards extends StatelessWidget {
  const storycards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AssetProvider>(builder: (context, value, child) {
      return FutureBuilder<List<Story>>(
        future: StoryProvider.getStories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Skeleton1();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Story> stories = snapshot.data ?? [];

            return Column(
              children: [
                const Header(
                  title: 'Humanitarian Cases',
                  fontSize: 16,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: stories.length,
                    itemBuilder: (context, index) {
                      Story story = stories[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.all(
                                    Radius.elliptical(10, 12)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 27.0, top: 27, right: 27),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 70,
                                              width: 70,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.red),
                                                value: 1,
                                                strokeWidth: 10,
                                              ),
                                            ),
                                            ClipOval(
                                              child: Image.asset(
                                                "assets/images/21_14.jpg",
                                                fit: BoxFit.cover,
                                                width: 70,
                                                height: 70,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    story.title,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Nexa"),
                                                  ),
                                                  const Text(
                                                    "Lorem Ipsum is simply dummy text of the \n printing and typesetting industry. \n Lorem Ipsum has been the. ",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Nexa",
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      DonationProgressBar(
                                        amountRaised: story.amount.toDouble(),
                                        targetAmount: 1000,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape:
                                                const ContinuousRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(25),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    25))),
                                            backgroundColor:
                                                Colors.redAccent.shade700),
                                        onPressed: () {
                                          // Navigator.push<void>(
                                          //     context,
                                          //     MaterialPageRoute<void>(
                                          //         builder: (BuildContext context) => Details(
                                          //               donationtype: 3,
                                          //               title: title,
                                          //             )));
                                        },
                                        child: const Text(
                                          "Donate",
                                          style: TextStyle(fontFamily: 'Nexa'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
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
