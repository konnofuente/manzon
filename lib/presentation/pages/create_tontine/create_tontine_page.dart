import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/core/utils/screen_util.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/presentation/controllers/create_tontine_controller.dart';

class CreateTontinePage extends StatefulWidget {
  @override
  State<CreateTontinePage> createState() => _CreateTontinePageState();
}

class _CreateTontinePageState extends State<CreateTontinePage> {
  final CreateTontineController controller = Get.put(CreateTontineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creer une tontine'),
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackNormal),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(ScreenSize.horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Quel est le nom de la tontine?',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              TextFieldWidget(
                prefixIcon: Icons.location_city,
                hintText: "Nom de la tontine".tr,
                controller: controller.tontineNameController,
                isPassword: false,
                keyboardType: TextInputType.text,
                readOnly: false,
              ),
              SizedBox(height: AppSize.s16),
              Text('Montant individuel',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              TextFieldWidget(
                prefixIcon: Icons.money,
                hintText: "10000 Fcfa".tr,
                controller: controller.individualAmountController,
                isPassword: false,
                keyboardType: TextInputType.number,
                readOnly: false,
              ),
              SizedBox(height: AppSize.s16),
              Text('Nombre de membre',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              TextFieldWidget(
                prefixIcon: Icons.numbers,
                hintText: "10".tr,
                controller: controller.numberOfMembersController,
                isPassword: false,
                keyboardType: TextInputType.number,
                readOnly: false,
              ),
              SizedBox(height: AppSize.s16),
              Text('Amande en cas d\'echec',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              DropdownButtonFormField<String>(
                value: controller.penalty.value,
                items: [
                  DropdownMenuItem(
                    value: 'Casier de bieres',
                    child: Text('Casier de bieres'),
                  ),
                  DropdownMenuItem(
                    value: 'Montant fixe',
                    child: Text('Montant fixe'),
                  ),
                ],
                onChanged: (value) {
                  controller.penalty.value = value!;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: AppSize.s16),
              Text('Frequence de bouffe',
                  style: getMediumStyle(
                      color: AppColors.blackNormal, fontSize: FontSize.s16)),
              Column(
                children: [
                  Obx(() => Row(
                        children: [
                          Radio<String>(
                            value: 'Toutes les semaines',
                            groupValue: controller.frequency.value,
                            onChanged: (value) {
                              controller.updateFrequency(value!);
                            },
                          ),
                          Text('Toutes les semaines'),
                        ],
                      )),
                  Obx(() => Row(
                        children: [
                          Radio<String>(
                            value: 'Tous les mois',
                            groupValue: controller.frequency.value,
                            onChanged: (value) {
                              controller.updateFrequency(value!);
                            },
                          ),
                          Text('Tous les mois'),
                        ],
                      )),
                ],
              ),
              SizedBox(height: AppSize.s16),
              TextButton.icon(
                onPressed: () {
                  // Navigate to SelectContactsView to add members
                },
                icon: Icon(Icons.person_add_alt),
                label: Text('Ajouter des membres',
                    style: getMediumStyle(
                        color: AppColors.primaryNormal,
                        fontSize: FontSize.s16)),
              ),
              SizedBox(height: AppSize.s16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DefaultButton(
          onTap: () {
            // Handle form submission
            controller.submit();
          },
          backgroundColor: AppColors.primaryNormal,
          text: 'Continuer',
          width: double.infinity,
          fontWeight: FontWeight.w600,
          borderRadius: 50.0,
        ),
      ),
    );
  }
}
