import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Others/UserTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SearchField.dart';

class SearchPopup extends StatelessWidget {
  final Function(String) function;
  final UserController userController = UserController();
  SearchPopup({this.function});
  @override
  Widget build(BuildContext context) {
    List<UserViewModel> users =
        Provider.of<OfflineGameProvider>(context).searchResult;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: [
            Expanded(child: SearchField(), flex: 10),
            Expanded(child: SizedBox(height: 20), flex: 1),
            Expanded(
              flex: 40,
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: UserTile1(
                    UserViewModel(
                      name: users[index].name,
                      rate: users[index].rate,
                      avatar: users[index].avatar,
                    ),
                    Colors.grey[400],
                    Colors.black,
                    function,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
