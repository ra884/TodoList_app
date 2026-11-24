import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/models/list_model.dart';
import 'package:to_do_list_app/providers/list_provider.dart';

class CustomTodoItem extends StatelessWidget {
  final ListModel todoItem;

  CustomTodoItem({super.key, required this.todoItem});
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = context.read<ListProvider>();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          tileColor: const Color.fromARGB(255, 240, 244, 245),
          leading: Text(todoItem.title),
          trailing: Row(
            spacing: 5,
            mainAxisSize: .min,
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        crossAxisAlignment: .center,
                        spacing: 10,
                        children: [
                          Text(
                            "Upadate Task",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: .bold,
                            ),
                          ),
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                              hintText: todoItem.title,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              provider.RequestUpdateItem(
                                id: todoItem.id,
                                title: titleController.text,
                              );
                            },
                            child: Text(
                              "Upadte",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.blueAccent),
              ),
              IconButton(
                onPressed: () {
                  provider.RequestDeleteItem(id: todoItem.id);
                },
                icon: Icon(Icons.delete, color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
