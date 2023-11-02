import '../../../../core/repository/base_api_repository.dart';
import '../../domain/repository/genre_repository.dart';
import '../datasource/remote/genre_remote_data_source.dart';
import '../model/genre_response_model.dart';

class GenreRepositoryImpl extends BaseApiRepository implements GenreRepository {
  final GenreRemoteDataSource _dataSource;
  const GenreRepositoryImpl(this._dataSource);

  @override
  FailureOrGenreResponse getGenres() {
    return getStateOf<GenreResponseModel>(request: _dataSource.getGenres);
  }
}
