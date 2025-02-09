import 'package:connectivity_plus/connectivity_plus.dart';

class Utils {
  static bool hasInternet(List<ConnectivityResult>? connectivityResult) {
    if (connectivityResult == null) {
      return false;
    }
    return connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile);
  }
}
