import 'package:flutter/material.dart';
import 'package:number_to_word/src/constant/app_text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    required this.title,
    required this.readOnly,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.title),
        const SizedBox(height: 8),
        TextFormField(
          style: AppTextStyle.black_400_14,
          readOnly: widget.readOnly,
          autovalidateMode: AutovalidateMode.always,
          validator: widget.readOnly == true
              ? null
              : (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Field cannot be empty!';
                  }

                  if (int.tryParse(value) == null) {
                    return 'Invalid value!';
                  }
                },
          decoration: InputDecoration(
            hintText: widget.title,
            contentPadding: const EdgeInsets.all(10),
            border: const OutlineInputBorder(),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.info),
              color: Colors.red,
              onPressed: () {
                //TODO: tooltip
              },
            ),
          ),
        ),
      ],
    );
  }
}
