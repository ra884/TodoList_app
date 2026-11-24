import 'package:flutter/foundation.dart';
import 'package:to_do_list_app/models/list_model.dart';
import 'package:to_do_list_app/services/list_service.dart';

class ListProvider extends ChangeNotifier {
  TodoItems? todoObject;
  Future<void> RequestTodoItems() async {
    todoObject = await ListService.GetTodoItems();
    notifyListeners();
  }

  Future<void> RequestCreateItem({required String title}) async {
    await ListService.CreateTodoItem(title: title);
    RequestTodoItems();
  }

  Future<void> RequestUpdateItem({
    required int id,
    required String title,
  }) async {
    await ListService.UpdateTodoItem(id: id, title: title);
    RequestTodoItems();
  }

  Future<void> RequestDeleteItem({
    required int id,
  }) async {
    await ListService.DeleteTodoItem(id: id);
    RequestTodoItems();
  }
}
