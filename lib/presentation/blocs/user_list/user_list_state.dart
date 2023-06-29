part of 'user_list_cubit.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListSuccess extends UserListState {
  final List<UserModel> usersList;
  const UserListSuccess({this.usersList = const []});
}

class UserListFailed extends UserListState {
  final String errorMessage;
  const UserListFailed({required this.errorMessage});
}

class UserListLoading extends UserListState {}

class UserListPaginationLoading extends UserListState {
  final List<UserModel> usersList;
  const UserListPaginationLoading({required this.usersList});
}
