import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'task_dialog.dart';

class TaskManagerHome extends StatefulWidget {
  @override
  _TaskManagerHomeState createState() => _TaskManagerHomeState();
}

class _TaskManagerHomeState extends State<TaskManagerHome> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch tasks from Firestore
  Stream<QuerySnapshot> _getTasks() {
    return _firestore.collection('tasks').snapshots();
  }

  // Delete task
  Future<void> _deleteTask(String taskId) async {
    await _firestore.collection('tasks').doc(taskId).delete();
  }

  // Show task dialog for adding or editing
  void _showTaskDialog({String? taskId, String? title, String? description}) {
    showDialog(
      context: context,
      builder: (context) => TaskDialog(
        taskId: taskId,
        title: title,
        description: description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Manager')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _getTasks(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(task['title']),
                  subtitle: Text(task['description']),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _showTaskDialog(
                          taskId: task.id,
                          title: task['title'],
                          description: task['description'],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTask(task.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        child: Icon(Icons.add),
      ),
    );
  }
}
