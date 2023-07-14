import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/movie_model.dart';

//jangam lupa filter

class MovieController extends GetxController {
  static MovieController instance = Get.find();
  Rx<List<Movie>> _movieList = Rx<List<Movie>>([]);
  Rx<List<Movie>> _searchedList = Rx<List<Movie>>([]);
  @override
  void onInit() {
    super.onInit();
    _movieList.bindStream(firestore
        .collection('movies')
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<Movie> retVal = [];
      for (DocumentSnapshot doc in querySnapshot.docs) {
        retVal.add(Movie.fromSnap(doc));
      }
      return retVal;
    }));
  }

  List<Movie> get movieList => _movieList.value;

  List<Movie> get searchedList => _searchedList.value;

  Future<void> searchMovies(String typed) async {
    QuerySnapshot query = await firestore
        .collection('movies')
        .where('title', isGreaterThanOrEqualTo: typed)
        .where('title', isLessThan: typed + 'z')
        .get();
    List<Movie> retVal = [];
    for (DocumentSnapshot doc in query.docs) {
      retVal.add(Movie.fromSnap(doc));
    }
    _searchedList.value = retVal;
  }
}
