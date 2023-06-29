part of 'user_detail_cubit.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();

  @override
  List<Object> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailSuccess extends UserDetailState {
  final UserModel userModel;
  const UserDetailSuccess({required this.userModel});
}

class UserDetailFailed extends UserDetailState {
  final String errorMessage;
  const UserDetailFailed({required this.errorMessage});
}
