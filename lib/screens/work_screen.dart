import 'package:flutter/material.dart';

class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  List task = [1, 2, 3, 4, 5, 6, 7, 8];
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
            return ListTile(
              title: Text("${task[index]}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  task.removeAt(index);
                  setState(() {});
                },
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
}
