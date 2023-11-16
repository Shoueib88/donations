import 'package:flutter/material.dart';
import 'package:donations/const/style.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    required this.list,
    super.key,
  });
  final List list;
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //elevation: 0,
        unselectedIconTheme: IconThemeData(color: K.blackColor),
        //selectedIconTheme: IconThemeData(color: K.primaryColor),
        currentIndex: currentIndex,
        fixedColor: K.primaryColor,
        onTap: onTap,
        items: [
          for (int i = 0; i < list.length; i++)
            BottomNavigationBarItem(
                label: '',
                icon: Container(
                    width: 50,
                    height: 50,
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(list[i]['icon'], fit: BoxFit.fill)),
                activeIcon: Container(
                    width: 77,
                    height: 70,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: K.primaryColor,
                        borderRadius: BorderRadius.circular(13)),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              margin: const EdgeInsets.only(bottom: 5),
                              child: Image.asset(
                                list[i]['active'],
                                fit: BoxFit.fill,
                                color: K.whiteColor,
                              ),
                            ),
                            Text(list[i]['label'],
                                style: TextStyle(
                                    color: K.whiteColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                          ]),
                    )))
        ]);
  }
}
