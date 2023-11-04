import '../../model/genre_response_model.dart';

abstract class GenreRemoteDataSource {
  Future<GenreResponseModel> getGenres();
}
