import 'dart:async';

import 'package:check_network_connection/utils/customer_banner.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectionsService extends GetxController {
  RxBool isConnected = true.obs;
  late Connectivity connectivity;
  ConnectionsService(this.connectivity);
  StreamSubscription? subscriptionl;

  void listenToNetworkChanges(BuildContext context) {
    subscriptionl = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        isConnected.value = true;
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

        print("Now, Connection is on!");
      } else if (event == ConnectivityResult.wifi) {
        isConnected.value = true;
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();

        print("Now, Connection is on!");
      } else {
        isConnected.value = false;
        CustomerBanner.showBanner(context, "No Internet connection",
            Colors.black, Duration(days: 365));
        print("Now, Connection is off!");
      }
    });
  }

  @override
  void onClose() {
    subscriptionl!.cancel();
    super.onClose();
  }
}
