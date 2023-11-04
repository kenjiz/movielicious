import '../../../../../core/service/tmdb_service.dart';
import '../../model/genre_response_model.dart';
import 'genre_remote_data_source.dart';

class GenreRemoteDataSourceImpl implements GenreRemoteDataSource {
  final TMDBService service;

  GenreRemoteDataSourceImpl({
    required this.service,
  });

  @override
  Future<GenreResponseModel> getGenres() async {
    return await service.getGenres();
  }
}
