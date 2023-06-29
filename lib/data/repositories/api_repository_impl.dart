import 'package:cleanapp/data/datasource/remote_data_source.dart';
import 'package:cleanapp/domain/models/requests/get_single_user_request.dart';
import 'package:cleanapp/domain/models/requests/get_user_request.dart';
import 'package:cleanapp/domain/models/response/user_detail_response.dart';
import 'package:cleanapp/domain/models/response/user_list_response.dart';
import 'package:cleanapp/domain/repositories/api_repositories.dart';

class ApiRepositoryImplementation extends ApiRepositories {
  final RemoteDataSource _remoteDataSource;
  ApiRepositoryImplementation(this._remoteDataSource);

  @override
  Future<UserDetailsResponse> fetchUserData(
      {required UserDataRequest userDataRequest}) {
    return _remoteDataSource.getUserByIdDatasource(userDataRequest);
  }

  @override
  Future<UsersListResponse> fetchUsersList(
      {required UsersListRequest request}) {
    return _remoteDataSource.getAllUsersDatasource(request);
  }
}
