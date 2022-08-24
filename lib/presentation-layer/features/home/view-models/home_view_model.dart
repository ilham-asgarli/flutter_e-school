import 'package:emekteb/core/constants/cache/shared_preferences_constants.dart';
import 'package:emekteb/core/helper/auth_helper.dart';
import 'package:emekteb/core/init/cache/shared_preferences_manager.dart';
import 'package:emekteb/core/init/notifier/theme_notifier.dart';
import 'package:emekteb/core/base/view-models/base_view_model.dart';
import 'package:emekteb/data-domain-layer/security/modules/login_response.dart';
import 'package:emekteb/data-domain-layer/security/modules/user_info.dart';
import 'package:emekteb/utils/constants/app/app_constants.dart';
import 'package:provider/provider.dart';

import '../models/home_grid.dart';
import '../models/home_menu_item.dart';

class HomeViewModel with BaseViewModel {
  late ThemeNotifier themeNotifier;
  late LoginResponse loginResponse;
  late UserInfo userInfo;

  AuthHelper authHelper = AuthHelper();
  List<HomeGrid> homeGridItems = [];

  @override
  void init(context) {
    super.init(context);
    themeNotifier = Provider.of<ThemeNotifier>(context);
    addHomeGridItems();
  }

  void addHomeGridItems() {
    if (userModel != null) {
      loginResponse = LoginResponse().fromJson(userModel!);

      for (Permissions item in loginResponse.result?.user?.permissions ?? []) {
        for (SubItems subItem in item.subItems ?? []) {
          for (HomeMenuItem homeMenuItem in AppConstants.allMenuItems) {
            if (homeMenuItem.route == subItem.link) {
              homeGridItems.add(HomeGrid(
                title: subItem.info!,
                homeMenuItem: homeMenuItem,
              ));
            }
          }
        }
      }
    }

    if(userInfoModel != null) {
      userInfo = UserInfo().fromJson(userInfoModel!);
    }
  }

  changeTheme() async {
    themeNotifier.changeTheme();
    await SharedPreferencesManager.instance.setBoolValue(
      SharedPreferencesConstants.isDarkMode,
      themeNotifier.isDarkMode,
    );
  }
}
