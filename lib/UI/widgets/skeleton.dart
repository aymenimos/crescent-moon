import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton0 extends StatelessWidget {
  const Skeleton0({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  // Add your button's onPressed logic here
                },
                child: const Text(
                  'Donate Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
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

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 150,
                  width: 175,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                ),

                // TEXT
                Container(
                    width: 175,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "title",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Nexa'),
                    )),

                //BUTTON
                SizedBox(
                  width: 175,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25))),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text(
                      "Donate",
                      style: TextStyle(fontFamily: 'Nexa', color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Skeleton1 extends StatelessWidget {
  const Skeleton1({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: const BorderRadius.all(Radius.elliptical(10, 12)),
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 27.0, top: 27, right: 27),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 70,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              value: 1,
                              strokeWidth: 10,
                            ),
                          ),
                          ClipOval(
                            child: ColoredBox(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Column(
                              children: [
                                Text(
                                  "title",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Nexa"),
                                ),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the \n printing and typesetting industry. \n Lorem Ipsum has been the. ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
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
                    Text(
                      "Raised",
                      style: TextStyle(
                          fontFamily: 'Nexa',
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    Text(
                      "amount",
                      style: TextStyle(
                          fontFamily: 'Nexa',
                          fontSize: 17,
                          color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class Skeleton3 extends StatelessWidget {
  const Skeleton3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipOval(child: ColoredBox(color: Colors.white)),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "reason",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
