import '../../domain/repositories/home_repository_interface.dart';
import '../datasources/home_remote_datasource.dart';

class HomeRepository implements HomeRepositoryInterface {
  final HomeRemoteDataSourceInterface remoteDatasource;

  HomeRepository({
    required this.remoteDatasource,
  });
}
