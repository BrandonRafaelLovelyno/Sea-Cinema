import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  final String title;
  final String posterUrl;
  final String name;
  final String chairLabel;
  final String profilePicture;
  final DateTime date;
  final String uid;
  final int price;
  final int number;
  final String hour;

  const Ticket({
    required this.hour,
    required this.number,
    required this.chairLabel,
    required this.name,
    required this.posterUrl,
    required this.profilePicture,
    required this.title,
    required this.date,
    required this.uid,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'chairLabel': chairLabel,
      'posterUrl': posterUrl,
      'name': name,
      'title': title,
      'profilePicture': profilePicture,
      'date': date,
      'uid': uid,
      'price': price,
      'number': number,
      'hour': hour,
    };
  }

  static Ticket fromSnap(DocumentSnapshot doc) {
    Map<String, dynamic> ticketData = doc.data() as Map<String, dynamic>;
    return Ticket(
      hour: ticketData['hour'],
      number: ticketData['number'],
      price: ticketData['price'],
      chairLabel: ticketData['chairLabel'],
      name: ticketData['name'],
      posterUrl: ticketData['posterUrl'],
      profilePicture: ticketData['profilePicture'],
      title: ticketData['title'],
      date: (ticketData['date'] as Timestamp).toDate(),
      uid: ticketData['uid'],
    );
  }
}
