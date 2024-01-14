import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'casts_state.dart';

class CastsCubit extends Cubit<CastsState> {
  CastsCubit() : super(CastsInitial());
}
