import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/domain/entities/contribution_entity.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

class ContributionView extends StatelessWidget {
  final List<ContributionEntity> contributions;

  ContributionView({required this.contributions});

  @override
  Widget build(BuildContext context) {
    return contributions.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.money, size: 100, color: AppColors.grayNormal),
                const SizedBox(height: 16),
                Text(
                  'no_contributions'.tr,
                  style: getRegularStyle(
                      color: AppColors.grayNormal, fontSize: FontSize.s16),
                ),
              ],
            ),
          )
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Date range picker
                  TextButton.icon(
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: AppColors.fontLightSecondary,
                    ),
                    label: Text(
                      'fake_date_range'.tr,
                      style:
                          getMediumStyle(color: AppColors.fontLightSecondary),
                    ),
                    onPressed: () {
                      // Implement date range picker functionality
                    },
                  ),
                  // Sort button
                  TextButton.icon(
                    icon: Icon(
                      Icons.sort,
                      color: AppColors.fontLightSecondary,
                    ),
                    label: Text(
                      'recent'.tr,
                      style:
                          getMediumStyle(color: AppColors.fontLightSecondary),
                    ),
                    onPressed: () {
                      // Implement sorting functionality
                    },
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: contributions.length,
                  itemBuilder: (context, index) {
                    final contribution = contributions[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
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
                            contribution.name,
                            style: getSemiBoldStyle(
                                color: AppColors.blackNormal,
                                fontSize: FontSize.s16),
                          ),
                          subtitle: Text(
                            'Bouffe : ${contribution.balance}Fcfa',
                            style: getRegularStyle(
                                color: AppColors.secondaryNormalActive,
                                fontSize: FontSize.s12),
                          ),
                          trailing: Text(
                            'Total\n${contribution.contributionAmount}Fcfa',
                            textAlign: TextAlign.right,
                            style: getMediumStyle(
                                color: AppColors.primaryNormal,
                                fontSize: FontSize.s16),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              DefaultButton(
                onTap: () {},
                backgroundColor: AppColors.primaryNormal,
                text: 'create_contribution'.tr,
                width: double.infinity,
                fontWeight: FontWeight.w600,
                borderRadius: 50.0,
              ),
            ],
          );
  }
}
