import 'package:flutter/material.dart';

import '../const/strings.dart';
import '../view/Homepage/connectscreen/controller/ConnectController.dart';

void main() => runApp(const DeleteAcount());

class DeleteAcount extends StatelessWidget {
  const DeleteAcount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ConnectController();
    return Container(
        margin: const EdgeInsets.only(top: 20),
        width: 270,
        height: 35,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(12)),
        child: MaterialButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Text('Are you sure to delete'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No")),
                          TextButton(
                              onPressed: () async {
                                await controller.deleteAccount();
                              },
                              child: Text("Yes"))
                        ]);
                  });
            },
            child: Text(Strings.delete)));
  }
}
