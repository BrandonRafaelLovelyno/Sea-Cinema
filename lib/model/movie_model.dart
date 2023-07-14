import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final int id;
  final String desc;
  final int ageRating;
  final String posterUrl;
  final int ticketPrice;
  final DateTime releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.ageRating,
    required this.releaseDate,
    required this.desc,
    required this.posterUrl,
    required this.ticketPrice,
  });

  static DateTime convertingTheReleaseDate(String releaseDate) {
    List<String> dateComponents = releaseDate.split('-');
    int year = int.parse(dateComponents[0].substring(2)) + 2000;
    int month = int.parse(dateComponents[1]);
    int day = int.parse(dateComponents[2].substring(0, 2));
    DateTime dateTime = DateTime(year, month, day);
    print(dateTime);
    return dateTime;
  }

  static Movie fromSnap(DocumentSnapshot doc) {
    Map<String, dynamic> movieData = doc.data() as Map<String, dynamic>;
    DateTime releaseDate = convertingTheReleaseDate(movieData['release_data']);
    return Movie(
      title: movieData['title'],
      ageRating: movieData['age_rating'],
      desc: movieData['description'],
      posterUrl: movieData['poster_url'],
      ticketPrice: movieData['ticket_price'],
      releaseDate: releaseDate,
      id: movieData['id'],
    );
  }
}
