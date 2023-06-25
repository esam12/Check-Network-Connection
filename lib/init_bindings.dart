import 'package:check_network_connection/controller/connection_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    // Networking
    Get.put<Connectivity>(Connectivity(), permanent: true);

    // Controllers

    Get.put<ConnectionsService>(
      ConnectionsService(Get.find<Connectivity>()),
      permanent: true,
    );
  }
}
