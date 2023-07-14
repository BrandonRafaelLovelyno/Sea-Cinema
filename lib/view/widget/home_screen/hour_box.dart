import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';

class HourBox extends StatefulWidget {
  const HourBox({super.key, required this.hour});
  final String hour;

  @override
  State<HourBox> createState() => _HourBoxState();
}

class _HourBoxState extends State<HourBox> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          setState(() {
            kBookingController.updateTheWatchHour(widget.hour + ":00");
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          decoration: BoxDecoration(
            color: kBookingController.watchHour == widget.hour + ':00'
                ? kTransparentGrey
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 3,
              color: kBookingController.watchHour == widget.hour + ':00'
                  ? kLightLimeGreenColor
                  : kTransparentGrey,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.hour,
                textAlign: TextAlign.left,
                style: GoogleFonts.nunitoSans(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight:
                      kBookingController.watchHour == widget.hour + ':00'
                          ? FontWeight.bold
                          : FontWeight.normal,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Text(
                  ":00",
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
