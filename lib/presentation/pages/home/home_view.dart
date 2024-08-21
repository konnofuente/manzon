import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../widgets/cards/association_card.dart';
import '../../../app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import '../../../domain/entities/export_domain_entities.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/home_controller.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/pages/home/components/profile_info.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController(
    getUserByIdUseCase: Get.find(),
    getUserAssociationUseCase: Get.find(),
  ));

  @override
  void initState() {
    super.initState();
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    final double verticalPadding = 16.0;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.horizontalPadding, vertical: AppSize.s28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final user = controller.user.value;
              if (user != null) {
                return ProfileInfo(
                  name: user.name ?? "No Name",
                  phoneNumber: user.phoneNumber,
                  onEdit: () => print('Edit Profile'),
                );
              } else {
                return Skeletonizer(
                  child: ProfileInfo(
                    name: "No Name",
                    phoneNumber: '23442',
                    onEdit: () => print('Edit Profile'),
                  ),
                );
              }
            }),
            SizedBox(height: verticalPadding),
            Text(
              "my_association".tr,
              style: getBoldStyle(
                  color: AppColors.blackDark, fontSize: FontSize.s24),
            ),
            SizedBox(height: verticalPadding),
            Expanded(
              child: Obx(() {
                if (controller.isFetchingAssociations.value) {
                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      AssociationEntity fakeassociation = AssociationEntity(
                        name: '',
                        members: [],
                        headquaterCity: '',
                        headquaterLocation: '',
                        avatar: MediaEntity(
                            link:
                                'https://th.bing.com/th/id/R.e4b6323e19e57f6761b1ce47b7d329e0?rik=D4%2b%2fTxSGPiWP2g&pid=ImgRaw&r=0',
                            type: FileType.image,
                            mediaId: ''),
                      );

                      return Skeletonizer(
                        child: AssociationCard(
                          association: fakeassociation,
                          isActive: false,
                        ),
                      );
                    },
                  );
                } else if (controller.associations.isEmpty) {
                  return Center(
                    child: Text(
                      'no_associations_created'.tr,
                      style: getRegularStyle(
                          color: AppColors.blackNormal, fontSize: FontSize.s18),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.associations.length,
                    itemBuilder: (context, index) {
                      final association = controller.associations[index];
                      return AssociationCard(
                        association: association,
                        isActive: index % 2 == 0 ? false : true,
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: DefaultButton(
        onTap: () => {
          Get.toNamed(AppRouteNames.createAssociation),
          print('Create New Association')
        },
        backgroundColor: AppColors.primaryNormal,
        text: 'new_association'.tr,
        width: ScreenSize.screenWidth * 0.9,
        fontWeight: FontWeight.w600,
        borderRadius: AppRadius.r50,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
