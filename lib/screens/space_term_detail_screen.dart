import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:space_wiki/utils/animations.dart';

import '../models/space_term.dart';
import '../widgets/header_image_and_text.dart';

class SpaceTermDetailScreen extends StatelessWidget {
  final SpaceTerm spaceTerm;
  const SpaceTermDetailScreen({super.key, required this.spaceTerm});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              Divider(
                height: 32,
                thickness: 1,
              ),
              buildBody(context)
            ],
          ),
        ),
      ),
        ]
      )
    );
  }


  Column buildHeader(BuildContext context) {

    final animationsMap = {
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: Offset(0, 170),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
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
            begin: Offset(0, -250),
            end: Offset(0, 0),
          ),
        ],
      ),
    };

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HeaderImageAndButtons()
          .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
      Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 10, 0, 0),
          child: Text(
            spaceTerm.term!,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ))
    ]);
  }

  Column buildBody(BuildContext context) {

    final animationsMap = {
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: 0,
            end: 1,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.ms,
            duration: 600.ms,
            begin: Offset(0, 170),
            end: Offset(0, 0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
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
            begin: Offset(0, -250),
            end: Offset(0, 0),
          ),
        ],
      ),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 0, 0),
          child: Text(
            'Definition',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 12),
          child: Text(
            spaceTerm.definition!,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 12),
          child: Text(
            'Originators: ${spaceTerm.originators!}',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
        ),
      ],
    );
}
}
