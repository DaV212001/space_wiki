import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';

class HeaderImageAndButtons extends StatelessWidget {
  const HeaderImageAndButtons({
    super.key,
    this.text,
    this.imageUrl,
  });

  final String? imageUrl;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: imageUrl == null
              ? Image.asset(
                  KDefImageJ,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ).image
              : Image.network(
                  imageUrl!,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ).image,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Color(0x17202529),
            offset: Offset(0, 1),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 36, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
