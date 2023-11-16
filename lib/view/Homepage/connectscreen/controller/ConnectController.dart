import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectController extends GetxController {
  final auth = FirebaseAuth.instance;
  //email url
  urlEmail() async {
    String email = 'charityclothes565@gmail.com';
    String subject = 'subject';
    String message = 'message';
    final urlemail = 'mailto:$email?subject=$subject&body=$message';
    if (await canLaunch(urlemail)) {
      await launch(urlemail,
          forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    }
  }

  //url
  urlsocial(String urltext) async {
    final url = urltext;
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    }
  }

  //urltelephone
  urltelephone(String phone) async {
    String url = 'tel:$phone';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  deleteAccount() async {
    await auth.currentUser?.delete();
  }
}
