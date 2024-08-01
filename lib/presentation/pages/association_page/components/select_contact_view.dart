import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart';

class SelectContactsView extends StatelessWidget {
  final AssociationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contacts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  // Implement search logic if needed
                },
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.contacts.isEmpty) {
                  return Center(
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
                    itemCount: controller.contacts.length,
                    itemBuilder: (context, index) {
                      final contact = controller.contacts[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.grayNormal,
                          child: Icon(Icons.person, color: AppColors.grayNormal),
                        ),
                        title: Text(contact.displayName ?? '',
                            style: getBoldStyle(
                                color: AppColors.blackNormal, fontSize: FontSize.s16)),
                        subtitle: Text(contact.phones?.isNotEmpty ?? false ? contact.phones!.first.value! : '',
                            style: getRegularStyle(
                                color: AppColors.grayNormal, fontSize: FontSize.s14)),
                        trailing: Obx(() {
                          final isSelected = controller.selectedContacts.contains(contact);
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
                Get.back();
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
