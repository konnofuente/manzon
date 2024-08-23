import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';

class CotisationSection extends StatefulWidget {
  @override
  _CotisationSectionState createState() => _CotisationSectionState();
}

class _CotisationSectionState extends State<CotisationSection> {
  final TontineController controller = Get.put(TontineController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCycleNavigation(),
        _buildMemberList(),
      ],
    );
  }

  Widget _buildCycleNavigation() {
    return GetBuilder<TontineController>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_left_outlined,
                        color: AppColors.primaryNormal, size: 30),
                    onPressed: controller.previousCycle,
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 8),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 16),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC27F33),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  controller.getCurrentCycleDate(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]))
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_right_outlined,
                        color: AppColors.primaryNormal, size: 30),
                    onPressed: controller.nextCycle,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'La semaine de',
                style: getMediumStyle(
                  color: AppColors.fontLightDisabled,
                  fontSize: FontSize.s12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                controller.getCurrentReceiver(),
                style: getSemiBoldStyle(color: AppColors.blackNormal),
              ),
              const SizedBox(height: 4),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMemberList() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                // Implement search filter if necessary
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ...controller
                    .getCurrentCycleContributions()
                    .map((contribution) {
                  return _buildMemberItem(
                    contribution.member.name,
                    contribution.member.phoneNumber,
                    contribution.status == 'paid',
                  );
                }).toList(),
                _buildContributedSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberItem(String name, String phone, bool contributed) {
    return ListTile(
      leading: Radio(
        value: contributed,
        groupValue: true, // Replace with the contribution status
        onChanged: (value) {
          // Handle contribution toggle
        },
      ),
      title: Text(
        name,
        style: getMediumStyle(color: AppColors.blackNormal),
      ),
      subtitle: Text(phone),
    );
  }

  Widget _buildContributedSection() {
    return ExpansionTile(
      backgroundColor: const Color(0x4CECECEC),
      title: const Text('Deja cotiser'),
      children: controller
          .getCurrentCycleContributions()
          .where((contribution) => contribution.status == 'paid')
          .map((contribution) {
        return _buildMemberItem(
          contribution.member.name,
          contribution.member.phoneNumber,
          true,
        );
      }).toList(),
    );
  }
}
