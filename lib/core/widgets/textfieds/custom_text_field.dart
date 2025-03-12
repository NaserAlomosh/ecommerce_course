import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    this.borderRadius,
    this.focusColor,
    this.obscureText,
    this.prefixIcon,
    this.keyboardType,
    this.controller,
    this.validator,
    this.maxLength,
  });
  final String label;
  final double? borderRadius;
  final Color? focusColor;
  final bool? obscureText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLength;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hidePassword = false;

  @override
  void initState() {
    super.initState();
    hidePassword = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      obscureText: hidePassword,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText == true
            ? GestureDetector(
                onTap: () {
                  hidePassword = !hidePassword;
                  setState(() {});
                },
                child: Icon(
                  hidePassword ? Icons.visibility_off : Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 50),
          borderSide: BorderSide(
            color: widget.focusColor ?? Colors.black,
          ),
        ),
        labelText: widget.label,
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
