import 'package:bloc/bloc.dart';
import 'package:cleanapp/domain/models/requests/get_single_user_request.dart';
import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/domain/repositories/api_repositories.dart';
import 'package:cleanapp/utils/resource/data_state.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/constants.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final ApiRepositories _apiRepositories;
  UserDetailCubit(this._apiRepositories) : super(UserDetailInitial());

  Future getUsersList({required int userId}) async {
    try {
      emit(UserDetailLoading());

      final usersListResposne = await _apiRepositories.fetchUserData(
          userDataRequest: UserDataRequest(userId: userId));
      final userListDataState = usersListResposne.userDetailDataState;

      if (userListDataState is DataFailed) {
        emit(UserDetailFailed(errorMessage: userListDataState.error!));
        return;
      }
      if (userListDataState is DataSuccess<UserModel>) {
        emit(UserDetailSuccess(userModel: userListDataState.data));
      }
    } catch (err) {
      emit(const UserDetailFailed(
          errorMessage: ErrorMessagesConstants.somethingWentWrong));
    }
  }
}
