import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nercha_worship_app/app.dart';
import 'package:nercha_worship_app/core/constants/colors.dart';
import 'package:nercha_worship_app/core/constants/images.dart';
import 'package:nercha_worship_app/screens/auth/other/otp_screen.dart';
import 'package:nercha_worship_app/screens/auth/register/register_widget.dart';
import 'package:nercha_worship_app/widgets/backbutton_widget.dart';
import 'package:nercha_worship_app/widgets/buttonstyle_widget.dart';
import 'package:nercha_worship_app/widgets/txt_widget.dart';
import 'package:nercha_worship_app/widgets/txtfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final widgets = RegisterWidget();
  final icons = Constanticons();
  final colors = Constantcolors();
  final name_controller = TextEditingController();
  final mail_controller = TextEditingController();
  final address_controller = TextEditingController();
  final _focus_1 = FocusNode();
  final _focus_2 = FocusNode();
  final _focus_3 = FocusNode();

  @override
  void dispose() {
    super.dispose();
    name_controller.dispose();
    mail_controller.dispose();
    address_controller.dispose();
    _focus_1.dispose();
    _focus_2.dispose();
    _focus_3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> registerfield_data = [
      {
        'prefixicon': icons.person,
        'hinttext': 'Name',
        'controller': name_controller,
        'validator': widgets.validatename,
        'focus_c': _focus_1,
        'focus_n': _focus_2,
        'keyboardtype': TextInputType.name,
        'inputformat': [LengthLimitingTextInputFormatter(30)],
      },
      {
        'prefixicon': icons.mail,
        'hinttext': 'Email ID',
        'controller': mail_controller,
        'validator': widgets.validatemail,
        'focus_c': _focus_2,
        'focus_n': _focus_3,
        'keyboardtype': TextInputType.emailAddress,
        'inputformat': [LengthLimitingTextInputFormatter(30)],
      },
      {
        'prefixicon': icons.location,
        'hinttext': 'Address',
        'controller': address_controller,
        'validator': widgets.validateaddress,
        'focus_c': _focus_3,
        'focus_n': null,
        'keyboardtype': TextInputType.streetAddress,
        'inputformat': [LengthLimitingTextInputFormatter(50)],
      },
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: displaysize.width * .04,
            vertical: displaysize.height * .02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backbutton(boarder: true),
              SizedBox(height: displaysize.height * .03),
              Txt(
                'Create a new account',
                color: colors.nercha_darkblue,
                size: displaysize.height * .025,
                font: Font.semiBold,
              ),

              SizedBox(height: displaysize.height * .02),
              SizedBox(
                width: displaysize.width * .85,
                child: Txt(
                  'Please fill the information correctly to create your new account.',
                  color: colors.nercha_darkblue,
                  size: displaysize.height * .016,
                  font: Font.medium,
                ),
              ),
              SizedBox(height: displaysize.height * .04),
              Center(
                child: SizedBox(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: colors.nercha_white,
                        radius: displaysize.height * .07,
                        backgroundImage: AssetImage(
                          Constantimages().empty_profile,
                        ),
                      ),
                      SizedBox(height: displaysize.height * .01),
                      Txt(
                        "+ Add Image",
                        font: Font.medium,
                        color: colors.nercha_darkblue,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: displaysize.height * .04),
              Column(
                children: List.generate(registerfield_data.length, (index) {
                  final value = registerfield_data[index];
                  return Column(
                    children: [
                      txtfield(
                        prefixIcon: Image.asset(
                          value['prefixicon'],
                          color: colors.nercha_grey,
                        ),
                        hintText: value['hinttext'],
                        controller: value['controller'],
                        focusNode: value['focus_c'],
                        nextFocusNode: value['focus_n'],
                        keyboardtype: value['keyboardtype'],
                        inputformat: value['inputformat'],
                      ),
                      SizedBox(height: displaysize.height * .02),
                    ],
                  );
                }),
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: colors.nercha_orange_2,
                  ),
                  Text("Agree to Terms and Conditions"),
                ],
              ),
              SizedBox(height: displaysize.height * .05),
              SizedBox(
                height: displaysize.height * .06,
                width: displaysize.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => OtpScreen()),
                    // );
                  },
                  style: ButtonstyleWidget().elevated_filled_apptheme(),
                  child: Txt(
                    'Submit',
                    color: colors.nercha_white,
                    font: Font.medium,
                    size: displaysize.height * .02,
                  ),
                ),
              ),
              SizedBox(height: displaysize.height * .025),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: displaysize.height * .016,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'general_sans',
                        ),
                      ),
                      TextSpan(
                        text: "Login",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: displaysize.height * .016,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'general_sans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: displaysize.height * .025),
            ],
          ),
        ),
      ),
    );
  }
}
