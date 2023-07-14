import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';
import 'package:sea_cinema/model/ticket_model.dart';
import 'package:sea_cinema/view/screen/pages/main_screen.dart';

class BookingController extends GetxController {
  static BookingController instance = Get.find();
  Rx<List<int>> _bookedList = Rx<List<int>>([]);
  Rx<List<int>> _orderedList = Rx<List<int>>([]);
  Rx<int> _totalPrice = Rx<int>(0);
  Rx<String> _watchHour = Rx<String>("11:00");

  String get watchHour => _watchHour.value;
  int get totalPrice => (_totalPrice.value / 1000).toInt();
  List<int> get orderedList => _orderedList.value;
  List<int> get bookedList => _bookedList.value;

  void updateTheWatchHour(String hour) {
    _watchHour.value = hour;
    Get.snackbar("Watchour", "You have chosen ${_watchHour.value}");
  }

  void updateTotalPrice(int ticketPrice) {
    _totalPrice.value = ticketPrice * _orderedList.value.length.toInt();
  }

  void markOneChair(int label) {
    if (_orderedList.value.length < 6) {
      _orderedList.value.add(label);
      print(_orderedList.value);
    } else {
      Get.snackbar("Booking the ticket", "A user can only book up to 6 chairs");
    }
  }

  void unMarkOneChair(int label) {
    _orderedList.value.remove(label);
  }

  void clearAllObservable() {
    _orderedList.value.clear();
    _bookedList.value.clear();
    _totalPrice.value = 0;
  }

  Future<void> bookTheTickets(Movie movie) async {
    try {
      if (int.parse(kUserController.userObject.age) < movie.ageRating) {
        Get.snackbar(
            "Buying the tickets", "Please choose the right film for your age");
        return;
      }
      if (_orderedList.value.isNotEmpty) {
        if (_totalPrice.value > kUserController.userObject.balance) {
          Get.snackbar("Buying the tickets", "Insufficient balance");
          return;
        }

        await firestore
            .collection('movies')
            .doc(movie.title)
            .collection('time')
            .doc(_watchHour.value)
            .update({'booked': _orderedList.value});

        List<String> retVal = [];
        for (int label in _orderedList.value) {
          String alphabet = "";
          int chairNumber = label % 8 == 0 ? 8 : label % 8;
          double temp = label / 8;
          if (temp > 0 && temp <= 1) {
            alphabet = 'A';
          } else if (temp > 1 && temp <= 2) {
            alphabet = 'B';
          } else if (temp > 2 && temp <= 3) {
            alphabet = 'C';
          } else if (temp > 3 && temp <= 4) {
            alphabet = 'D';
          } else if (temp > 4 && temp <= 5) {
            alphabet = 'E';
          } else if (temp > 5 && temp <= 6) {
            alphabet = 'F';
          } else if (temp > 6 && temp <= 7) {
            alphabet = 'G';
          } else if (temp > 7 && temp <= 8) {
            alphabet = 'H';
          }
          retVal.add("$chairNumber - $alphabet");
        }
        await kUserController.withdrawBalance(
            movie.ticketPrice * _orderedList.value.length, "Transfer");
        await kTicketController.uploadTicketBuying(_orderedList.value, retVal,
            movie, kUserController.userObject, _watchHour.value);
        clearAllObservable();
        Get.offAll(const MainScreen());
      } else {
        Get.snackbar("Booking the tickets", "Please choose your seat");
      }
    } catch (err) {
      Get.snackbar("Booking the tickets", err.toString());
    }
  }

  Future<void> updateTheBookedList(String title) async {
    DocumentSnapshot movieDoc = await firestore
        .collection('movies')
        .doc(title)
        .collection('time')
        .doc(_watchHour.value)
        .get();
    print(_watchHour.value);
    Map<String, dynamic> movieData = movieDoc.data() as Map<String, dynamic>;
    List storeBookedList = movieData['booked'] as List;
    List<int> retVal = [];
    if (storeBookedList.isNotEmpty) {
      for (var label in storeBookedList) {
        retVal.add(label.toInt());
      }
    }
    _bookedList.value = retVal;
  }

  Future<void> cancelTicket(Ticket ticket) async {
    try {
      //Deleting the tickets document in user collection
      await firestore
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('tickets')
          .doc(ticket.uid)
          .delete();
      await kUserController.topUpBalance(ticket.price, "Refund");
      //
      //Deleting the ticket chair-label in movies collection
      await firestore
          .collection('movies')
          .doc(ticket.title)
          .collection('time')
          .doc(_watchHour.value)
          .update({
        'booked': FieldValue.arrayRemove([ticket.number])
      });
      //
      Get.snackbar("Canceling the ticket", "Canceling success");
    } catch (err) {
      Get.snackbar("Canceling the ticket", err.toString());
    }
  }
}
