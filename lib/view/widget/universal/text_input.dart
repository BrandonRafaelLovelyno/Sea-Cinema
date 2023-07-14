import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';

class TextInput extends StatefulWidget {
  final bool? movieSearcher;
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconData? leadingIcon;
  final bool isNumber;
  const TextInput({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    required this.leadingIcon,
    required this.isNumber,
    this.movieSearcher,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _isFocus = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          _isFocus = hasFocus;
        });
      },
      child: TextFormField(
        onFieldSubmitted: (value) async {
          print(widget.controller.text);
          if (widget.movieSearcher != null) {
            await kMovieController.searchMovies(value);
          }
        },
        keyboardType:
            widget.isNumber ? TextInputType.number : TextInputType.name,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kLightGreenColor,
            ),
          ),
          labelText: "    ${widget.hintText}",
          labelStyle: TextStyle(
            color: _isFocus == true
                ? kLightGreenColor
                : Colors.grey.withOpacity(0.8),
            fontSize: 15,
          ),
          prefixIcon: Icon(
            widget.leadingIcon,
            color: _isFocus == true
                ? kLightGreenColor
                : Colors.grey.withOpacity(0.8),
            size: widget.leadingIcon == null ? 0 : 20,
          ),
        ),
        style: TextStyle(
          color: _isFocus == true
              ? kLightGreenColor
              : Colors.grey.withOpacity(0.8),
        ),
      ),
    );
  }
}
