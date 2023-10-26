import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportWebView extends StatefulWidget {
  final String token;

  static const route = "/ReportWebView";

  const ReportWebView({super.key, required this.token});

  @override
  State<ReportWebView> createState() => _ReportWebViewState();
}

class _ReportWebViewState extends State<ReportWebView> {
  bool downloaded = false;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    // final controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (!downloaded) {
    //           launchUrl(Uri.parse(request.url));
    //           downloaded = true;
    //         }
    //         if (request.url.endsWith("pdf")) {
    //           // launchUrl(Uri.parse(request.url));
    //           NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.prevent;
    //       },
    //     ),
    //   )
    //   ..loadRequest(
    //     Uri.parse("https://hive.bcp.net.pk/view-reports-pdf").replace(
    //       queryParameters: {
    //         "token":
    //             // "$token"
    //             "gAAAAABlOLgTYVoODpWzuIPaqitum77Z450jHK1JwzZy9ODMFXsmXdOPZ_PWIX6U4TzgZEku_JD70YScY6FyzU3C3Nyd2oSIdQ=="
    //       },
    //     ),
    //
    //     // Uri.parse("https://www.google.com"),
    //   );

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
                    style: styles.inter16w600.copyWith(
                      color: styles.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse("https://hive.bcp.net.pk/view-reports-pdf")
                      .replace(
                    queryParameters: {
                      "token":
                          // "$token"
                          "gAAAAABlOLgTYVoODpWzuIPaqitum77Z450jHK1JwzZy9ODMFXsmXdOPZ_PWIX6U4TzgZEku_JD70YScY6FyzU3C3Nyd2oSIdQ=="
                    },
                  ),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(useOnDownloadStart: true),
                ),
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onDownloadStartRequest:
                    (controller, downloadStartRequest) async {
                  // final taskId = await FlutterDownloader.enqueue(
                  //   url: downloadStartRequest.url.toString(),
                  //   savedDir: (await getExternalStorageDirectory())!.path,
                  //   showNotification: true,
                  //   // show download progress in status bar (for Android)
                  //   openFileFromNotification:
                  //       true, // click on notification to open downloaded file (for Android)
                  // );

                  // launchUrl(
                  //  downloadStartRequest.url,
                  // );
                },
              ),
            )
            // Expanded(child: WebViewWidget(controller: controller)),
          ],
        ),
      ),
    );
  }

  InAppWebViewController? webViewController;
}
