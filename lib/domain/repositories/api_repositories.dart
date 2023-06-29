import 'package:cleanapp/domain/models/requests/get_single_user_request.dart';
import 'package:cleanapp/domain/models/requests/get_user_request.dart';
import 'package:cleanapp/domain/models/response/user_detail_response.dart';
import 'package:cleanapp/domain/models/response/user_list_response.dart';

abstract class ApiRepositories {
  Future<UsersListResponse> fetchUsersList({required UsersListRequest request});
  Future<UserDetailsResponse> fetchUserData(
      {required UserDataRequest userDataRequest});
}
