import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manzon/app/core/helpers/keyboard.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/widgets/text_field_widget.dart';
import 'package:manzon/presentation/widgets/buttons/default_button.dart';
import 'package:manzon/presentation/controllers/create_association_controller.dart';

class BasicInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateAssociationController controller = Get.find();
    final double verticalPadding = AppSize.s24;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                controller.imagePath?.value = pickedFile.path;
              }
            },
            child: Obx(() {
              return Container(
                height: ScreenSize.blockSizeVertical * 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(AppSize.s8),
                ),
                child: controller.imagePath.value.isEmpty
                    ? Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppPadding.p16),
                              decoration: ShapeDecoration(
                                color: const Color(0x7FECECEC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Icon(Icons.camera_alt,
                                  color: AppColors.grayNormal,
                                  size: AppSize.s32),
                            ),
                            const SizedBox(width: AppSize.s10),
                            Text(
                              'add_an_image_of_your_cloth'.tr,
                              style: getRegularStyle(
                                  color: AppColors.grayNormal,
                                  fontSize: FontSize.s16),
                            ),
                          ],
                        ),
                      )
                    : Image.file(
                        File(controller.imagePath!.value),
                        fit: BoxFit.cover,
                      ),
              );
            }),
          ),
          SizedBox(height: verticalPadding),
          Text(
            'what_is_the_name_of_your_meeting'.tr,
            style: getMediumStyle(color: AppColors.blackNormal, fontSize: 16),
          ),
          const SizedBox(height: AppSize.s8),
          TextFieldWidget(
            hintText: "name_of_the_meeting".tr,
            controller: controller.associationNameController,
            // height: 70,
            isPassword: false,
            keyboardType: TextInputType.text,
            readOnly: false,
            prefixIcon: Icons.people,
          ),
          const Spacer(),
          DefaultButton(
            onTap: () {
              controller.nextStep();
              hideKeyboard(context);
            },
            backgroundColor: AppColors.primaryNormal,
            text: 'continue'.tr,
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
