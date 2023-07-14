# Sea_cinema

## Description
Sea_cinema is an android application that is specialized to provide information about some available movies and their ticket booking. The project is written in Dart. This app use Firebase as its bakcend-as-a-service (Baas) to simplify the backend task. This app is built with the MVC format to ease the organization of the backend stream. One of the important things to note is this app use controllers that inherit the GetXController.

## Features
* Authentication with Email & Password
* Updating the profile picture
* Top up and withdraw the user balance with password validation
* Movie browser with carousel
* Movie detailed information screen
* Ticket booking with a stream data
* Prohibition on booking for the user age requirement
* Ticket cancelation in the Ticket screen

## Instalation

1. Prerequisites
   * Make sure Android Studio is installed on the machines
   * Ensure that Flutter and Dart SDK are installed and configured properly.
     
2. Clone the repository
   
3. Set up Flutter and Dart
   * Install the flutter and dart SDK on the machine
   * This app has a minimum SDK of 19

4. Open the Project in Visual Studio Code
   * Do not forget to run "flutter pub get" in the command line

5. Launch the app on android device or emulator
   * For physical Android Device
     * If the app is wanted to be installed on the android device, ensure the device is connected via USB
     * Enable the USB debugging in the developer mode
     * run "flutter run" in the command line
       
  * For android simulator
     * Open the navigation bar by Ctrl + Shift + p
     * Select the "Select Device" option
     * Select your android emulator
     * run "flutter run" in the command line
     
