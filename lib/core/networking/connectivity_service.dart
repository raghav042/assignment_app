import 'package:connectivity_plus/connectivity_plus.dart';

import '../constant/network_status.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Future<NetworkStatus> checkConnectivity() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return _mapConnectivityResultToStatus(connectivityResult.first);
  }

  NetworkStatus _mapConnectivityResultToStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
      case ConnectivityResult.ethernet:
        return NetworkStatus.online;
      case ConnectivityResult.none:
      default:
        return NetworkStatus.offline;
    }
  }
}
