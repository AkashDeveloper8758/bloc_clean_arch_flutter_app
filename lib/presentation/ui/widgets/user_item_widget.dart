import 'package:cleanapp/config/router/app_router.dart';
import 'package:cleanapp/config/router/route_arguments.dart';
import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/presentation/blocs/user_detail/user_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListItemWidget extends StatelessWidget {
  final UserModel userModel;
  final bool isLoading;
  const UserListItemWidget(
      {super.key, required this.userModel, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<UserDetailCubit>(context, listen: false)
            .getUsersList(userId: userModel.userId);
        Navigator.of(context).pushNamed(RouteName.userDetailScreen,
            arguments: UserDetailArgs(userModel));
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 28,
                    backgroundImage: NetworkImage(userModel.avatarUrl),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${userModel.firstName} ${userModel.lastName} ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(userModel.emailId),
                    ],
                  )
                ],
              )),
          if (isLoading)
            const SizedBox(
              height: 56,
              width: 56,
              child: Center(child: CircularProgressIndicator()),
            )
        ],
      ),
    );
  }
}
