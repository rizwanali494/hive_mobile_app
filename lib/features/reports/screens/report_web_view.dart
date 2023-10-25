import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReportWebView extends StatelessWidget {
  final String token;

  static const route = "/ReportWebView";

  const ReportWebView({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final controller = WebViewController()
      ..loadRequest(
        // Uri.parse("https://hive.bcp.net.pk/view-reports-pdf").replace(
        //   queryParameters: {
        //     "token":
        //         // "$token"
        //         "gAAAAABlOLgTYVoODpWzuIPaqitum77Z450jHK1JwzZy9ODMFXsmXdOPZ_PWIX6U4TzgZEku_JD70YScY6FyzU3C3Nyd2oSIdQ=="
        //   },
        // ),
        Uri.parse("https://www.google.com"),
      );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: styles.black),
              child: Row(
                children: [
                  CloseButton(
                    onPressed: () {
                      context.pop();
                    },
                    color: styles.white,
                  ),
                  Text(
                    "ReportView",
                    style: styles.inter14w600.copyWith(
                      color: styles.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: WebViewWidget(controller: controller)),
          ],
        ),
      ),
    );
  }
}
