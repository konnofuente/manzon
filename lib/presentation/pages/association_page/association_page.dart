import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/custom_header.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/presentation/pages/association_page/components/member_view.dart';
import 'package:manzon/presentation/pages/association_page/widgets/invite_link_modal.dart';
import 'package:manzon/presentation/pages/association_page/pages/select_contact_page.dart';
import 'package:manzon/presentation/pages/association_page/components/contribution_view.dart';
import 'package:manzon/presentation/pages/association_page/components/association_tontines_view.dart';

class AssociationPage extends StatefulWidget {
  @override
  State<AssociationPage> createState() => _AssociationPageState();
}

class _AssociationPageState extends State<AssociationPage> {
  final AssociationController controller = Get.put(AssociationController());

  @override
  void dispose() {
    final StateController stateController = Get.find();
    stateController.clearAssociationId();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomHeader(
              name: "John Doe",
              imageUrl: "path_to_image.jpg",
              createdDate: "2022-01-01",
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
              tabs: [
                Tab(
                  child: Text('tontines'.tr,
                      style: const TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Tab(
                  child: Text('members'.tr,
                      style: const TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                Tab(
                  child: Text('contribution'.tr,
                      style: const TextStyle(
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
                  AssociationTontinesView(),
                  MembresView(),
                  ContributionView(),
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
            onPressed: () {
              Get.to(() => SelectContactsPage());
            },
            icon: const Icon(Icons.person_add_alt,
                size: 24, color: AppColors.blackNormal),
            label: Text(
              'add_members'.tr,
              style: getRegularStyle(
                color: AppColors.blackNormal,
                fontSize: FontSize.s16,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {
              showInviteLinkModal(context);
            },
            icon: const Icon(Icons.link,
                size: 24, color: AppColors.primaryNormal),
            label: Text(
              'invite_with_link'.tr,
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
