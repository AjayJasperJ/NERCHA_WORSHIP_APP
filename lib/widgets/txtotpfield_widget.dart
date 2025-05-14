import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';

class txtotpfield extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;

  const txtotpfield({super.key, this.length = 4, this.onCompleted});

  @override
  State<txtotpfield> createState() => _txtotpfieldState();
}

class _txtotpfieldState extends State<txtotpfield> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  String _otp = '';

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.length, (index) => FocusNode());
  }

  void _handleTextChange(int index, String value) {
    if (value.isNotEmpty) {
      // Only allow first character and move focus
      _controllers[index].text = value[0];

      // Move to the first empty field
      final nextEmpty = _controllers.indexWhere((c) => c.text.isEmpty);
      if (nextEmpty != -1) {
        _focusNodes[nextEmpty].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    } else {
      _handleBackspace(index);
    }

    _updateOtp();
  }

  void _handlePaste(String pastedValue) {
    for (int i = 0; i < pastedValue.length; i++) {
      if (i < widget.length) {
        _controllers[i].text = pastedValue[i];
        if (i == pastedValue.length - 1 && i < widget.length - 1) {
          _focusNodes[i + 1].requestFocus();
        }
      }
    }
    _updateOtp();
  }

  void _updateOtp() {
    final newOtp = _controllers.map((c) => c.text).join();
    if (newOtp != _otp) {
      _otp = newOtp;
      widget.onCompleted?.call(_otp);
    }
  }

  void _handleTap(int index) {
    // Focus tapped field if empty, otherwise first empty field
    if (_controllers[index].text.isEmpty) {
      _focusNodes[index].requestFocus();
    } else {
      final firstEmptyIndex = _controllers.indexWhere((c) => c.text.isEmpty);
      if (firstEmptyIndex != -1) {
        _focusNodes[firstEmptyIndex].requestFocus();
      } else {
        _focusNodes[index].requestFocus();
      }
    }
  }

  void _handleBackspace(int index) {
    if (_controllers[index].text.isNotEmpty) {
      _controllers[index].clear();
    } else {
      // Move to the previous filled field
      for (int i = index - 1; i >= 0; i--) {
        if (_controllers[i].text.isNotEmpty) {
          _controllers[i].clear();
          _focusNodes[i].requestFocus();
          break;
        }
      }
    }
    _updateOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (index) {
        return Container(
          width: displaysize.height * .095,
          height: displaysize.height * .065,
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            onKey: (event) {
              if (event.logicalKey == LogicalKeyboardKey.backspace) {
                _handleBackspace(index);
              }
            },
            child: GestureDetector(
              onTap: () => _handleTap(index),
              child: TextFormField(
                controller: _controllers[index],
                focusNode: _focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constantcolors().nercha_grey),
                    borderRadius: BorderRadius.circular(displaysize.width / 4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(displaysize.width / 4),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (value) => _handleTextChange(index, value),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
