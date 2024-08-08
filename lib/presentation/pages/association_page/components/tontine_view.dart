import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';

class TontinesView extends StatefulWidget {
  @override
  State<TontinesView> createState() => _TontinesViewState();
}

class _TontinesViewState extends State<TontinesView> {
  @override
  Widget build(BuildContext context) {
    final AssociationController controller = Get.find();

    return Obx(() {
      return controller.tontines.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.money,
                      size: 100, color: AppColors.grayNormal),
                  const SizedBox(height: 16),
                  Text(
                    'empty_tontine'.tr,
                    style: getRegularStyle(
                        color: AppColors.grayNormal, fontSize: FontSize.s16),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.tontines.length,
                    itemBuilder: (context, index) {
                      final tontine = controller.tontines[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: ShapeDecoration(
                            color: AppColors.bg,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: AppColors.primaryLight,
                              child: Icon(Icons.money,
                                  color: AppColors.primaryNormal),
                            ),
                            title: Text(
                              '${tontine.contributionAmount}Fcfa/${tontine.contributionFrequency.name}',
                              style: getSemiBoldStyle(
                                  color: AppColors.blackNormal,
                                  fontSize: FontSize.s16),
                            ),
                            subtitle: Text(
                              'Bouffe : ${tontine.contributionAmount}Fcfa',
                              style: getRegularStyle(
                                  color: AppColors.secondaryNormalActive,
                                  fontSize: FontSize.s14),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                DefaultButton(
                  onTap: () {
                    Get.toNamed(AppRouteNames.selectTontineMember);
                  },
                  backgroundColor: AppColors.primaryNormal,
                  text: 'create_tontine'.tr,
                  width: double.infinity,
                  fontWeight: FontWeight.w600,
                  borderRadius: 50.0,
                ),
              ],
            );
    });
  }
}
