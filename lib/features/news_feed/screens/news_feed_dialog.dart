import 'package:flutter/material.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/view/widgets/news_feed_widget.dart';
import 'package:hive_mobile/features/news_feed/view_models/NeedFeedDialogVM.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_widget_vm.dart';
import 'package:provider/provider.dart';

class NewsFeedIdDialog extends StatefulWidget {
  final NewsFeedDialogVM controller;

  const NewsFeedIdDialog({super.key, required this.controller});

  @override
  State<NewsFeedIdDialog> createState() => _NewsFeedIdDialogState();
}

class _NewsFeedIdDialogState extends State<NewsFeedIdDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ChangeNotifierProvider.value(
        value: widget.controller,
        child: Consumer<NewsFeedDialogVM>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                ],
              );
            }
            if (value.hasError || value.model == null) {
              return Center(
                child: Text(
                  AppStrings.somethingWentWrong,
                ),
              );
            }
            return NewsFeedWidget(
              type: value.model == "POST" ? PostType.image : PostType.poll,
              horizontalPadding: 0,
              controller: NewsFeedWidgetVm(
                model: value.model!,
              ),
            );
          },
        ),
      ),
    );
  }
}
