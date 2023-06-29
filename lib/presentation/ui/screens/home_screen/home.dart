import 'package:cleanapp/domain/models/user_model.dart';
import 'package:cleanapp/presentation/blocs/user_list/user_list_cubit.dart';
import 'package:cleanapp/presentation/ui/widgets/user_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<UserListCubit>(context, listen: false)
          .getUsersList(isFirstCall: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users list "),
      ),
      body:
          BlocBuilder<UserListCubit, UserListState>(builder: (context, state) {
        if (state is UserListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserListFailed) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is UserListSuccess || state is UserListPaginationLoading) {
          List<UserModel> userListData = [];
          if (state is UserListSuccess) {
            userListData = state.usersList;
          } else if (state is UserListPaginationLoading) {
            userListData = state.usersList;
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (value) {
              if (value.metrics.extentAfter < 500) {
                // if loading, return false;
                if (state is UserListPaginationLoading) return false;

                BlocProvider.of<UserListCubit>(context, listen: false)
                    .getUsersList();
                return true;
              }
              return false;
            },
            child: ListView.builder(
              itemCount: userListData.length,
              itemBuilder: (context, index) {
                final userItem = userListData[index];
                return UserListItemWidget(
                  userModel: userItem,
                  isLoading: index == userListData.length - 1 &&
                      state is UserListPaginationLoading,
                );
              },
            ),
          );
        }
        return const Center(
          child: Text('No data'),
        );
      }),
    );
  }
}
