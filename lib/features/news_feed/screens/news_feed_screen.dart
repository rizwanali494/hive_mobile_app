import 'dart:convert';
import 'dart:developer';
import 'dart:math' hide log;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_mobile/app/enums/post_type_enum.dart';
import 'package:hive_mobile/app/models/data/announcement_post_models/announcement_post_model.dart';
import 'package:hive_mobile/app/resources/app_strings.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/base_listview_widget.dart';
import 'package:hive_mobile/app/view/widgets/news_feed_widget.dart';
import 'package:hive_mobile/app/view/widgets/app_bar_widget.dart';
import 'package:hive_mobile/app/view/widgets/shimmers/post_shimmer_widget.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_vm.dart';
import 'package:hive_mobile/features/news_feed/view_models/news_feed_widget_vm.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/block/aes.dart';
import 'package:pointycastle/block/modes/cbc.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:provider/provider.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: styles.smokeWhite,
      ),
      child: Column(
        children: [
          AppBarWidget(
            color: styles.black,
            horizontalPadding: 12,
            title: AppStrings.newsFeed,
            titleStyle: styles.inter40w700,
          ),
          Consumer<NewsFeedVM>(
            builder: (BuildContext context, provider, Widget? child) {
              return BaseListViewWidget<AnnouncementPostModel>(
                controller: provider.listViewVM,
                listViewChild: (item) => GestureDetector(
                  onTap: () {
                    final key = "C8620628BE2507E2";
                    final token =
                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjk5ODY5MTY1LCJpYXQiOjE2OTkyNjQzNjUsImp0aSI6ImFkNzJiOTE3NDA1ZDRlMWI4NTFkNWRkZmU1N2VkZGVmIiwidXNlcl9pZCI6MTR9.2SJcS4Xu5GbDJNf56z7ZaG53N-vSXHW3h_QgLElKIM0";
                    final iv = "1234567890123456";
                    log("enrcypted ::::: ${encrypt(token, key)}");
                    // showDialog(
                    //   context: context,
                    //   builder: (context) => Dialog(
                    //     child: ChangeNotifierProvider.value(
                    //       value: provider,
                    //       child: Consumer<NewsFeedVM>(
                    //         builder: (context, value, child) {
                    //           return NewsFeedWidget(
                    //             type: item.type == "POST"
                    //                 ? PostType.image
                    //                 : PostType.poll,
                    //             horizontalPadding: 0,
                    //             controller: NewsFeedWidgetVm(
                    //               model: item,
                    //             ),
                    //           );
                    //         },
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                  child: NewsFeedWidget(
                    type: item.isPost ? PostType.image : PostType.poll,
                    controller: NewsFeedWidgetVm(
                      model: item,
                    ),
                  ),
                ),
                shimmerChild: PostShimmerWidget(type: PostType.image),
              );

              // if (provider.hasError) {
              //   return Expanded(
              //     child: LayoutBuilder(
              //       builder: (context, constraints) => RefreshIndicator(
              //         onRefresh: provider.refreshList,
              //         backgroundColor: styles.white,
              //         child: SingleChildScrollView(
              //           physics: AlwaysScrollableScrollPhysics(),
              //           child: ConstrainedBox(
              //             constraints:
              //                 BoxConstraints(minHeight: constraints.maxHeight),
              //             child: Center(
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(horizontal: 10.w),
              //                 child: Text(
              //                   AppStrings.somethingWentWrong,
              //                   style: styles.inter20w600,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   );
              // }
              // if (provider.isLoading) {
              //   return Expanded(
              //     child: ListView.separated(
              //       padding: EdgeInsets.symmetric(
              //         vertical: 12.h,
              //       ),
              //       itemBuilder: (context, index) {
              //         return PostShimmerWidget(
              //           type: PostType.image,
              //         );
              //       },
              //       separatorBuilder: (context, index) {
              //         return 20.verticalSpace;
              //       },
              //       itemCount: 7,
              //     ),
              //   );
              // }
              // return Expanded(
              //   child: RefreshIndicator(
              //     // onRefresh: provider.refreshNewsFeed,
              //     onRefresh: provider.refreshList,
              //     backgroundColor: styles.white,
              //     child: ListView.separated(
              //       physics: const AlwaysScrollableScrollPhysics(),
              //       padding: EdgeInsets.symmetric(
              //         vertical: 12.h,
              //       ),
              //       controller: provider.scrollController,
              //       itemBuilder: (context, index) {
              //         if (index == provider.items.length) {
              //           if (provider.isGettingMore) {
              //             return Center(child: CircularProgressIndicator());
              //           }
              //           return SizedBox.shrink();
              //         }
              //         return GestureDetector(
              //           onTap: () {
              //             showDialog(
              //               context: context,
              //               builder: (context) => Dialog(
              //                 child: ChangeNotifierProvider.value(
              //                   value: provider,
              //                   child: Consumer<NewsFeedVM>(
              //                     builder: (context, value, child) {
              //                       return NewsFeedWidget(
              //                         type: provider.items[index].type == "POST"
              //                             ? PostType.image
              //                             : PostType.poll,
              //                         horizontalPadding: 0,
              //                         controller: NewsFeedWidgetVm(
              //                           model: provider.items[index],
              //                         ),
              //                       );
              //                     },
              //                   ),
              //                 ),
              //               ),
              //             );
              //           },
              //           child: NewsFeedWidget(
              //             type: provider.items[index].isPost
              //                 ? PostType.image
              //                 : PostType.poll,
              //             controller: NewsFeedWidgetVm(
              //               model: provider.items[index],
              //             ),
              //           ),
              //         );
              //       },
              //       separatorBuilder: (context, index) {
              //         if (index == provider.items.length) {
              //           return SizedBox.shrink();
              //         }
              //         return 20.verticalSpace;
              //       },
              //       itemCount: provider.items.length + 1,
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }

  Map<String, String> encrypt(String plainText, String key, {String? iv}) {
    Uint8List data = pad(Uint8List.fromList(utf8.encode(plainText)), 16);
    final cipher = CBCBlockCipher(AESEngine())
      ..init(
          true,
          ParametersWithIV(
            KeyParameter(
              Uint8List.fromList(
                utf8.encode(key),
              ),
            ),
            getRandomBytes(16),
          ));
    Uint8List cipherText = cipher.process(data);
    String cipherTextBase64 = base64.encode(cipherText);
    String ivBase64 =
        base64.encode(Uint8List.fromList(cipher.process(cipherText)));
    return {
      "cipher_text": cipherTextBase64,
      "iv": ivBase64,
    };
  }

  Uint8List pad(Uint8List data, int blockSize) {
    int padLength = blockSize - (data.length % blockSize);
    Uint8List paddedData = Uint8List(data.length + padLength)..setAll(0, data);
    for (int i = data.length; i < paddedData.length; i++) {
      paddedData[i] = padLength;
    }
    return paddedData;
  }

  Uint8List getRandomBytes(int size) {
    final _sGen = Random.secure();
    final secureRandom = SecureRandom("AES/CTR/PRNG");
    final key = Uint8List(size);
    secureRandom.seed(
      KeyParameter(
        Uint8List.fromList(
          List.generate(
            16,
            (_) => _sGen.nextInt(16),
          ),
        ),
      ),
    );

    secureRandom.nextBytes(key.length);
    return key;
  }
}
