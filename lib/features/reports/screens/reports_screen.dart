import 'package:flutter/material.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/features/reports/view_models/reports_screen_vm.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ReportsScreenVM(),
      child: Consumer<ReportsScreenVM>(
        builder: (context, provider, child) {
          return Scaffold(
            body: Column(
              children: [Text('dankjdlandkjandjka')],
            ),
          );
        },
      ),
    );
  }
}