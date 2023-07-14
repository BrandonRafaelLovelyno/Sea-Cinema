import 'package:flutter/material.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/view/screen/authentication/sign_up_screen.dart';
import 'package:sea_cinema/view/widget/universal/logo.dart';
import 'package:sea_cinema/view/widget/universal/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  //Puter Video di background
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
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
                    fontColor: Colors.white,
                    iconColor: kLightGreenColor,
                    size: 40,
                  ),
                ),
                Text(
                  "Welcome Back",
                  style: reusableTextStyle.copyWith(
                    color: kLightGreenColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextInput(
                  isNumber: false,
                  controller: _usernameController,
                  obscureText: false,
                  hintText: "Username",
                  leadingIcon: Icons.person,
                ),
                const SizedBox(
                  height: 30,
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
                InkWell(
                  onTap: () async {
                    await kAuthController.loginUser(
                        _usernameController.text, _passwordController.text);
                  },
                  child: Container(
                    height: 45,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kLightGreenColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(15),
                        right: Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      "Login",
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
                      "Do not have an account?",
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
                          builder: (ctx) => const SignUpScreen(),
                        ),
                      ),
                      child: Text(
                        "Create an account",
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
