import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());
}
