import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';

class SelectTontineMembers extends StatefulWidget {
  const SelectTontineMembers({super.key});

  @override
  State<SelectTontineMembers> createState() => _SelectTontineMembersState();
}

class _SelectTontineMembersState extends State<SelectTontineMembers> {
  final CreateTontineController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Contacts',
          style: getSemiBoldStyle(
              color: AppColors.blackNormal, fontSize: FontSize.s18),
        ),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) {
                controller.searchQuery.value =
                    value; // Bind search input to controller
              },
            ),
            Expanded(
              child: Obx(() {
                if (controller.contacts.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Loading contacts...',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(height: 20), // space between text and loader
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller
                        .filteredContacts.length, // Use filtered contacts
                    itemBuilder: (context, index) {
                      final contact = controller.filteredContacts[index];
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: AppColors.grayNormal,
                          child:
                              Icon(Icons.person, color: AppColors.grayNormal),
                        ),
                        title: Text(contact.displayName ?? '',
                            style: getBoldStyle(
                                color: AppColors.blackNormal,
                                fontSize: FontSize.s16)),
                        subtitle: Text(
                            contact.phones?.isNotEmpty ?? false
                                ? contact.phones!.first.value!
                                : '',
                            style: getRegularStyle(
                                color: AppColors.grayNormal,
                                fontSize: FontSize.s14)),
                        trailing: Obx(() {
                          final isSelected =
                              controller.selectedContacts.contains(contact);
                          return Checkbox(
                            value: isSelected,
                            onChanged: (bool? value) {
                              if (value == true) {
                                controller.selectedContacts.add(contact);
                              } else {
                                controller.selectedContacts.remove(contact);
                              }
                            },
                          );
                        }),
                      );
                    },
                  );
                }
              }),
            ),
            DefaultButton(
              onTap: () {
               
                controller.addSelectedContactsToMembers();
                // Get.back();
              },
              backgroundColor: AppColors.primaryNormal,
              text: 'Enregistrer',
              width: double.infinity,
              fontWeight: FontWeight.w600,
              borderRadius: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
