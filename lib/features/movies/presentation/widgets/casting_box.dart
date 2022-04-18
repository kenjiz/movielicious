import 'package:flutter/material.dart';

// Constants
import '../../../../constants/constants.dart';

// Models
import '../../models/models.dart';

class CastingBox extends StatelessWidget {
  const CastingBox({
    Key? key,
    required this.width,
    required this.height,
    required this.cast,
  }) : super(key: key);

  final double width;
  final double height;
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cast.profilePhotoURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Column(
              children: [
                Text(
                  cast.name,
                  textAlign: TextAlign.center,
                  style: kTextStyleBody2.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 12),
                ),
                const SizedBox(height: 5),
                Text(
                  cast.character,
                  textAlign: TextAlign.center,
                  style: kTextStyleBody2.copyWith(
                    
                    fontSize: 13,
                    color: Colors.white60,
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
