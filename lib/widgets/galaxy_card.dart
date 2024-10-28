import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class GalaxyCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? titleSmall;
  final String? subtitle;
  final String? age;
  final String? numOfStars;
  const GalaxyCard(
      {super.key,
      this.imageUrl,
      this.title,
      this.subtitle,
      this.age,
      this.numOfStars,
      this.titleSmall});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 10, 24),
      child: Container(
        width: width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white10,
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
              Expanded(child: buildHeader(width)),
              buildBody(context),
              const Divider(
                height: 8,
                thickness: 1,
                indent: 4,
                endIndent: 4,
              ),
              buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildHeader(double width) {
    return Padding(
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
            child: imageUrl == null
                ? Image.asset(
                    KDefImageJ,
                    width: width * 0.45,
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    imageUrl!,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Text(
                  title ?? 'Galaxy',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                child: Text(
                  titleSmall ?? '2',
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      fontSize: 10,
                      color: Colors.grey),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Padding buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
              child: Text(
                subtitle ?? 'Some interesting fact',
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
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
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    numOfStars ?? '4 million',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
            ],
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: Text(
                      age ?? '40 million years',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
