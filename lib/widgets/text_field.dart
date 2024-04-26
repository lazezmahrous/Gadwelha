// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,
    this.textController,
    this.hintText,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.validator,
    this.maxLines,
    this.onPressedIconButton,
  });

  TextEditingController? textController;
  String? hintText;
  int? maxLength;
  int? maxLines;
  Function(String)? onChanged;
  String? Function(String?)? onTap;
  String? Function(String?)? validator;
  VoidCallback? onPressedIconButton;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    Future<String?>? validate() async {
      if (widget.validator != null) {
        return widget.validator!(widget.textController?.text);
      }
      return null;
    }

    return TextFormField(
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      validator: widget.validator,
      enableSuggestions: true,
      onTap: () {
        widget.onTap;
      },
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                widget.textController!.clear();
              },
              icon: const Icon(Icons.delete_outline_rounded))),
      controller: widget.textController,
      onChanged: widget.onChanged,
    );
  }
}
