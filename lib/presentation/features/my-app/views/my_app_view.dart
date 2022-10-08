import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/views/base_view.dart';
import '../../../../core/init/navigation/navigation_route.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../../../../core/init/theme/common_theme.dart';
import '../../../../core/init/theme/dark_theme.dart';
import '../view-models/my_app_view_model.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  late MyAppViewModel _myAppViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<MyAppViewModel>(
      viewModel: MyAppViewModel(),
      onModelReady: (model) {
        model.init(context);
        _myAppViewModel = model;
      },
      onPageBuilder: (BuildContext context, MyAppViewModel viewModel) =>
          ScreenUtilInit(
        designSize: const Size(400, 700),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeMode: context.watch<ThemeNotifier>().themeMode,
            theme: context.watch<ThemeNotifier>().themeData,
            darkTheme: CommonTheme.instance
                .getTheme(CustomDarkTheme.instance.getDarkTheme()),
            onGenerateRoute: NavigationRoute.instance.generateRoute,
            navigatorKey: NavigationService.instance.navigatorKey,
            initialRoute: _myAppViewModel.getInitialRoute(),
          );
        },
      ),
    );
  }
}