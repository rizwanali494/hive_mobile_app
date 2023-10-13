import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_mobile/app/resources/app_theme.dart';
import 'package:hive_mobile/app/view/widgets/description_screen.dart';
import 'package:hive_mobile/app/view/widgets/error_text_widget.dart';
import 'package:hive_mobile/features/my_services/view_models/service_request_widget_vm.dart';
import 'package:hive_mobile/features/my_services/view_models/service_widget_vm.dart';
import 'package:hive_mobile/features/my_services/widget/my_service_widget.dart';
import 'package:hive_mobile/features/my_services/widget/services_shimmer_widget.dart';

class ServiceRequestWidget extends StatelessWidget {
  final ServiceRequestWidgetVM provider;

  const ServiceRequestWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return Column(
      children: [
        if (provider.isLoading)
          ListView.separated(
            itemCount: 12,
            padding: EdgeInsets.symmetric(
              vertical: 19.h,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: ServicesShimmerWidget(),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 20.h),
                child: Divider(
                  color: styles.black.withOpacity(0.3),
                  height: 1,
                ),
              )..animate(
                  onComplete: (controller) => controller.repeat(),
                ).shimmer(
                  color: styles.greyShade200,
                  duration: const Duration(seconds: 2),
                );
            },
          )
        else if (provider.hasError)
          ErrorTextWidget(
            onRefresh: provider.refreshList,
          )
        else if (provider.items.isNotEmpty)
          RefreshIndicator(
            onRefresh: provider.refreshList,
            backgroundColor: styles.white,
            child: ListView.separated(
              controller: provider.scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == provider.items.length) {
                  if (provider.isGettingMore) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return SizedBox.shrink();
                }

                return GestureDetector(
                  onTap: () {
                    context.push(DescriptionScreen.route, extra: {
                      "description": provider.items[index].description,
                      "title": "Comment"
                    });
                  },
                  child: MyServiceWidget(
                    controller: ServiceWidgetVM(
                      model: provider.items[index],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return 10.verticalSpace;
              },
              itemCount: provider.listCount,
            ),
          ),
      ],
    );
  }
}
