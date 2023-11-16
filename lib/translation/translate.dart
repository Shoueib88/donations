import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'local/ar.dart';
import 'local/en.dart';

class Translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'ar': ar,
        'en': en,
      };
}
