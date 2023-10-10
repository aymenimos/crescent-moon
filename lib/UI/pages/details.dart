import 'thankyou.dart';
import '../../controller/pay.dart';
import '../../data/models.dart';

import 'package:flutter/material.dart';
import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final int donationtype;
  final String title;

  const Details({super.key, required this.donationtype, required this.title});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  TextEditingController amount = TextEditingController();
  // ignore: non_constant_identifier_names

  Future<void> pay() async {
    try {
      // Generate a random transaction reference with a custom prefix
      String txRef = TxRefRandomGenerator.generate(prefix: 'asd');

      // Access the generated transaction reference
      String storedTxRef = TxRefRandomGenerator.gettxRef;

      // Print the generated transaction reference and the stored transaction reference
      if (kDebugMode) {
        print('Generated TxRef: $txRef');
        print('Stored TxRef: $storedTxRef');
      }
      await Chapa.getInstance.startPayment(
        context: context,
        onInAppPaymentSuccess: (successMsg) {
          Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ThankYouPage()));
          StoryProvider.writeDataToFirestore(widget.title, 1000);
        },
        onInAppPaymentError: (errorMsg) {
          // Handle error
        },
        amount: '1000',
        currency: 'ETB',
        txRef: storedTxRef,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Donate to ${widget.title}",
            style: const TextStyle(fontFamily: "Nexa"),
          ),
          backgroundColor: Colors.grey,
        ),
        body: Consumer<AssetProvider>(builder: (context, value, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(value.donationimages[widget.donationtype]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Text(
                        widget.title,
                        style:
                            const TextStyle(fontSize: 20, fontFamily: "Nexa"),
                      ),
                    ),
                    const Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        "Usu simul offendit philosophia cu, fuisset elaboraret vel ne. In aperiam consequat pro,te commune assueverit delicatissimi mei, ius voluptatum contentiones at. Wisi vulputate pro te. Ut vis ullum iriure efficiendi, id eleifend principes pri. Mea ex graeco vivendo, vim alterum omittam cu.",
                        style: TextStyle(
                          letterSpacing: 0.7,
                          fontSize: 20,
                          fontFamily: "Nexa",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Donation Frequency",
                          style: TextStyle(
                            fontFamily: 'Nexa',
                            fontSize: 16,
                            shadows: [
                              Shadow(color: Colors.black, offset: Offset(0, -5))
                            ],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,
                            decorationThickness: 4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ChoiceChip(
                      label: const Text('One time'),
                      selected: false,
                      onSelected: (isSelected) {},
                    ),
                    ChoiceChip(
                      label: const Text('Monthly'),
                      selected: true,
                      shadowColor: Colors.black,
                      selectedShadowColor: Colors.amber,
                      backgroundColor: Colors.white,
                      onSelected: (isSelected) {},
                    ),
                    ChoiceChip(
                      label: const Text('Daily'),
                      selected: false,
                      onSelected: (isSelected) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Donation Amount",
                              style: TextStyle(
                                fontFamily: 'Nexa',
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                      color: Colors.black,
                                      offset: Offset(0, -5))
                                ],
                                color: Colors.transparent,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                                decorationThickness: 4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {
                            debugPrint("PRESSED");
                            pay();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          child: const Text("Donate"),
                        ))
                  ],
                ),
              ],
            ),
          );
        }));
  }
}

class Sponsordetail extends StatefulWidget {
  final String donationtype;
  final String title;

  const Sponsordetail(
      {super.key, required this.donationtype, required this.title});

  @override
  State<Sponsordetail> createState() => _SponsordetailState();
}

class _SponsordetailState extends State<Sponsordetail> {
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Donate to ${widget.title}",
            style: const TextStyle(fontFamily: "Nexa"),
          ),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.donationtype),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 20, fontFamily: "Nexa"),
                    ),
                  ),
                  const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Usu simul offendit philosophia cu, fuisset elaboraret vel ne. In aperiam consequat pro,te commune assueverit delicatissimi mei, ius voluptatum contentiones at. Wisi vulputate pro te. Ut vis ullum iriure efficiendi, id eleifend principes pri. Mea ex graeco vivendo, vim alterum omittam cu.",
                      style: TextStyle(
                        letterSpacing: 0.7,
                        fontSize: 20,
                        fontFamily: "Nexa",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Donation Frequency",
                        style: TextStyle(
                          fontFamily: 'Nexa',
                          fontSize: 16,
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                    label: const Text('One time'),
                    selected: false,
                    onSelected: (isSelected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Monthly'),
                    selected: true,
                    shadowColor: Colors.black,
                    selectedShadowColor: Colors.amber,
                    backgroundColor: Colors.white,
                    onSelected: (isSelected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Daily'),
                    selected: false,
                    onSelected: (isSelected) {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Donation Amount",
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                    color: Colors.black, offset: Offset(0, -5))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.red,
                              decorationThickness: 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: amount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen),
                        child: const Text("Donate"),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class storiesdetail extends StatefulWidget {
  final String donationtype;
  final String title;

  const storiesdetail(
      {super.key, required this.donationtype, required this.title});

  @override
  State<storiesdetail> createState() => _storiesdetailState();
}

// ignore: camel_case_types
class _storiesdetailState extends State<storiesdetail> {
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Donate to ${widget.title}",
            style: const TextStyle(fontFamily: "Nexa"),
          ),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.donationtype),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      widget.title,
                      style: const TextStyle(fontSize: 20, fontFamily: "Nexa"),
                    ),
                  ),
                  const Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      "Usu simul offendit philosophia cu, fuisset elaboraret vel ne. In aperiam consequat pro,te commune assueverit delicatissimi mei, ius voluptatum contentiones at. Wisi vulputate pro te. Ut vis ullum iriure efficiendi, id eleifend principes pri. Mea ex graeco vivendo, vim alterum omittam cu.",
                      style: TextStyle(
                        letterSpacing: 0.7,
                        fontSize: 20,
                        fontFamily: "Nexa",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Donation Frequency",
                        style: TextStyle(
                          fontFamily: 'Nexa',
                          fontSize: 16,
                          shadows: [
                            Shadow(color: Colors.black, offset: Offset(0, -5))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChoiceChip(
                    label: const Text('One time'),
                    selected: false,
                    onSelected: (isSelected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Monthly'),
                    selected: true,
                    shadowColor: Colors.black,
                    selectedShadowColor: Colors.amber,
                    backgroundColor: Colors.white,
                    onSelected: (isSelected) {},
                  ),
                  ChoiceChip(
                    label: const Text('Daily'),
                    selected: false,
                    onSelected: (isSelected) {},
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Donation Amount",
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 16,
                              shadows: [
                                Shadow(
                                    color: Colors.black, offset: Offset(0, -5))
                              ],
                              color: Colors.transparent,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.red,
                              decorationThickness: 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: amount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen),
                        child: const Text("Donate"),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
