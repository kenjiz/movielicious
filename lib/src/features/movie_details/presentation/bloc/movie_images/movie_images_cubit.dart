import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_images_state.dart';

class MovieImagesCubit extends Cubit<MovieImagesState> {
  MovieImagesCubit() : super(MovieImagesInitial());
}
