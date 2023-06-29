import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/utils/resource/data_state.dart';

class UsersListResponse {
  DataState<List<UserModel>> userListState;
  UsersListResponse({required this.userListState});
}
