import 'package:flutter/material.dart';
import 'package:number_to_word/src/constant/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final bool readOnly;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.readOnly,
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
          style: AppTextStyle.black_400_14,
          readOnly: widget.readOnly,
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
                ? IconButton(
                    icon: const Icon(Icons.info),
                    color: Colors.red,
                    onPressed: () {
                      //TODO: tooltip
                      print(_errorMessage);
                    },
                  )
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
}
