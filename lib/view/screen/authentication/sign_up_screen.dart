import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/view/screen/authentication/login_screen.dart';
import 'package:sea_cinema/view/widget/universal/logo.dart';
import 'package:sea_cinema/view/widget/universal/text_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  //Puter Video di background
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle reusableTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            );
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.network(
              kBackGroundWall,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 50),
                  height: size.height / 3.5,
                  width: double.infinity,
                  child: const LogoWidget(
                    size: 40,
                    iconColor: Colors.red,
                    fontColor: Colors.white,
                  ),
                ),
                Text(
                  "How do you do",
                  style: reusableTextStyle.copyWith(
                    color: kLightGreenColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  isNumber: false,
                  controller: _nameController,
                  obscureText: false,
                  hintText: "Name",
                  leadingIcon: Icons.person_add_alt_1_sharp,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  isNumber: false,
                  controller: _usernameController,
                  obscureText: false,
                  hintText: "Username",
                  leadingIcon: Icons.person,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  isNumber: true,
                  controller: _ageController,
                  obscureText: false,
                  hintText: "Age",
                  leadingIcon: Icons.confirmation_number,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  isNumber: false,
                  controller: _passwordController,
                  obscureText: true,
                  hintText: "Password",
                  leadingIcon: Icons.password,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: kLightGreenColor,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(15),
                      right: Radius.circular(15),
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      await kAuthController.signUpUser(
                        _usernameController.text,
                        _nameController.text,
                        _passwordController.text,
                        _ageController.text,
                      );
                    },
                    child: Text(
                      "Create account",
                      style: reusableTextStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: reusableTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const LoginScreen(),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: reusableTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kLightGreenColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
