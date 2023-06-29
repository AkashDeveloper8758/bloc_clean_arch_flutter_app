part of 'user_list_cubit.dart';

abstract class UserListState extends Equatable {
  final List<UserModel> usersList;
  const UserListState({this.usersList = const []});

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListSuccess extends UserListState {}

class UserListFailed extends UserListState {}

class UserListLoading extends UserListState {}
