import 'package:emekteb/core/constants/colors/my_colors.dart';
import 'package:emekteb/core/extensions/context_extension.dart';
import 'package:emekteb/core/extensions/widget_extension.dart';
import 'package:emekteb/presentation-layer/widgets/my_shimmer.dart';
import 'package:flutter/material.dart';

class TimetableBodyPlaceHolder extends StatelessWidget {
  const TimetableBodyPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          children: [
            buildDayTitlePlaceHolder(context),
            context.widget.verticalSpace(context, 0.03),
            buildLecturesPlaceholder(context),
          ],
        ),
      ),
    );
  }

  Widget buildDayTitlePlaceHolder(BuildContext context) {
    return MyShimmer(
      color: MyColors.shimmerColor,
      child: SizedBox(
        width: context.dynamicWidth(0.5),
        height: context.dynamicHeight(0.075),
        child: const Card(),
      ),
    );
  }

  ListView buildLecturesPlaceholder(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        return MyShimmer(
          color: MyColors.shimmerColor,
          child: SizedBox(
            width: double.infinity,
            height: context.dynamicHeight(0.1),
            child: const Card(),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return context.widget.verticalSpace(context, 0.01);
      },
    );
  }
}
