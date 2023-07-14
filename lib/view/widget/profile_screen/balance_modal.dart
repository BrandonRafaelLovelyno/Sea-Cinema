import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/view/widget/universal/text_input.dart';

class BalanceModal extends StatefulWidget {
  const BalanceModal({
    super.key,
    required this.password,
    required this.height,
    required this.width,
    required this.topUP,
    required this.userBalance,
  });
  final int userBalance;
  final String password;
  final bool topUP;
  final double height;
  final double width;
  @override
  State<BalanceModal> createState() => _BalanceModalState();
}

class _BalanceModalState extends State<BalanceModal> {
  late TextEditingController _passwordController;
  late TextEditingController _balanceController;
  bool wrongPass = false;
  bool insuffBalance = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _balanceController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _balanceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 20,
        ),
        height: widget.height,
        width: widget.width,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(
                (20),
              ),
            ),
            color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.cancel,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.topUP
                  ? "Balance Top Up Confirmation"
                  : "Balance Withdraw Confirmation",
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: widget.topUP ? kForestGreenColor : Colors.red.shade700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextInput(
              controller: _balanceController,
              obscureText: false,
              hintText: "Enter the nominal",
              leadingIcon: Icons.money_sharp,
              isNumber: true,
            ),
            const SizedBox(
              height: 10,
            ),
            TextInput(
              controller: _passwordController,
              obscureText: true,
              hintText: "Enter your password",
              leadingIcon: Icons.password,
              isNumber: false,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              width: widget.width,
              height: 30,
              child: Text(
                wrongPass
                    ? "Wrong password"
                    : insuffBalance
                        ? "Insufficient balance"
                        : "",
                style: GoogleFonts.bebasNeue(
                  color: Colors.red,
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                if (widget.topUP) {
                  //If the user is top up-ing
                  if (_passwordController.text != widget.password) {
                    setState(() {
                      wrongPass = true;
                    });
                  } else {
                    await kUserController.topUpBalance(
                        int.parse(_balanceController.text), "Top up");
                    Navigator.of(context).pop();
                  }
                } else {
                  //If the user is withdrawing
                  if (_passwordController.text != widget.password) {
                    setState(() {
                      wrongPass = true;
                    });
                  } else {
                    if (int.parse(_balanceController.text) >
                        widget.userBalance) {
                      setState(() {
                        wrongPass = false;
                        insuffBalance = true;
                      });
                    } else {
                      await kUserController.withdrawBalance(
                          int.parse(_balanceController.text), "Withdraw");
                      Navigator.of(context).pop();
                    }
                  }
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: widget.topUP ? kLightGreenColor : Colors.red,
                ),
                child: Text(
                  widget.topUP ? "Top up" : "Withdraw",
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
