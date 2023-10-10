import '../pages/details.dart';
import '../../controller/pay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Carosoul extends StatelessWidget {
  const Carosoul({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AssetProvider>(builder: (context, value, child) {
      return SizedBox(
          height: 300,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: value.carousel.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(value.carousel[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.red,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push<void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) => Details(
                                        donationtype: index,
                                        title: 'charitys',
                                      )));
                        },
                        child: const Text(
                          'Donate Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ));
    });
  }
}
