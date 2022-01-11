import 'dart:io';



Future<bool> isInternetConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  } catch (_) {
    return false;
  }
}

// void internetAlert(Function fun) {
//   showDialog(
//       context: navState.currentState!.context,
//       builder: (_) => AlertDialog(
//             title: const Text(internetErrorMsg, textAlign: TextAlign.center),
//             content: defaultTextButton(
//                 function: () {
//                   Navigator.pop(navState.currentState!.context);
//                   fun;
//                 },
//                 text: 'اعادة المحاولة',
//                 textColor: mainColor),
//           ));
// }

String internetErrorMessage() => 'No internet connection';
