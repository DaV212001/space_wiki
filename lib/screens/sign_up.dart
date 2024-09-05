import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';
import '../utils/animations.dart';
import '../widgets/footer.dart';
import '../widgets/input_field.dart';
import '../widgets/main_button.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SignUpController signUpController = Get.put(SignUpController());
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0, 140),
          end: const Offset(0, 0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1, 1),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-0.349, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
  }

  bool agreedToTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: 100,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  stops: const [0, 1],
                  begin: const AlignmentDirectional(0.87, -1),
                  end: const AlignmentDirectional(-0.87, 1),
                ),
              ),
              alignment: const AlignmentDirectional(0, -1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 32),
                      child: Container(
                        width: 284,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: Text(
                          'Space Wiki',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    buildBody(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 570,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildForm(context),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: Obx(
                    () => MainButton(
                      isLoading: signUpController.isLoading.value,
                      onPress: () => signUpController.signUserUp(),
                      text: 'Create Account',
                    ),
                  ),
                ),
                const Footer(
                  isLogin: false,
                ),
              ],
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }

  Column buildForm(BuildContext context) {
    return Column(
      children: [
        InputFieldWidget(
            textEditingController: signUpController.firstnameController,
            focusNode: signUpController.firstnameFocusNode,
            validator: (val) {
              if (val!.length < 2) {
                return "First name must be at least 2 characters.";
              }
              return null;
            },
            obscureText: false,
            passwordinput: false,
            label: 'First name'),
        InputFieldWidget(
            textEditingController: signUpController.lastnameController,
            focusNode: signUpController.lastnameFocusNode,
            validator: (val) {
              if (val!.length < 2) {
                return "Last name must be at least 2 characters.";
              }
              return null;
            },
            obscureText: false,
            passwordinput: false,
            label: 'Last name'),
        InputFieldWidget(
            textEditingController: signUpController.emailAddressController,
            focusNode: signUpController.emailAddressFocusNode,
            validator: (val) {
              if (!val!.isEmail) {
                return "Enter a valid email.";
              }
              return null;
            },
            obscureText: false,
            passwordinput: false,
            label: 'Email'),
        InputFieldWidget(
          textEditingController: signUpController.passwordController,
          focusNode: signUpController.passwordFocusNode,
          passwordinput: true,
          obscureText: false,
          label: 'Password',
          validator: (val) {
            print("length ${val!.length}");
            if (val.length < 8) {
              return "Password must be at least 8 characters.";
            }
            return null;
          },
        ),
        InputFieldWidget(
            textEditingController: signUpController.phoneController,
            focusNode: signUpController.phoneFocusNode,
            label: 'Phone number',
            validator: (val) {
              if (val!.length < 10) {
                return "Invalid Phone Number";
              }
              return null;
            },
            obscureText: false,
            passwordinput: false)
      ],
    );
  }
}
