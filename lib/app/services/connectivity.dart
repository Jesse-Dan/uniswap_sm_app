// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import '../widget/alert.dart';

// class NetworkController {
//   RxBool isConnected = true.obs;
//   RxString status = ''.obs;
//   final conection = Connectivity();
//   Future<bool> checkConnection() async {
//     var result = await conection.checkConnectivity();
//     switch (result) {
//       case ConnectivityResult.mobile:
//         status.value = 'Mobile';

//         Alertify.success(
//             message: 'Internet conection restored using ${status.value}');
//         return true;
//       case ConnectivityResult.wifi:
//         status.value = 'Wifi';
//         Alertify.success(
//             message: 'Internet conection restored using ${status.value}');
//         return true;
//       case ConnectivityResult.none:
//         status.value = 'No Internet';
//         Alertify.error(
//             message:
//                 'Internet conection Lost Please connnect to a stable network and try again ');
//         return false;
//       default:
//         return false;
//     }
//   }

//   listenToConnection() {
//     conection.onConnectivityChanged.listen((ConnectivityResult result) {
//       switch (result) {
//         case ConnectivityResult.mobile:
//           status.value = 'Mobile';
//           isConnected.value = true;
//           Alertify.success(
//               message: 'Internet conection restored using ${status.value}');
//           break;
//         case ConnectivityResult.wifi:
//           status.value = 'Wifi';
//           isConnected.value = true;
//           Alertify.success(
//               message: 'Internet conection restored using ${status.value}');
//           break;
//         case ConnectivityResult.none:
//           status.value = 'No Internet';
//           isConnected.value = false;
//           Alertify.error(
//               message:
//                   'Internet conection Lost Please connnect to a stable network and try again ');
//           break;
//         default:
//       }
//     });
//   }
// }
