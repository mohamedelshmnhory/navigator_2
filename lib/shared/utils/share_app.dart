import 'dart:io';

import 'package:share/share.dart';

class ShareApp {
  static share() {
    String url = Platform.isIOS
        ? ' '
        : ' ';
    Share.share(url);
  }
}
