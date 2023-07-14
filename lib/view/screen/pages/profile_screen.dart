import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/view/widget/profile_screen/balance_modal.dart';
import 'package:sea_cinema/view/widget/profile_screen/subject_divider.dart';
import 'package:sea_cinema/view/widget/profile_screen/user_profile_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: Obx(() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const SizedBox(
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: kTransparentGrey,
            ),
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 100, bottom: 20),
            height: size.height / 2 + 200,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SubjectDivider(
                    subject: "Account",
                    icon: Icons.person,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserProfileWidget(
                          subject: "Username",
                          main: kUserController.userObject.username,
                        ),
                        UserProfileWidget(
                          subject: "Name",
                          main: kUserController.userObject.name,
                        ),
                        UserProfileWidget(
                          subject: "Balance",
                          main: "Rp.${kUserController.userObject.balance},00",
                        ),
                        UserProfileWidget(
                          subject: "Age",
                          main: kUserController.userObject.age,
                        ),
                      ],
                    ),
                  ),
                  const SubjectDivider(
                    subject: "Top up & Withdraw",
                    icon: Icons.attach_money_rounded,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          elevation: 4,
                          context: context,
                          builder: (context) => BalanceModal(
                            userBalance: kUserController.userObject.balance,
                            topUP: true,
                            height: size.height / 2,
                            width: double.infinity,
                            password: kUserController.userObject.password,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: kLightGreenColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Top up Balance",
                            style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          elevation: 4,
                          builder: (context) => BalanceModal(
                            userBalance: kUserController.userObject.balance,
                            topUP: false,
                            height: size.height / 2,
                            width: double.infinity,
                            password: kUserController.userObject.password,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Withdraw Balance",
                            style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const SubjectDivider(
                    subject: "Logging",
                    icon: Icons.login,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      await kUserController.logOut();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Log Out",
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height / 2 + 150,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                kUserController.userObject.profilePicture,
              ),
              radius: 60,
            ),
          ),
          Positioned(
            bottom: size.height / 2 + 140,
            left: size.width / 2 + 20,
            child: InkWell(
              onTap: () async {
                await kUserController.pickingProfilePicture();
                await kUserController.changingProfilePicture();
              },
              child: const Icon(
                Icons.camera_alt,
                size: 40,
              ),
            ),
          ),
        ],
      );
    }));
  }
}
