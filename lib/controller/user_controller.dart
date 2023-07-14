import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sea_cinema/const.dart';
import 'dart:io';
import 'package:sea_cinema/model/user_model.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rx<User?> _userObject = Rx<User?>(null);
  File? _pickedProfilePicture;

  void bindStream() {
    _userObject.bindStream(firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .snapshots()
        .map((DocumentSnapshot doc) {
      return User.fromSnapshot(doc);
    }));
  }

  User get userObject => _userObject.value!;

  Future<void> pickingProfilePicture() async {
    ImagePicker imagePicker = ImagePicker();
    var selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      _pickedProfilePicture = File(selectedImage.path);
    } else {
      Get.snackbar("Changing profile picture", "Please pick an image");
    }
  }

  Future<void> changingProfilePicture() async {
    try {
      if (_pickedProfilePicture != null) {
        String downloadUrl = await uploadPickedPicture();
        await firestore.collection('users').doc(auth.currentUser!.uid).update(
          {'profilePicture': downloadUrl},
        );
      }
    } catch (err) {
      Get.snackbar("Changing the profile picture", "Something went wrong");
    }
  }

  uploadPickedPicture() async {
    try {
      Reference ref =
          storage.ref().child('profilePicture').child(auth.currentUser!.uid);
      UploadTask uploadTask = ref.putFile(_pickedProfilePicture!);
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();
      return downloadUrl;
    } catch (err) {
      Get.snackbar("Uploading to storage", err.toString());
    }
  }

  //

  //Balance Problem

  Future<void> topUpBalance(int num, String shown) async {
    try {
      int res = _userObject.value!.balance + num;
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'balance': res,
      });
      ;
      Get.snackbar("$shown process", "$shown success");
    } catch (err) {
      Get.snackbar("$shown process", "Something went wrong");
    }
  }

  Future<void> withdrawBalance(int num, String shown) async {
    try {
      int res = _userObject.value!.balance - num;
      await firestore.collection('users').doc(auth.currentUser!.uid).update({
        'balance': res,
      });
      Get.snackbar("$shown process", "$shown success");
    } catch (err) {
      Get.snackbar("$shown process", "Something went wrong");
    }
  }

  //

  //Log out

  Future<void> logOut() async {
    await auth.signOut();
  }

  //

  //Log in

  Future<void> logIn(String username, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: "$username@mail.com",
        password: password,
      );
    } catch (err) {
      Get.snackbar("Logining user", err.toString());
    }
  }

  //
}
