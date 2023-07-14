import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sea_cinema/view/widget/search_screen/movie_card.dart';
import 'package:sea_cinema/view/widget/universal/text_input.dart';
import 'package:sea_cinema/view/widget/universal/transparent_box.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TransparentBox(
          height: 70,
          width: size.width / 1.4,
          borderRadius: 80,
          child: TextInput(
            movieSearcher: true,
            controller: _controller,
            obscureText: false,
            hintText: "Type to search...",
            leadingIcon: Icons.search,
            isNumber: false,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              kUserController.userObject.profilePicture,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Obx(
          () {
            if (kMovieController.searchedList.isEmpty) {
              return Center(
                child: Text(
                  "No Movie Found  :(",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return StaggeredGridView.countBuilder(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: kMovieController.searchedList.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return MovieCard(
                    selectedMovie: kMovieController.searchedList[index]);
              },
              staggeredTileBuilder: (index) {
                return const StaggeredTile.count(1, 1.3);
              },
            );
          },
        ),
      ),
    );
  }
}
