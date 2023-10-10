import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Story {
  final String title;
  final String subtitle;
  final int amount;

  Story({
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}

class StoryProvider extends ChangeNotifier {
  List<Story> stories = [];

  static Future<List<Story>> getStories() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('stories');

    QuerySnapshot querySnapshot = await collectionRef.get();

    List<Story> stories = [];

    for (var documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      Story story = Story(
        title: data['title'],
        subtitle: data['subtitle'],
        amount: data['amount'],
      );
      stories.add(story);
    }

    return stories;
  }

  static Future<void> writeDataToFirestore(String title, int amount) async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('stories');

    DocumentSnapshot documentSnapshot = await collectionRef.doc(title).get();

    if (documentSnapshot.exists) {
      int currentAmount =
          (documentSnapshot.data() as Map<String, dynamic>)['amount'] ?? 0;
      int updatedAmount = currentAmount + amount;

      await collectionRef.doc(title).update({
        'amount': updatedAmount,
      });
    }
  }
}

class BecomeSponsor {
  final String reason;
  final String img;
  BecomeSponsor({
    required this.reason,
    required this.img,
  });
}

class SponsorsProvider {
  List<BecomeSponsor> sponser = [];

  static Future<List<BecomeSponsor>> getsponsors() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('Sponsor');

    QuerySnapshot querySnapshot = await collectionRef.get();
    List<BecomeSponsor> sponser = [];
    for (var documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      BecomeSponsor sprs = BecomeSponsor(
        reason: data['reason'],
        img: data['img'],
      );
      sponser.add(sprs);
    }

    return sponser;
  }
}

class Donation {
  final String title;
  final String img;
  Donation({
    required this.title,
    required this.img,
  });
}

class DonationsProvider {
  List<Donation> donation = [];

  static Future<List<Donation>> getdonationdata() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('donations');

    QuerySnapshot querySnapshot = await collectionRef.get();
    List<Donation> donation = [];
    for (var documentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      Donation dts = Donation(
        title: data['title'],
        img: data['img'],
      );
      donation.add(dts);
    }

    return donation;
  }
}
