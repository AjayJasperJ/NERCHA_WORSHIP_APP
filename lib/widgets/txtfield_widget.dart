import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';

class txtfield extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction? textInputAction;
  final bool? isPrefix;
  final List<TextInputFormatter>? inputformat;
  final TextInputType? keyboardtype;

  const txtfield({
    super.key,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.focusNode,
    this.nextFocusNode,
    this.textInputAction,
    this.isPrefix,
    this.inputformat,
    this.keyboardtype,
  });

  @override
  State<txtfield> createState() => _txtfieldState();
}

class _txtfieldState extends State<txtfield> {
  final colors = Constantcolors();
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _hasSubmitted = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller.addListener(_handleTextChanged);
  }

  void _handleTextChanged() {
    if (_hasSubmitted) {
      _validate();
    }
  }

  void _validate() {
    if (widget.validator == null) return;
    final error = widget.validator!(_controller.text);
    setState(() => _hasError = error != null);
  }

  String? _validator(String? value) {
    if (!_hasSubmitted) return null;
    return widget.validator?.call(value);
  }

  void _handleSubmitted(String value) {
    setState(() => _hasSubmitted = true);
    _validate();

    if (widget.nextFocusNode != null) {
      widget.nextFocusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          textInputAction:
              widget.textInputAction ??
              (widget.nextFocusNode != null
                  ? TextInputAction.next
                  : TextInputAction.done),
          onFieldSubmitted: _handleSubmitted,
          validator: _validator,
          inputFormatters: widget.inputformat,
          keyboardType: widget.keyboardtype,
          decoration: InputDecoration(
            prefixIcon:
                !(widget.isPrefix ?? false)
                    ? Container(
                      margin: EdgeInsets.only(
                        left: displaysize.height * .025,
                        right: displaysize.height * .005,
                      ),
                      height: displaysize.height * .025,
                      width: displaysize.height * .025,
                      child: widget.prefixIcon,
                    )
                    : Container(
                      width: displaysize.height * .13,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: displaysize.height * .015,
                          ),
                          child: widget.prefixIcon,
                        ),
                      ),
                    ),
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: colors.nercha_grey_1,
              fontWeight: Font.medium.weight,
              fontSize: displaysize.height * .016,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(displaysize.width / 4),
              borderSide: BorderSide(
                color: _hasError ? Colors.redAccent : colors.nercha_darkblue,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(displaysize.width / 4),
              borderSide: BorderSide(
                color: _hasError ? Colors.redAccent : colors.nercha_grey,
                width: 1,
              ),
            ),
          ),
        ),
        if (_hasError && _hasSubmitted)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 12),
            child: Text(
              widget.validator!(_controller.text) ?? '',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChanged);
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }
}

// final _focus1 = FocusNode();
// final _focus2 = FocusNode();

// SmartTextFormField(
//   hintText: 'Email Address',
//   validator: (value) => value!.contains('@') ? null : 'Invalid email',
//   focusNode: _focus1,
//   nextFocusNode: _focus2,
// ),
// SmartTextFormField(
//   hintText: 'Password',
//   focusNode: _focus2,
//   obscureText: true,
// ),

// final _formKey = GlobalKey<FormState>();

// void _submitForm() {
//   if (_formKey.currentState!.validate()) {
//     // Handle form submission
//   }
// }

// // In build method:
// Form(
//   key: _formKey,
//   child: Column(
//     children: [
//       // Your SmartTextFormField widgets
//       ElevatedButton(
//         onPressed: _submitForm,
//         child: const Text('Submit'),
//       ),
//     ],
//   ),
// );
