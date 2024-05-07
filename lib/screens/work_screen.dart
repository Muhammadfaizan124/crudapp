import 'package:flutter/material.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  List task = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView.builder(
          itemCount: task.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showTaskDetailsDialog(task[index], "");
              },
              child: ListTile(
                title: Text("${task[index]}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        task.removeAt(index);
                        setState(() {});
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        task.removeAt(index);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            "+",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                      title: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "name",
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      children: [
                        TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "description"),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                nameController.clear();
                                descriptionController.clear();
                              },
                              child: const Text("close"),
                            ),
                            TextButton(
                              child: const Text("Add"),
                              onPressed: () {
                                task.add(nameController.text);
                                nameController.clear();
                                descriptionController.clear();
                                Navigator.of(context).pop();
                                setState(() {});
                              },
                            )
                          ],
                        ),
                      ],
                    ));
          },
        ),
      ),
    );
  }

//this function is for view the details.
  void showTaskDetailsDialog(name, description) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(name),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
