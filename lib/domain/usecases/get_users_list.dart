import 'package:cleanapp/domain/models/requests/get_user_request.dart';
import 'package:cleanapp/domain/models/response/user_list_response.dart';
import 'package:cleanapp/domain/repositories/api_repositories.dart';

class GetAllUsersListUsecase {
  final ApiRepositories apiRepositories;
  GetAllUsersListUsecase(this.apiRepositories);
  Future<UsersListResponse> execute(UsersListRequest request) {
    return apiRepositories.fetchUsersList(request: request);
  }
}
