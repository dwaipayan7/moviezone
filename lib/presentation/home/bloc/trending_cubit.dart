import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviezone/domain/movie/entities/movie.dart';
import 'package:moviezone/domain/movie/usecase/get_trending_movies.dart';

import '../../../service_locator.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async{
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();

    returnedData.fold(
        (error){
          emit(FailureLoadTrendingMovies(errorMessage: error));
        },
        (data){
          emit(TrendingMoviesLoaded(movies: data));
        }
    );
    
  }

}

