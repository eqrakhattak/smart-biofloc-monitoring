import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';

isInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network, make sure there is actually a net connection.
    if (await InternetConnectionChecker().hasConnection) {
      // Mobile data detected & internet connection confirmed.
      return true;
      // return Fluttertoast.showToast(
      //     msg: "Connected to Data",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.black26,
      //     timeInSecForIosWeb: 1
      // );
    } else {
      // Mobile data detected but no internet connection found.
      return Fluttertoast.showToast(
          msg: "Mobile Data Detected, No Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black26,
          timeInSecForIosWeb: 1
      );
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a WIFI network, make sure there is actually a net connection.
    if (await InternetConnectionChecker().hasConnection) {
      // Wifi detected & internet connection confirmed.
      return true;
      // return Fluttertoast.showToast(
      //     msg: "Connected to WiFi",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.black26,
      //     timeInSecForIosWeb: 1
      // );
    } else {
      // Wifi detected but no internet connection found.
      return Fluttertoast.showToast(
          msg: "Wifi Detected, No Internet",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black26,
          timeInSecForIosWeb: 1
      );
    }
  } else {
    // Neither mobile data or WIFI detected, not internet connection found.
    return Fluttertoast.showToast(
        msg: "Not Connected to Internet",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black26,
        timeInSecForIosWeb: 1
    );
  }
}