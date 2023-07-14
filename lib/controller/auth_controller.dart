import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sea_cinema/const.dart';
import 'package:sea_cinema/model/user_model.dart' as model;
import 'package:sea_cinema/view/screen/authentication/login_screen.dart';
import 'package:sea_cinema/view/screen/pages/loading_screen.dart';
import 'package:sea_cinema/view/screen/pages/main_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User?> _user = Rx<User?>(auth.currentUser);

  @override
  void onReady() async {
    super.onReady();
    _user.bindStream(auth.authStateChanges());
    ever(_user, (callback) async {
      await _setInitialPage();
    });
  }

  Future<void> _setInitialPage() async {
    if (_user.value == null) {
      Get.offAll(const LoginScreen());
    } else {
      kUserController.bindStream();
      kTicketController.bindStream();
      Get.offAll(const LoadingScreen());
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(const MainScreen());
    }
  }

  Future<void> loginUser(String name, String password) async {
    try {
      if (name.isNotEmpty && password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
            email: name + "@mail.com", password: password);
      } else {
        Get.snackbar("Login user", "Please fill all the fields");
      }
    } on FirebaseAuthException catch (e) {
      String res = "something went wrong";
      if (e.code == "user-not-found") res = "User not found";
      if (e.code == "invalid-email") res = "Email address is invalid";
      if (e.code == "invalid-password") res = "Wrong password";
      Get.snackbar("Login user", res);
    }
  }

  Future<void> signUpUser(
      String username, String name, String password, String age) async {
    try {
      if (username.isNotEmpty &&
          name.isNotEmpty &&
          password.isNotEmpty &&
          age.isNotEmpty) {
        String email = "$username@mail.com";
        //Creating the user Credential and the user object
        UserCredential newUser = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        model.User userModel = model.User(
          profilePicture: profileURL,
          uid: newUser.user!.uid,
          age: age,
          balance: 0,
          name: name,
          notification: [],
          password: password,
          username: username,
        );
        //
        //Uploading the user object as a Map<String,dynamic> to firestore
        await firestore
            .collection('users')
            .doc(newUser.user!.uid)
            .set(userModel.toJson());
        Get.snackbar("Crating user", "succes boss");
      } else {
        Get.snackbar("Creating user", "Please fill all the fields");
      }
    } catch (err) {
      Get.snackbar("Creating user", err.toString());
    }
  }
}
