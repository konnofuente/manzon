import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';

class RadioTab extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const RadioTab({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  _RadioTabState createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.02,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    HapticFeedback.lightImpact();
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _controller.value,
            child: child,
          );
        },
        child: Center(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppPadding.p28),
            decoration: BoxDecoration(
              color: widget.isSelected ? AppColors.primaryNormal : Colors.white,
              borderRadius: BorderRadius.circular(AppSize.s16),
              border: Border.all(color: widget.isSelected ? AppColors.primaryNormal : AppColors.fontLightDisabled),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(widget.icon, color: widget.isSelected ? Colors.white : AppColors.fontLightSecondary),
                    SizedBox(width: 8),
                    Text(
                      widget.text,
                      style: getMediumStyle(
                        fontSize: AppSize.s16,
                        color: widget.isSelected ? Colors.white : AppColors.fontLightSecondary,
                      ),
                    ),
                  ],
                ),
                if (widget.isSelected)
                  Icon(Icons.check_circle, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
