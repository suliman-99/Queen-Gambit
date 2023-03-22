import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(EvaIcons.search),
            onPressed: () async {
              var searchResult =
                  await userController.searchByName(controller.text);
              print(searchResult);
              Provider.of<OfflineGameProvider>(context, listen: false)
                  .updateSearchResult(searchResult);
              print(Provider.of<OfflineGameProvider>(context, listen: false)
                  .searchResult);
            },
          ),
          labelText: 'Tap here to search people',
        ),
      ),
    );
  }
}
