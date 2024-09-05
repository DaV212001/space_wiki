import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../constants/app_constants.dart';
import '../utils/animations.dart';

class LargeContentCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? headTitle;
  final String? bottomText;
  final String? bottomNumber;
  const LargeContentCard(
      {super.key,
      this.imageUrl,
      this.title,
      this.headTitle,
      this.bottomText,
      this.bottomNumber,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    final animationsMap = {
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: Offset(0, 70),
            end: Offset(0, 0),
          ),
        ],
      ),
    };
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: imageUrl == null
                  ? Image.asset(
                      KDefImageJ,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      imageUrl!,
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Container(
                width: width * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                    stops: const [0.0, 1.0],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x2B202529),
                      offset: Offset(
                        0.0,
                        2,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 4, 0, 4),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    headTitle ?? 'Planet',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      title ?? "Earth",
                                      style: const TextStyle(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      subtitle ?? "Some earths fit",
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
