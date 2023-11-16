import 'package:donations/const/appassets.dart';
import 'package:donations/view/Homepage/OurPlan/ourplan.dart';
import 'package:donations/view/Homepage/connectscreen/ConnectScreen.dart';
import 'package:donations/view/Homepage/details/detailsscreen.dart';
import 'package:donations/view/Homepage/homescreen/Homescreen/HomeScreen.dart';

List bottomNavigationBarData = [
  {
    'icon': AppAssets.exclamationicon,
    'label': 'our plane',
    'active': AppAssets.exclamationicon
  },
  {'icon': AppAssets.mapicon, 'label': 'details', 'active': AppAssets.mapicon},
  {'icon': AppAssets.homeicon, 'label': 'Home', 'active': AppAssets.homeicon},
  {
    'icon': AppAssets.connecticon,
    'label': 'connect',
    'active': AppAssets.connecticon
  },
];
List listOfScreen = [OurPlan(), Detaile(), HomeScreen(), ConnectScreen()];
