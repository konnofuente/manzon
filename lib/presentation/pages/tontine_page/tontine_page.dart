import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/custom_header.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';

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
                  "2022-01-01", // Replace with actual creation date if available
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
                  _buildCotisationSection(),
                  _buildFollowUpSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCotisationSection() {
    return Column(
      children: [
        _buildCycleNavigation(),
        _buildMemberList(),
      ],
    );
  }

  Widget _buildFollowUpSection() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              _buildFollowUpExpansionTile(
                'Ceux qui n’ont pas encore bouffe',
                controller.getMembersWithoutTontine(),
              ),
              _buildFollowUpExpansionTile(
                'La personne qui bouffe',
                [controller.getCurrentCycle().receiver],
              ),
              _buildFollowUpExpansionTile(
                'Ceux qui ont deja bouffe',
                controller.getMembersWhoReceivedTontine(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCycleNavigation() {
    return GetBuilder<TontineController>(
      // Use GetBuilder to rebuild when the controller is updated
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

  Widget _buildFollowUpExpansionTile(String title, List<MemberEntity> members) {
    return SingleChildScrollView(
      child: ExpansionTile(
        backgroundColor: const Color(0x4CECECEC),
        title: Text(title),
        children: members.map((member) {
          return _buildMemberItem(member.name, member.phoneNumber, false);
        }).toList(),
      ),
    );
  }
}
