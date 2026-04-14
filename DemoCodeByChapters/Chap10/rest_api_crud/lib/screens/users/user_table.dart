import 'package:flutter/material.dart';
import 'package:rest_api_crud/screens/users/user_edit_form.dart';
import '../../../controllers/user_controller.dart';
import '../../../data/models/user_model.dart';

class UserTable extends StatelessWidget {
  final List<UserModel> users;
  final UserController controller;

  const UserTable({super.key, required this.users, required this.controller});

  @override
  Widget build(BuildContext context) {
    // 1. Lớp cuộn dọc để xem danh sách dài
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      // 2. Lớp cuộn ngang để xem các cột bị khuất bên phải
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('CreatedAt')),
            DataColumn(label: Text('Action Edit')),
            DataColumn(label: Text('Action Delete')),
          ],
          rows: users.map((user) {
            return DataRow(
              cells: [
                DataCell(Text(user.id.toString())),
                DataCell(Text(user.name)),
                DataCell(Text(user.email)),
                DataCell(Text(user.createdAt)),
                DataCell(
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                    ), // Đổi vị trí cho đúng logic cột bạn đặt
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) =>
                            UserEditForm(user: user, controller: controller),
                      );
                    },
                  ),
                ),
                DataCell(
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      controller.deleteUser(user.id! as String);
                    },
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
