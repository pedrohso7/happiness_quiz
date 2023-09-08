import '../../../../core/errors/local_storage_exception.dart';
import '../../../../core/result/result.dart';
import '../../domain/entities/question.dart';
import '../../domain/repositories/home_repository_interface.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeRemoteDataSourceInterface remoteDatasource;

  HomeRepository({
    required this.remoteDatasource,
  });

  @override
  Future<IResult<List<Question>>> getQuestions() async {
    try {
      return SuccessResult(await remoteDatasource.getQuestions());
    } on LocalStorageException catch (e) {
      return ErrorResult(e);
    }
  }
}
