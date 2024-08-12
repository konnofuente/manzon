import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';

class ModifyAssociationPage extends StatelessWidget {
  final ModifyAssociationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Center(
            child: Text(
          'Modifier l\'association',
          style: getSemiBoldStyle(
              color: AppColors.blackNormal, fontSize: AppSize.s18),
        )),
        leading: IconButton(
          color: AppColors.blackNormal,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle image selection
                  },
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grayLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: AppColors.fontLightSecondary,
                      size: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  // Handle member addition
                },
                icon: const Icon(Icons.person_add,
                    color: AppColors.primaryNormal),
                label: Text('Ajouter des membres',
                    style: getRegularStyle(
                        color: AppColors.primaryNormal,
                        fontSize: FontSize.s16)),
              ),
              Text('Le nom de l’association',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              const SizedBox(
                height: AppPadding.p8,
              ),
              TextFieldWidget(
                hintText: "Le nom de l'association",
                controller: controller.associationNameController,
                isPassword: false,
              ),
              Text('Quel est le siege de votre association?',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              const SizedBox(
                height: AppPadding.p8,
              ),
              TextFieldWidget(
                prefixIcon: Icons.location_city,
                hintText: "Nom de la tontine".tr,
                controller: controller.headquarterController,
                isPassword: false,
                keyboardType: TextInputType.text,
                readOnly: false,
              ),
              Text('Quartier',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              const SizedBox(
                height: AppPadding.p8,
              ),
              TextFieldWidget(
                hintText: "Quartier",
                controller: controller.districtController,
                isPassword: false,
              ),
              Text('Nombre de reunions par',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              const SizedBox(
                height: AppPadding.p8,
              ),
              Center(
                child: Row(
                  children: [
                    Container(
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.grayLight),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.decrementMeetingsPerMonth();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.remove,
                                color: AppColors.primaryNormal,
                                size: 24,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Obx(() => Text(
                                  controller.monthlyMeetingFrequency.value
                                      .toString(),
                                  style: getBoldStyle(
                                      color: AppColors.blackNormal,
                                      fontSize: FontSize.s20),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.incrementMeetingsPerMonth();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: AppColors.primaryNormal,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Sélectionner les jours',
                style: getMediumStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              SizedBox(height: 8),
              Obx(() => Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      children: [
                        'monday'.tr,
                        'tuesday'.tr,
                        'wednesday'.tr,
                        'thursday'.tr,
                        'friday'.tr,
                        'saturday'.tr,
                        'sunday'.tr
                      ].map((day) {
                        return ScaleOnTap(
                          onTap: () {},
                          child: FilterChip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 20),
                            labelStyle: getSemiBoldStyle(
                                color: AppColors.blackNormal,
                                fontSize: FontSize.s18),
                            showCheckmark: false,
                            side:
                                BorderSide(color: AppColors.fontLightDisabled),
                            selectedColor: AppColors.primaryNormal,
                            checkmarkColor: AppColors.primaryNormal,
                            label: Text(day),
                            selected: controller.meetingDays.contains(day),
                            onSelected: (selected) {
                              if (selected) {
                                controller.meetingDays.add(day);
                              } else {
                                controller.meetingDays.remove(day);
                              }
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateAssociation();
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
