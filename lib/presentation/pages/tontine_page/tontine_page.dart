import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/custom_header.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';

class TontinePage extends StatefulWidget {
  @override
  _TontinePageState createState() => _TontinePageState();
}

class _TontinePageState extends State<TontinePage> {
  int currentCycleIndex = 0; // Index to manage cycle navigation

  final TontineController controller = Get.put(TontineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSize.s16),
        child: Column(
          children: [
            CustomHeader(
              name: "John Doe",
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
            const SizedBox(height: AppSize.s16),
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
                const Tab(
                  child: Text('Cotisations',
                      style: TextStyle(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w400,
                      )),
                ),
                const Tab(
                  child: Text('Reciever follow up',
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
                  Center(
                    child: Column(
                      children: [
                        _buildCycleNavigation(),
                        _buildMemberList(),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        _buildCycleNavigation(),
                        _buildMemberList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cycle navigation bar with date and arrows
  Widget _buildCycleNavigation() {
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
                onPressed: () {
                  // Navigate to the previous cycle
                  setState(() {
                    if (currentCycleIndex > 0) currentCycleIndex--;
                  });
                },
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: ShapeDecoration(
                      color: Color(0xFFC27F33),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '14/06/2024',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            height: 0.10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.arrow_circle_right_outlined,
                    color: AppColors.primaryNormal, size: 30),
                onPressed: () {
                  // Navigate to the next cycle
                  setState(() {
                    currentCycleIndex++;
                  });
                },
              ),
            ],
          ),
          Text(
            'La semaine de',
            style: getMediumStyle(
                color: AppColors.fontLightDisabled, fontSize: FontSize.s12),
          ),
          SizedBox(height: 4),
          Text(
            'Claira Nguemete',
            style: getSemiBoldStyle(color: AppColors.blackNormal),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }

  // Member list with search functionality
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
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildMemberItem('Elisabeth Singou', '+237 699 442 188', false),
                _buildMemberItem('Elisabeth Singou', '+237 699 442 188', false),
                _buildContributedSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Single member item
  Widget _buildMemberItem(String name, String phone, bool contributed) {
    return ListTile(
      leading: Radio(
        value: contributed,
        groupValue: false, // Replace with the contribution status
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

  // Contributed section at the bottom
  Widget _buildContributedSection() {
    return ExpansionTile(
      backgroundColor: Color(0x4CECECEC),
      title: const Text('Deja cotiser'),
      children: [
        _buildMemberItem('Elisabeth Singou', '+237 699 442 188', true),
        _buildMemberItem('Elisabeth Singou', '+237 699 442 188', true),
        _buildMemberItem('Elisabeth Singou', '+237 699 442 188', true),
        _buildMemberItem('Elisabeth Singou', '+237 699 442 188', true),
      ],
    );
  }
}
