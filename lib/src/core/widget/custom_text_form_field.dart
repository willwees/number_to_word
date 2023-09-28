import 'package:flutter/material.dart';
import 'package:number_to_word/src/constant/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String title;
  final bool readOnly;
  final int? maxLines;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    this.controller,
    required this.title,
    required this.readOnly,
    this.maxLines = 1,
    this.onChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.title),
        const SizedBox(height: 8.0),
        TextFormField(
          controller: widget.controller,
          style: AppTextStyle.black_400_14,
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          validator: widget.readOnly ? null : _textFieldNumberValidator,
          onChanged: (String value) {
            setState(() {
              widget.onChanged?.call(value);
            });
          },
          decoration: InputDecoration(
            hintText: widget.title,
            contentPadding: const EdgeInsets.all(10.0),
            border: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            errorStyle: const TextStyle(height: 0.0),
            suffixIcon: _errorMessage.isNotEmpty
                ? _buildSuffixIcon()
                : null,
          ),
        ),
      ],
    );
  }

  String? _textFieldNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      _errorMessage = 'Field cannot be empty!';
      return '';
    }

    if (int.tryParse(value) == null) {
      _errorMessage = 'Invalid value!';
      return '';
    }

    _errorMessage = '';
    return null;
  }

  Widget _buildSuffixIcon() {
    return Tooltip(
      message: _errorMessage,
      preferBelow: false,
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(seconds: 5),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: const Icon(
        Icons.info,
        color: Colors.red,
      ),
    );
  }
}
