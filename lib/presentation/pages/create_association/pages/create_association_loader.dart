import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class CreateAssociationLoading extends StatefulWidget {
  @override
  State<CreateAssociationLoading> createState() =>
      _CreateAssociationLoadingState();
}

class _CreateAssociationLoadingState extends State<CreateAssociationLoading> {
  final CreateAssociationController controller = Get.find();

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Container(
            alignment: Alignment.center,
            child: Text('creating_association'.tr,
                style: getSemiBoldStyle(
                    fontSize: FontSize.s18, color: AppColors.blackNormal))),
        leading: IconButton(
          icon: const Icon(
            color: AppColors.blackNormal,
            Icons.arrow_back,
            size: AppSize.s24,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'creating_association'.tr,
              style: getBlackStyle(
                  fontSize: FontSize.s24, color: AppColors.blackNormal),
            ),
            SizedBox(
              height: AppSize.s40,
            ),
            Obx(() {
              return CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 20.0,
                animation: true,
                percent: controller.creationProgress.value / 100,
                center: new Text(
                  '${controller.creationProgress.value}%',
                  style: getBlackStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s36),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.primaryNormal,
              );
            }),
            SizedBox(height: 20),
            Text(
              'Bientot vous pourrez gerer votre association',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
