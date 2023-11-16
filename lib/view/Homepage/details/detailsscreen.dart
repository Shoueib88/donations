import 'package:donations/componants/custom_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const Detaile());

class Detaile extends StatelessWidget {
  const Detaile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('track'.tr),
          centerTitle: true,
        ),
        body: CustomListView());
  }
}
