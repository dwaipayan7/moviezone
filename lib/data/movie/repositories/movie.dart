import 'package:dartz/dartz.dart';
import 'package:moviezone/common/mapper/movie_mapper.dart';
import 'package:moviezone/data/movie/models/movie.dart';
import 'package:moviezone/data/movie/sources/movie.dart';
import 'package:moviezone/domain/movie/repository/movie.dart';

import '../../../service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var returnedData = await sl<MovieService>().getTrendingMovies();

      return returnedData.fold(
            (error) {
          return Left(error);  // Return Left if there's an error
        },
            (data) {
          var movies = List.from(data['content'])
              .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
              .toList();
          return Right(movies);  // Return Right with movies if data is successful
        },
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
