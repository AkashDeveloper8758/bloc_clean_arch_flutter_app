import 'package:cleanapp/data/datasource/remote_data_source.dart';
import 'package:cleanapp/data/repositories/api_repository_impl.dart';
import 'package:cleanapp/domain/repositories/api_repositories.dart';
import 'package:cleanapp/presentation/blocs/user_detail/user_detail_cubit.dart';
import 'package:cleanapp/presentation/blocs/user_list/user_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<http.Client>(http.Client());
  getIt.registerSingleton<RemoteDataSource>(
      RemoteDatasourceImplementation(client: getIt()));
  getIt
      .registerSingleton<ApiRepositories>(ApiRepositoryImplementation(getIt()));
  getIt.registerSingleton<UserListCubit>(UserListCubit(getIt()));
  getIt.registerSingleton<UserDetailCubit>(UserDetailCubit(getIt()));
}
