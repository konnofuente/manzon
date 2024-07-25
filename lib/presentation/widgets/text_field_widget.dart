import 'package:flutter/material.dart';
import 'package:manzon/app/config/theme/app_colors.dart';
import 'package:manzon/app/config/theme/style_manager.dart';
import 'package:manzon/app/core/utils/constants/export_constant_manager.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final TextStyle? labelStyle;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool isPassword;
  final bool readOnly;
  final TextInputType keyboardType;
  final double height;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double borderRadius;
  final VoidCallback? onTap;
  final TextStyle? errorStyle;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.labelText,
    this.labelStyle,
    required this.prefixIcon,
    required this.controller,
    this.readOnly = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.height = 100.0,
    this.validator,
    this.suffixIcon,
    this.borderRadius = 8.0,
    this.onTap,
    this.errorStyle,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;
  String? _errorText;

  void _validate(String? value) {
    if (widget.validator != null) {
      final validationResult = widget.validator!(value);
      if (_errorText != validationResult) {
        setState(() {
          _errorText = validationResult;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              widget.labelText!,
              style: widget.labelStyle ??
                  getMediumStyle(
                      fontSize: AppSize.s16, color: AppColors.blackNormal),
            ),
          ),
        Container(
          height: widget.height,
          child: TextFormField(
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.keyboardType,
            onChanged: _validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: getRegularStyle(
                  fontSize: AppSize.s16, color: AppColors.fontLightDisabled),
              prefixIcon:
                  Icon(widget.prefixIcon, color: AppColors.fontLightDisabled),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: AppColors.fontLightDisabled),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: AppColors.primaryNormal),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: AppColors.fontLightSecondary),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: Colors.red),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.fontLightDisabled),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : widget.suffixIcon,
              errorText: null, // We handle error text display manually
            ),
            style: getMediumStyle(
                fontSize: AppSize.s16, color: AppColors.blackNormal),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              _errorText!,
              style: widget.errorStyle ??
                  TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
