// ignore_for_file: unnecessary_this

import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:expenses_tracking_app/consts/padding_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller; 
  final Function(String?) validator; 
  final String hintText;
  final Function(String)? onChanged;
  final String? labelText;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters; 
  final TextInputType? keyboardType;
  final bool obscureText; 

  const CustomTextFormField({ Key? key,
    required this.controller, 
    required this.validator, 
    required this.hintText,
    this.onChanged,
    this.labelText,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters, 
    this.keyboardType, 
    this.obscureText = false,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingConsts.textFieldSpacing),
      child: TextFormField(
        controller: this.controller,
        textInputAction: this.textInputAction,
        obscureText: this.obscureText,
        focusNode: this.focusNode,
        keyboardType: this.keyboardType,
        validator: (value) => this.validator(value),
        inputFormatters: this.inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          hintText: this.hintText,
          labelText: this.labelText, 
          labelStyle: const TextStyle(color: ColorConsts.grey),
          border: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorConsts.grey),
          ), 
        ),
        onChanged: (value) {
          if (this.onChanged != null) {
            this.onChanged!(value);
          }
        }, 
      ),
    );   
  }
} 