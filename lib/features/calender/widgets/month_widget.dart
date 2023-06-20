import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/calender/utils/enums.dart';
import 'package:hive_mobile/features/calender/utils/extensions.dart';
import 'package:intl/intl.dart';

class MonthWidget extends StatelessWidget {
  final DateTime month;
  final String locale;
  final Layout? layout;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Widget Function(BuildContext context, String month)? monthBuilder;

  const MonthWidget({
    Key? key,
    required this.month,
    required this.locale,
    required this.layout,
    required this.monthBuilder,
    required this.textStyle,
    required this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final text =
    //     '${DateFormat('MMMM', locale).format(DateTime(month.year, month.month)).capitalize()} ${DateFormat('yyyy', locale).format(DateTime(month.year, month.month))}';
    final text =
        '${DateFormat('MMMM', locale).format(DateTime(month.year, month.month)).capitalize()}';

    if (monthBuilder != null) {
      return monthBuilder!(context, text);
    }

    return <Layout, Widget Function()>{
      Layout.DEFAULT: () => _pattern(context, text),
      Layout.BEAUTY: () => _beauty(context, text)
    }[layout]!();
  }

  Widget _pattern(BuildContext context, String text) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Text(
      text.capitalize(),
      textAlign: textAlign ?? TextAlign.center,
      // style: textStyle ?? Theme.of(context).textTheme.titleLarge!,
      style: styles.inter12w700,
    );
  }

  Widget _beauty(BuildContext context, String text) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Text(
      text.capitalize(),
      textAlign: textAlign ?? TextAlign.center,
      // style: textStyle ?? Theme.of(context).textTheme.titleLarge!,
      style: styles.inter20w700,
    );
  }
}
