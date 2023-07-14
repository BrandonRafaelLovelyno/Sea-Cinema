import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';
import 'package:sea_cinema/model/ticket_model.dart';
import 'package:sea_cinema/model/user_model.dart';
import 'package:uuid/uuid.dart';

class TicketController extends GetxController {
  static TicketController instance = Get.find();
  Rx<List<Ticket>> _userTickets = Rx<List<Ticket>>([]);

  List<Ticket> get usersTickets => _userTickets.value;

  void bindStream() {
    _userTickets.bindStream(firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('tickets')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Ticket> retVal = [];
      for (DocumentSnapshot doc in querySnapshot.docs) {
        retVal.add(Ticket.fromSnap(doc));
      }
      return retVal;
    }));
  }

  Future<void> uploadTicketBuying(List<int> chairNumbers,
      List<String> chairLabels, Movie movie, User userData) async {
    List<Ticket> retVal = [];
    for (int i = 0; i < chairLabels.length; i++) {
      retVal.add(
        Ticket(
          number: chairNumbers[i],
          price: movie.ticketPrice,
          chairLabel: chairLabels[i],
          name: userData.name,
          posterUrl: movie.posterUrl,
          profilePicture: userData.profilePicture,
          title: movie.title,
          date: movie.releaseDate,
          uid: const Uuid().v1(),
        ),
      );
    }
    for (Ticket ticket in retVal) {
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tickets')
          .doc(ticket.uid)
          .set(ticket.toJson());
    }
    Get.snackbar("Buying the tickets", "You have bought the ticket(s)");
  }
}
