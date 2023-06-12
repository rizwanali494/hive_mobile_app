import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/app/view/dialogs/backup_email_dialog.dart';
import 'package:hive_mobile/app/view/widgets/news_feed_widget.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDialog(
        context: context,
        builder: (context) => const BackUpEmailDialog(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: NewsFeedWidget(
                        type: index.isEven ? PostType.image : PostType.poll),
                  ),
                );
              },
              child: NewsFeedWidget(
                type: index.isEven ? PostType.image : PostType.poll,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return 20.verticalSpace;
          },
          itemCount: 12),
    );
  }
}
