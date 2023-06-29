import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/presentation/blocs/user_detail/user_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  final UserModel userModel;
  const DetailScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey(userModel.userId),
      appBar: AppBar(title: Text(userModel.firstName)),
      body: BlocBuilder<UserDetailCubit, UserDetailState>(
          builder: (context, state) {
        if (state is UserDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserDetailFailed) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        if (state is UserDetailSuccess) {
          final userData = state.userModel;
          return Container(
            padding: const EdgeInsets.all(8),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image.network(userData.avatarUrl)),
              Text("${userData.firstName} ${userData.lastName} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Text(userData.emailId, style: const TextStyle(fontSize: 18)),
            ]),
          );
        }
        return const Center(
          child: Text('no data found'),
        );
      }),
    );
  }
}
