import 'package:flutter/material.dart';
import 'package:serial_managementapp_project/utils/color.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final Color? color;
  final TextStyle? textStyle;
  final bool? enabled;
  final Color? fillColor;
  final bool? filled;
  //final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
     this.hintText,
    required this.isPassword,
     this.controller,
     this.prefixIcon,
    this.suffixIcon, this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
     this.color,
    this.textStyle,
    this.enabled,
    this.fillColor, this.filled,// this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obscureText;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) => value!.isEmpty ? "Required" : null,
      autovalidateMode: autovalidateMode,
      onChanged: (value) {
        if (autovalidateMode != AutovalidateMode.always) {
          setState(() {
            autovalidateMode = AutovalidateMode.always;
          });
        }
      },
      obscureText: obscureText,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:AppColor().primariColor,width: 2),
        ),
        enabled: widget.enabled??true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        filled: widget.filled??false,
        fillColor: widget.color!=null?Colors.white:Colors.red.shade50,
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: Colors.grey.shade400)
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: widget.textStyle!=null?Colors.black :Colors.grey.shade400,
        fontSize: 16
        ),

        suffixIcon: widget.suffixIcon!=null? widget.suffixIcon:
        widget.isPassword
            ? IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey.shade400,
          ),
        ): null
      ),
      cursorColor:  Colors.grey.shade500,
    );
  }
}
