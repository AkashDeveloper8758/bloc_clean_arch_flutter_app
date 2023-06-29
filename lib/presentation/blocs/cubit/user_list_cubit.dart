import 'package:bloc/bloc.dart';
import 'package:cleanapp/domain/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_list_state.dart';

class UserListCubit extends Cubit<UserListState> {
  UserListCubit() : super(UserListInitial());
}
