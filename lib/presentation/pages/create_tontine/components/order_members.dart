import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';
import 'package:manzon/presentation/pages/create_tontine/widgets/step_information.dart';

class OrderMembers extends StatefulWidget {
  @override
  State<OrderMembers> createState() => _OrderMembersState();
}

class _OrderMembersState extends State<OrderMembers> {
  final CreateTontineController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const StepInformation(
            title: 'Creating Tontine',
            description: 'Enter the rank of food for each member',
          ),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Rechercher',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onChanged: (value) {
              // Implement search logic if needed
              controller.searchQuery.value = value;
            },
          ),
          Expanded(
            child: Obx(() {
              if (controller.selectedMembers.isEmpty) {
                return const Center(
                  child: Text(
                    'Aucun membre sélectionné.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.selectedMembers.length,
                  itemBuilder: (context, index) {
                    final member = controller.selectedMembers[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.grayNormal,
                        child: Icon(Icons.person, color: AppColors.grayNormal),
                      ),
                      title: Text(
                        member.name,
                        style: getBoldStyle(
                          color: AppColors.blackNormal,
                          fontSize: FontSize.s16,
                        ),
                      ),
                      subtitle: Text(
                        member.phoneNumber,
                        style: getRegularStyle(
                          color: AppColors.grayNormal,
                          fontSize: FontSize.s14,
                        ),
                      ),
                      trailing: SizedBox(
                        width: 50,
                        child: TextField(
                          controller: controller.getOrderController(index),
                          decoration: InputDecoration(
                            hintText: '00',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            int order = int.tryParse(value) ?? 0;
                            controller.updateOrder(index, order);
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
          DefaultButton(
            onTap: controller.validateOrder() ? controller.nextStep : null,
            backgroundColor: AppColors.primaryNormal,
            text: 'Continuer',
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
