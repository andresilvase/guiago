import 'package:connectivity_plus/connectivity_plus.dart';

class Utils {
  static void hasInternet() async {
    Connectivity().onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.ethernet)) {
        // return true;
      } else {
        // return false;
      }
    });
  }
}
