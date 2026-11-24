class ListModel {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final String createdAt;

  ListModel({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.id,
  });
}

class TodoItems {
  bool status;
  String message;
  List<ListModel> listItems;
  TodoItems({
    required this.status,
    required this.message,
    required this.listItems,
  });

  factory TodoItems.fromjson(Map<String, dynamic> json) {
    final tempList = json["todoList"]
        .map<ListModel>(
          (todoItem) => ListModel(
            id: todoItem["id"] ?? "",
            title: todoItem["title"] ?? "",
            description: todoItem["description"] ?? "",
            isCompleted: todoItem["isCompleted"] ?? "",
            createdAt: todoItem["createdAt"] ?? "",
          ),
        )
        .toList();
    return TodoItems(
      status: json["status"],
      message: json["message"],
      listItems: tempList,
    );
  }
}
