import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const TranslateDialog());

class TranslateDialog extends StatelessWidget {
  const TranslateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Choose a Language'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.updateLocale(Locale('ar'));
                          Navigator.pop(context);
                        },
                        child: Text('Arabic')),
                    TextButton(
                        onPressed: () {
                          Get.updateLocale(Locale('en'));
                          Navigator.pop(context);
                        },
                        child: Text('English'))
                  ],
                );
              });
        },
        icon: const Icon(Icons.settings));
  }
}
