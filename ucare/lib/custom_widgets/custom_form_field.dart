import '../text_styling/custom_text_getter.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField(
      {super.key,
      required this.label,
      required this.hintText,
      required this.validator,
      this.icon,
      this.password});

  final String hintText;
  final String label;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool? password;


  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool showPassword = false;
  void _togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: widget.label,
                context: context,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: widget.hintText,
              suffixIcon: (widget.password != null && widget.password == true)
                  ? IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed:_togglePassword, // Toggle the state of passwordVisible variable
                    )
                  : widget.icon != null
                      ? Icon(widget.icon)
                      : null,
            ),
            obscureText: (widget.password != null && widget.password == true)
                ? !showPassword
                : false,
            validator: widget.validator,
          ),
        ],
      ),
    );
  }
}
