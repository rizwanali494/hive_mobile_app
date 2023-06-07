import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_mobile/features/home/screens/news_feed/screens/news_feed_widget.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
      ),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 12.h
        ),
          itemBuilder: (context, index) {
            return const NewsFeedWidget();
          },
          separatorBuilder: (context, index) {
            return 20.verticalSpace;
          },
          itemCount: 12),
    );
  }
}
