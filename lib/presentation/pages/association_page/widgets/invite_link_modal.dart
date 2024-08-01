import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
  import 'package:flutter/material.dart';

void showInviteLinkModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'invite_link'.tr,
                style: getBoldStyle(
                    color: AppColors.blackNormal, fontSize: FontSize.s16),
              ),
              const SizedBox(height: 8),
              Text(
                'invite_description'.tr,
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: AppColors.grayNormal, fontSize: FontSize.s14),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                       backgroundColor: AppColors.primaryNormal,
                      child: Icon(Icons.link, color: AppColors.white)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'https://manzon/1000Fcfa/semaine',
                        style: getRegularStyle(
                            color: AppColors.primaryNormal,
                            fontSize: FontSize.s14),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.copy, color: AppColors.primaryNormal),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(
                            text: 'https://manzon/1000Fcfa/semaine'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('copied_to_clipboard'.tr)),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DefaultButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: AppColors.primaryNormal,
                text: 'copy'.tr,
                width: double.infinity,
                fontWeight: FontWeight.w600,
                borderRadius: 50.0,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

