import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';

class ChairWidget extends StatefulWidget {
  const ChairWidget(
      {super.key,
      required this.width,
      required this.chairLabel,
      required this.ticketPrice});
  final int ticketPrice;
  final double width;
  final int chairLabel;
  @override
  State<ChairWidget> createState() => _ChairWidgetState();
}

class _ChairWidgetState extends State<ChairWidget> {
  bool booked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!kBookingController.bookedList.contains(widget.chairLabel)) {
          if (booked) {
            kBookingController.unMarkOneChair(widget.chairLabel);
            kBookingController.updateTotalPrice(widget.ticketPrice);
            setState(() {
              booked = false;
            });
          } else {
            kBookingController.markOneChair(widget.chairLabel);
            if (kBookingController.orderedList.length <= 6) {
              kBookingController.updateTotalPrice(widget.ticketPrice);
              setState(() {
                booked = true;
              });
            }
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        width: widget.width,
        height: widget.width,
        child: Icon(
          Icons.chair,
          color: kBookingController.bookedList.contains(widget.chairLabel)
              ? Colors.white
              : booked
                  ? Colors.red
                  : kLightGreenColor,
        ),
      ),
    );
  }
}
