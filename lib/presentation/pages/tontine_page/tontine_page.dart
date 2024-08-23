import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/custom_header.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/presentation/pages/tontine_page/components/follow_up_section.dart';
import 'package:manzon/presentation/pages/tontine_page/components/cotisation_section.dart';

class TontinePage extends StatefulWidget {
  @override
  _TontinePageState createState() => _TontinePageState();
}

class _TontinePageState extends State<TontinePage> {
  final TontineController controller = Get.put(TontineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          children: [
            CustomHeader(
              name: controller.tontine.name,
              createdDate:
                  "2022-01-01",
              menuItems: const [
                PopupMenuItem(value: 'detail', child: Text('Detail')),
                PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
              onMenuSelected: (value) {
                if (value == 'detail') {
                  print('Detail selected');
                } else if (value == 'delete') {
                  print('Delete selected');
                }
              },
            ),
            const SizedBox(height: AppSize.s16),
            TabBar(
              controller: controller.tabController,
              dividerColor: AppColors.borderLight,
              unselectedLabelColor: AppColors.secondaryLightActive,
              labelColor: AppColors.primaryNormal,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: AppColors.primaryNormal,
                  width: 3,
                ),
                insets: EdgeInsets.zero,
              ),
              tabs: const [
                Tab(
                  child: Text('Cotisations',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Tab(
                  child: Text('Suivi des bouffes',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  CotisationSection(),
                  FollowUpSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
