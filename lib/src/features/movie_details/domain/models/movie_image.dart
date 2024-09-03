import 'package:equatable/equatable.dart';
import 'package:movielicious/src/core/core.dart';

class MovieImage extends Equatable {
  const MovieImage({
    required this.aspectRatio,
    required this.width,
    required this.height,
    required this.filePath,
  });

  final double aspectRatio;
  final int width;
  final int height;
  final String filePath;

  @override
  List<Object> get props => [
        aspectRatio,
        width,
        height,
        filePath,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aspect_ratio': aspectRatio,
      'width': width,
      'height': height,
      'file_path': filePath,
    };
  }

  factory MovieImage.fromMap(Map<String, dynamic> map) {
    return MovieImage(
      aspectRatio: map['aspect_ratio'] as double,
      width: map['width'] as int,
      height: map['height'] as int,
      filePath: kBaseImagePath + map['file_path'],
    );
  }
}
