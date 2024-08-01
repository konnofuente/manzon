import 'package:flutter/material.dart';
import 'package:manzon/domain/entities/tontine_entity.dart';
import 'package:manzon/presentation/widgets/export_widget.dart';
import 'package:manzon/app/config/theme/export_theme_manager.dart';

class TontinesView extends StatelessWidget {
  final List<TontineEntity> tontines;

  TontinesView({required this.tontines});

  @override
  Widget build(BuildContext context) {
    return tontines.isEmpty
        ? Center(
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
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: tontines.length,
                  itemBuilder: (context, index) {
                    final tontine = tontines[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: ShapeDecoration(
                          color: AppColors.bg,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: AppColors.primaryLight,
                            child: Icon(Icons.money,
                                color: AppColors.primaryNormal),
                          ),
                          title: Text(
                            '${tontine.contributionAmount}Fcfa/${tontine.contributionFrequency}',
                            style: getSemiBoldStyle(
                                color: AppColors.blackNormal,
                                fontSize: FontSize.s16),
                          ),
                          subtitle: Text(
                            'Bouffe : ${tontine.balance}Fcfa',
                            style: getRegularStyle(
                                color: AppColors.secondaryNormalActive,
                                fontSize: FontSize.s14),
                          ),
                        ),
                      ),
                    );
                  },
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
          );
  }
}
