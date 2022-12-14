import 'package:easy_localization/easy_localization.dart';
import 'package:emekteb/core/extensions/context_extension.dart';
import 'package:emekteb/core/extensions/widget_extension.dart';
import 'package:emekteb/core/init/navigation/navigation_service.dart';
import 'package:emekteb/generated/locale_keys.g.dart';
import 'package:emekteb/presentation/widgets/image_placeholder.dart';
import 'package:emekteb/utils/app/constants/assets/image_constants.dart';
import 'package:emekteb/utils/app/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/views/base_view.dart';
import '../components/home_grid_view_item.dart';
import '../view-models/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _homeViewModel;

  @override
  void dispose() {
    _homeViewModel.chatInitViewModel.isDisposed = true;
    _homeViewModel.chatInitViewModel.streamSocket.socketResponse.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.init(context);
        _homeViewModel = model;
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) =>
          buildPage(),
    );
  }

  SafeArea buildPage() {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                _homeViewModel.changeTheme();
              },
              icon: _homeViewModel.themeNotifier.isDarkMode
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
            ),
            IconButton(
              onPressed: () async {
                _homeViewModel.authHelper.logout();
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: top(),
            ),
            Expanded(
              flex: 1,
              child: center(),
            ),
            Divider(
              color: context.theme.colorScheme.background,
              height: 0,
              thickness: 3,
            ),
            Expanded(
              flex: 5,
              child: bottom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget top() {
    return Container(
      color: AppColors.mainColor,
      width: context.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImagePlaceholder(
            radius: context.dynamicHeight(0.06),
            imageProvider: AssetImage(ImageConstants.instance.logoPlayStore),
          ),
          widget.verticalSpace(context, 0.03),
          Text(
            _homeViewModel.loginResponse.result?.user?.fullName ?? "",
            style: context.textTheme.titleLarge!.copyWith(
              color: AppColors.secondColor,
            ),
          ),
          widget.verticalSpace(context, 0.005),
          Text(
            _homeViewModel.userInfo.result?.role?.description ?? "",
            style: const TextStyle(
              color: AppColors.secondColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget center() {
    return Padding(
      padding: context.paddingNormal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildUserDetail(
            LocaleKeys.dateOfBirth.tr(),
            _homeViewModel.userInfo.result?.customer?.dob ?? "",
          ),
          buildUserDetail(
            LocaleKeys.documentSerial.tr(),
            _homeViewModel.userInfo.result?.customer?.customerDocument
                    ?.documentSeriya ??
                "",
          ),
          buildUserDetail(
            LocaleKeys.documentFin.tr(),
            _homeViewModel
                    .userInfo.result?.customer?.customerDocument?.documentFin ??
                "",
          ),
        ],
      ),
    );
  }

  Widget buildUserDetail(String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
        ),
        widget.verticalSpace(context, 0.005),
        Text(
          description,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget bottom() {
    return Center(
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 1.75,
        padding: context.paddingNormal,
        crossAxisCount: 2,
        crossAxisSpacing: context.dynamicWidth(0.05),
        mainAxisSpacing: context.dynamicWidth(0.1),
        children: List.generate(_homeViewModel.homeGridItems.length, (index) {
          return InkWell(
            onTap: () {
              NavigationService.instance.navigateToPage(
                path: _homeViewModel.homeGridItems[index].homeMenuItem.route,
                data: _homeViewModel.getArgumentDataFromRoute(
                  _homeViewModel.homeGridItems[index],
                ),
              );
            },
            child: HomeGridViewItem(
              homeGrid: _homeViewModel.homeGridItems[index],
            ),
          );
        }),
      ),
    );
  }
}
