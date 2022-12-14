import 'package:emekteb/core/extensions/context_extension.dart';
import 'package:emekteb/core/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../utils/app/constants/colors/app_colors.dart';
import 'my_shimmer.dart';

class TablePlaceHolder extends StatelessWidget {
  final int columnCount;
  final int rowCount;
  final double? padding;
  final double? space;

  const TablePlaceHolder({
    required this.columnCount,
    required this.rowCount,
    this.padding,
    this.space,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rowCount,
      itemBuilder: (context, index) {
        return MyShimmer(
          color: AppColors.shimmerColor,
          child: Table(
            children: [
              TableRow(
                children: List.generate(
                  columnCount,
                  (index) => Card(
                    child: Padding(
                      padding: padding != null
                          ? EdgeInsets.all(padding!)
                          : context.paddingNormal,
                      child: const Text(""),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return space != null
            ? const SizedBox(
                height: 10,
              )
            : context.widget.verticalSpace(context, 0.01);
      },
    );
  }
}
