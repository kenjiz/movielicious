part of 'movie_credits_cubit.dart';

class MovieCreditsState extends Equatable {
  const MovieCreditsState({
    required this.casts,
    this.status = StateStatus.loading,
    this.error,
  });

  factory MovieCreditsState.initial() => const MovieCreditsState(casts: []);

  final List<MovieCast> casts;
  final StateStatus status;
  final MovieDetailsError? error;

  @override
  List<Object?> get props => [casts, status, error];

  MovieCreditsState copyWith({
    List<MovieCast>? casts,
    StateStatus? status,
    MovieDetailsError? error,
  }) {
    return MovieCreditsState(
      casts: casts ?? this.casts,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
