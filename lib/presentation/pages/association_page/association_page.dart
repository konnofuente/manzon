import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/font_manager.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/pages/association_page/components/bank_view.dart';
import 'package:manzon/presentation/pages/association_page/components/member_view.dart';
import 'package:manzon/presentation/pages/association_page/components/tontine_view.dart';
import 'package:manzon/presentation/pages/association_page/widgets/association_header.dart';

class AssociationPage extends StatelessWidget {
  final AssociationController controller = Get.put(AssociationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const AssociationHeader(
              name: 'Manzon',
              imageUrl: '',
              createdDate: '01/10/24',
            ),

            const SizedBox(height: 16),
            // Action Buttons
            ActionButton(),
            const SizedBox(height: 16),
            // Tab Navigation
            TabBar(
              controller: controller.tabController,
              dividerColor: AppColors.borderLight,
              unselectedLabelColor: AppColors.secondaryLightActive,
              labelColor: AppColors.primaryNormal,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: AppColors.primaryNormal,
                  width: 3, // Width of the underline
                ),
                insets: EdgeInsets
                    .zero, // No padding, makes the underline fill the tab width
              ),
              tabs: const [
                Tab(
                  child: Text('Tontines',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Tab(
                  child: Text('Membres',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Tab(
                  child: Text('Caisses',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ],
            ),

            // const SizedBox(height: 8),
            // Tab Views
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  TontinesView(
                    tontines: controller.tontines,
                  ),
                  MembresView(
                    members: controller.members,
                  ),
                  BankView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton.icon(
            autofocus: false,
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt,
                size: 24, color: AppColors.blackNormal),
            label: Text(
              'Ajouter des membres',
              style: getRegularStyle(
                color: AppColors.blackNormal,
                fontSize: FontSize.s16,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.link,
                size: 24, color: AppColors.primaryNormal),
            label: Text(
              'Inviter avec un lien',
              style: getRegularStyle(
                color: AppColors.blackNormal,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
