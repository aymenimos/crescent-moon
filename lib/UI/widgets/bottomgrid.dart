import 'header.dart';
import '../../controller/pay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/details.dart';

class grid extends StatefulWidget {
  const grid({super.key});

  @override
  State<grid> createState() => _gridState();
}

class _gridState extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AssetProvider>(builder: (context, assets, child) {
      return Column(
        children: [
          const Header(
            title: 'Charity Projects',
            fontSize: 16,
          ),
          SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return GridView.builder(
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          1.5, // Adjust this value to resize the images
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 8, right: 8, bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => Details(
                                    donationtype: index,
                                    title: "Charity project",
                                  ),
                                ));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              assets.donationimages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )),
        ],
      );
    });
  }
}
