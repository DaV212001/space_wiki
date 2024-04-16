import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_constants.dart';


class GalaxyCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? titleSmall;
  final String? subtitle;
  final String? age;
  final String? numOfStars;
  const GalaxyCard({super.key, this.imageUrl, this.title, this.subtitle, this.age, this.numOfStars, this.titleSmall});

  @override
  Widget build(BuildContext context) {
    return // Generated code for this SocialPost1 Widget...
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 24),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3416202A),
                offset: Offset(
                  0.0,
                  3,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: imageUrl == null? SvgPicture.asset(
                          KDefImage,
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ): Image.network(
                          imageUrl!,
                          width: double.infinity,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Text(
                          title??'Galaxy',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          titleSmall??'2',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0,
                            fontSize: 10,
                            color: Colors.grey
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          subtitle??'Some interesting fact',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 8,
                  thickness: 1,
                  indent: 4,
                  endIndent: 4,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                              child: Icon(
                                Icons.star_rounded,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 8, 0),
                              child: Text(
                                numOfStars??'4 million',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 0, 8),
                              child: Icon(
                                Icons.hourglass_bottom_rounded,
                                size: 24,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 8, 0),
                              child: Text(
                                age??'40 million years',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
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
    ;
  }
}
