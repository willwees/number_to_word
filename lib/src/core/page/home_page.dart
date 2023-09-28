import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_to_word/src/constant/app_text_style.dart';
import 'package:number_to_word/src/core/core.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _numberToWordFormKey = GlobalKey<FormState>();
  final TextEditingController _outputTextEditingController = TextEditingController();

  @override
  void dispose() {
    _outputTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (HomeState previous, HomeState current) => previous.convertResult != current.convertResult,
      listener: (BuildContext context, HomeState state) {
        // update output text
        _outputTextEditingController.text = state.convertResult;
      },
      child: GestureDetector(
        onTap: () {
          // dismiss keyboard
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Converter app'),
          ),
          body: _buildContent(),
          resizeToAvoidBottomInset: false,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Please enter an integer number in the "input" box and tap on "Convert" to see the equivalent in words appear in the "Output" box',
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 32.0),
          _buildNumberToWordForm(),
        ],
      ),
    );
  }

  Widget _buildNumberToWordForm() {
    return Expanded(
      child: Form(
        key: _numberToWordFormKey,
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              title: 'Input',
              readOnly: false,
              onChanged: (String value) {
                final bool isValid = _numberToWordFormKey.currentState!.validate();
                if (!isValid) {
                  return;
                }

                context.read<HomeBloc>().add(HomeUpdateInputNumberEvent(value: value));
              },
            ),
            const SizedBox(height: 32.0),
            CustomTextFormField(
              controller: _outputTextEditingController,
              title: 'Output',
              readOnly: true,
              maxLines: 4,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                final bool isValid = _numberToWordFormKey.currentState!.validate();
                if (!isValid) {
                  return;
                }

                context.read<HomeBloc>().add(HomeConvertNumberEvent());
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  side: BorderSide(),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text('Convert', style: AppTextStyle.black_400_14),
            ),
            const SizedBox(height: 56.0),
          ],
        ),
      ),
    );
  }
}
