import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_wiki/constants/app_constants.dart';

class SmallContentCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? size;
  const SmallContentCard({super.key,  this.imageUrl,  this.title,  this.subtitle,  this.size});

  @override
  Widget build(BuildContext context) {
    return // Generated code for this Container Widget...
      Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 12),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        title??'Planet',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: Text(
                    subtitle??'Some distance away from earth',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                  child: Text(
                    size??'~~ tons',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                    ),
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
