import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final bool isLogin;
  const Footer({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
      child: GestureDetector(
        onTap: () {
          ///TODO: Implement Navigation Logic;
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: isLogin
                    ? 'Don\'t have an account?  '
                    : 'Already have an account?  ',
                style: TextStyle(),
              ),
              TextSpan(
                text: isLogin ? 'Sign Up here' : 'Log In here',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          textScaler: TextScaler.linear(
              MediaQuery.of(context).textScaler.textScaleFactor),
        ),
      ),
    );
  }
}
