import 'package:flutter/material.dart';

import 'package:movielicious/src/core/core.dart';

class LoadedImage extends StatelessWidget {
  const LoadedImage({
    required this.source,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.pinchToZoom,
    super.key,
  });

  final String source;
  final BoxFit? fit;
  final Alignment alignment;
  final double? width;
  final double? height;
  final bool? pinchToZoom;

  @override
  Widget build(BuildContext context) {
    return _buildImage();
  }

  Widget _buildImage() => Image.network(
        source,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Center(
              child: AdaptiveProgressIndicator(
            value: progress.expectedTotalBytes != null
                ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                : null,
          ));
        },
        fit: fit,
        alignment: alignment,
        width: width,
        height: height,
        errorBuilder: (context, error, stackTrace) {
          return const Center(child: Text('Error loading image'));
        },
      );
}
