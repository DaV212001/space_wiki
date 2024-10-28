import 'package:flutter/material.dart';
import 'package:space_wiki/constants/app_constants.dart';

class SmallContentCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? subtitle;
  final String? size;
  final Gradient? gradient;

  const SmallContentCard({
    Key? key,
    this.imageUrl,
    this.title,
    this.subtitle,
    this.size,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.3,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageUrl == null
                    ? Image.asset(
                        KDefImageJ,
                        width: width * 0.45,
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        imageUrl!,
                        width: width * 0.45,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                top: 8,
                left: 8,
                right: 8,
                child: Container(
                  width: width * 0.45 - 16, // Adjust for padding
                  child: Text(
                    title ?? 'Planet',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              height: height * 0.1,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle ?? 'Some distance away from earth',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      size ?? '~~ tons',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
