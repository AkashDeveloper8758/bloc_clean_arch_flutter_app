import 'dart:convert';

import 'package:cleanapp/domain/models/requests/get_single_user_request.dart';
import 'package:cleanapp/domain/models/requests/get_user_request.dart';
import 'package:cleanapp/domain/models/response/user_detail_response.dart';
import 'package:cleanapp/domain/models/response/user_list_response.dart';
import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/utils/constants.dart';
import 'package:cleanapp/utils/resource/data_state.dart';
import 'package:cleanapp/utils/strings.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<UsersListResponse> getAllUsersDatasource(UsersListRequest request);
  Future<UserDetailsResponse> getUserByIdDatasource(
      UserDataRequest userDataRequest);
}

class RemoteDatasourceImplementation extends RemoteDataSource {
  final http.Client client;
  RemoteDatasourceImplementation({required this.client});

  @override
  Future<UsersListResponse> getAllUsersDatasource(
      UsersListRequest request) async {
    try {
      var clientResponse = await client.get(Uri.parse(
          '${ApiStringsConstants.baseUrl}api/users?page=${request.page}'));
      if (clientResponse.statusCode != 200) {
        return UsersListResponse(
            userListState:
                const DataFailed(error: 'Error on fetching users list'));
      }
      var jsonData = jsonDecode(clientResponse.body);
      var usersListData = jsonData['data'] as List;
      var usersModels = usersListData.map((e) => UserModel.fromMap(e)).toList();
      return UsersListResponse(
          userListState: DataSuccess<List<UserModel>>(data: usersModels));
    } catch (err) {
      return UsersListResponse(
          userListState: const DataFailed(
              error: ErrorMessagesConstants.somethingWentWrong));
    }
  }

  @override
  Future<UserDetailsResponse> getUserByIdDatasource(
      UserDataRequest userDataRequest) async {
    try {
      var clientResponse = await client.get(Uri.parse(
          '${ApiStringsConstants.baseUrl}api/users/${userDataRequest.userId}'));
      if (clientResponse.statusCode != 200) {
        return UserDetailsResponse(
            userDetailDataState:
                const DataFailed(error: 'Error on fetching users details'));
      }
      var jsonData = jsonDecode(clientResponse.body);
      var userDetailsData = jsonData['data'];
      var usersModels = UserModel.fromMap(userDetailsData);

      return UserDetailsResponse(
          userDetailDataState: DataSuccess<UserModel>(data: usersModels));
    } catch (err) {
      return UserDetailsResponse(
          userDetailDataState: const DataFailed(
              error: ErrorMessagesConstants.somethingWentWrong));
    }
  }
}
