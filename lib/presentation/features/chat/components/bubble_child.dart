import 'package:easy_localization/easy_localization.dart';
import 'package:emekteb/core/extensions/context_extension.dart';
import 'package:emekteb/core/extensions/widget_extension.dart';
import 'package:emekteb/data-domain/security/modules/chat_message_from_controller.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app/constants/colors/app_colors.dart';

class BubbleChild extends StatelessWidget {
  final ChatMessageFromContent? messageFromContent;

  const BubbleChild({
    Key? key,
    required this.messageFromContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: [
          Text(
            messageFromContent?.message ?? "",
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.secondColor,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                DateFormat("HH:mm").format(
                  DateTime.parse(messageFromContent?.dateTime ?? ""),
                ),
                style: const TextStyle(
                  fontSize: 10,
                  //fontWeight: FontWeight.bold,
                  color: AppColors.secondColor,
                ),
              ),
              Visibility(
                visible: (messageFromContent?.owner ?? true),
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: context.lowValue / 3,
                  ),
                  child: Row(
                    children: [
                      context.widget.horizontalSpace(context, 0.01),
                      (messageFromContent?.NEW ?? true)
                          ? const Icon(
                              Icons.done,
                              color: AppColors.secondColor,
                              size: 15,
                            )
                          : const Icon(
                              Icons.done_all,
                              color: Colors.cyanAccent,
                              size: 15,
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
