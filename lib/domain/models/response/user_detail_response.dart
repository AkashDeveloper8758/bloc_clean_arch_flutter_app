import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/utils/resource/data_state.dart';

class UserDetailsResponse {
  DataState<UserModel> userDetailDataState;
  UserDetailsResponse({required this.userDetailDataState});
}
