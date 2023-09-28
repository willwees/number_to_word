import 'package:flutter/material.dart';
import 'package:number_to_word/src/constant/app_text_style.dart';
import 'package:number_to_word/src/core/core.dart';

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
  bool _showErrorTooltip = false;

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
            suffixIcon: _errorMessage.isNotEmpty ? _buildSuffixIcon() : null,
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
    return GestureDetector(
      onTap: () {
        setState(() {
          _showErrorTooltip = !_showErrorTooltip;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            if (_showErrorTooltip) _buildTooltip(),
            const Icon(
              Icons.info,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTooltip() {
    return Transform.translate(
      offset: const Offset(0.0, -40.0),
      child: CustomPaint(
        painter: CustomTooltipPainter(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Text(_errorMessage, style: AppTextStyle.white_400_14),
        ),
      ),
    );
  }
}
