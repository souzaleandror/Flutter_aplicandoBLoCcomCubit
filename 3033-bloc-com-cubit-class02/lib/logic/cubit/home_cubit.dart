import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:bloc/bloc.dart';

import '../../models/movie.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  final HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } catch (e, ex) {
      emit(HomeError('Nao foi possivel carregar a lista de filme'));
    }
  }
}
