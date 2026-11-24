import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/providers/list_provider.dart';
import 'package:to_do_list_app/widgets/custom_todo_item.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var provider = context.read<ListProvider>();
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Consumer<ListProvider>(
        builder: (context, value, child) {
          var data = value.todoObject?.listItems;
          if (data == null) {
            value.RequestTodoItems();
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
              spacing: 20,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 70),
                  child: Row(
                    children: [
                      Icon(Icons.checklist, color: Colors.white, size: 40),
                      Text(
                        "ToDayDo",
                        style: TextStyle(
                          fontWeight: .bold,
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "${data.length} Tasks",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    height: 500,

                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return CustomTodoItem(todoItem: data[index]);
                      },
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    "Add Task",
                    style: TextStyle(color: Colors.teal, fontWeight: .bold),
                  ),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: "Todo or not todo?"),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    onPressed: () {
                      provider.RequestCreateItem(title: titleController.text);
                    },

                    child: Text("Add", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
