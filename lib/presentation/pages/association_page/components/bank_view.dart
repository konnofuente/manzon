import 'package:flutter/material.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

class BankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.money, size: 100, color: AppColors.grayNormal),
                const SizedBox(height: 16),
                Text(
                  'Aucune tontine',
                  style: getRegularStyle(
                      color: AppColors.grayNormal, fontSize: FontSize.s16),
                ),
              ],
            ),
          ),
          DefaultButton(
            onTap: () {},
            backgroundColor: AppColors.primaryNormal,
            text: 'Creer une tontine',
            width: double.infinity,
            fontWeight: FontWeight.w600,
            borderRadius: 50.0,
          ),
        ],
      ),
    );
  }
}
