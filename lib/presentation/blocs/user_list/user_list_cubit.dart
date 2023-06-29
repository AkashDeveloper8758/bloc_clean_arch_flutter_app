import 'package:bloc/bloc.dart';
import 'package:cleanapp/domain/models/requests/get_user_request.dart';
import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/domain/repositories/api_repositories.dart';
import 'package:cleanapp/utils/constants.dart';
import 'package:cleanapp/utils/resource/data_state.dart';
import 'package:equatable/equatable.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  final ApiRepositories _apiRepositories;
  UserListCubit(this._apiRepositories) : super(UserListInitial());
  var _currentPageNumber = 0;
  var _isMoreAvailable = true;
  List<UserModel> _usersList = [];

  Future getUsersList({bool isFirstCall = false}) async {
    try {
      if (isFirstCall) {
        _currentPageNumber = 0;
        _isMoreAvailable = true;
      }
      if (!_isMoreAvailable) return;

      if (_usersList.isNotEmpty) {
        emit(UserListPaginationLoading(usersList: _usersList));
      } else {
        emit(UserListLoading());
      }
      _currentPageNumber += 1;
      final usersListResposne = await _apiRepositories.fetchUsersList(
          request: UsersListRequest(page: _currentPageNumber));
      final userListDataState = usersListResposne.userListState;

      //* make _isMoreAvailable to false when there is error or not data came from the api.
      if (userListDataState.data == null || userListDataState.data!.isEmpty) {
        _isMoreAvailable = false;
      }
      if (userListDataState is DataFailed) {
        emit(UserListFailed(errorMessage: userListDataState.error!));
        return;
      }
      _usersList.addAll(userListDataState.data ?? []);
      emit(UserListSuccess(usersList: _usersList.toList()));
    } catch (err) {
      emit(const UserListFailed(
          errorMessage: ErrorMessagesConstants.somethingWentWrong));
    }
  }
}
