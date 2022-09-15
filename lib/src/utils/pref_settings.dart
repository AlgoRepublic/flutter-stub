import 'package:base_project/src/theme/theme.dart';
import 'package:get/get.dart';

import '../language/locales.dart';

class PrefSetting {

  static changeTheme({AllThemes theme = AllThemes.light}) {
    Get.changeTheme(AppTheme.getTheme(theme: theme));
  }

  static changeLanguage() {
    Get.updateLocale(urLocale);
  }
}
