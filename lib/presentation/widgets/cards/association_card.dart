import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:manzon/app/config/routes/app_route_names.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';
import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/presentation/controllers/export_controllers.dart'; // Ensure this import is correct for accessing AssociationEntity

class AssociationCard extends StatelessWidget {
  final AssociationEntity association;
  final bool isActive; // Declare isActive here
  final double height;

  const AssociationCard({
    Key? key,
    required this.association,
    this.isActive = false, // Default value for isActive
    this.height = 170.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      final StateController stateController = Get.find();

    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRouteNames.associationPage);
          stateController.setSelectedAssociationId(association.uniqueId!);
        },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: isActive
            ? AppColors.primaryNormal
            : AppColors.white, // Use passed isActive here
        child: Container(
          height: height,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(association.name,
                          style: getBoldStyle(
                              color: isActive
                                  ? AppColors.white
                                  : AppColors.primaryNormal,
                              fontSize: FontSize.s24)),
                      if (association.headquaterCity != null ||
                          association.headquaterLocation != null) ...[
                        SizedBox(height: 8),
                        Text(
                          '${association.headquaterCity ?? ""} situated at ${association.headquaterLocation ?? ""}',
                          style: getRegularStyle(
                              color: isActive
                                  ? AppColors.white
                                  : AppColors.blackNormal,
                              fontSize: FontSize.s14),
                        ),
                      ],
                      if (association.headquaterLocation != null) ...[
                        SizedBox(height: 8),
                        Text('Siège : ${association.headquaterLocation}',
                            style: getSemiBoldStyle(
                                color: isActive
                                    ? AppColors.white
                                    : AppColors.blackNormal,
                                fontSize: FontSize.s12)),
                      ],
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: association.avatar?.link != null
                    ? ClipRRect(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(12)),
                        child: Image.network(
                          association.avatar!.link!,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors
                              .grey, // Default color in case there's no image URL
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(12)),
                        ),
                        child: Center(
                          child: Text(
                            association.name,
                            textAlign: TextAlign.center,
                            style: getBoldStyle(
                                color: AppColors.white, fontSize: FontSize.s24),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
