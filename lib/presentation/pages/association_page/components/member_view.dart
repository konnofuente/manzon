import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

class MembresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Replace with dynamic data
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: AppColors.grayNormal,
            child: Icon(Icons.person, color: AppColors.grayNormal),
          ),
          title: Text('Elisabeth Singou',
              style: getBoldStyle(
                  color: AppColors.blackNormal, fontSize: FontSize.s16)),
          subtitle: Text('+237 699 442 188',
              style: getRegularStyle(
                  color: AppColors.grayNormal, fontSize: FontSize.s14)),
        );
      },
    );
  }
}
