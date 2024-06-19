import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';

class EditTaskScreen extends StatefulWidget {
  final int taskIndex;
  final String taskName;
  final String dueDate;

  EditTaskScreen({required this.taskIndex, required this.taskName, required this.dueDate});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _taskController;
  late TextEditingController _dueDateController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.taskName);
    _dueDateController = TextEditingController(text: widget.dueDate);
  }

  @override
  void dispose() {
    _taskController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar tarea'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/fondo.jpeg'), // Reemplaza con tu imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _dueDateController,
                  decoration: InputDecoration(
                    labelText: 'Fecha (YYYY-MM-DD)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final name = _taskController.text;
                    final dueDate = _dueDateController.text;
                    if (name.isNotEmpty && dueDate.isNotEmpty) {
                      taskProvider.updateTask(widget.taskIndex, name, dueDate);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Cargar cambios'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
