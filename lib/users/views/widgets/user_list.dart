import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/users/controllers/user_controller.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, controller, _) {
        if (controller.users.isEmpty) {
          return const Center(child: Text('No users added'));
        }

        return ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (context, index) {
            final user = controller.users[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(user.name),
                subtitle: Text('Age: ${user.age}'),
              ),
            );
          },
        );
      },
    );
  }
}
