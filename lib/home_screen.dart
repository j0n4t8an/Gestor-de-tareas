import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_provider.dart';
import 'profile_screen.dart';
import 'edit_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    List<Widget> _pages = <Widget>[
      _buildTasksPage(taskProvider),
      ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Gestor de tareas'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Implementa aquí la lógica para cerrar sesión
              // En este ejemplo, simplemente navegamos de vuelta a LoginScreen
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
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
          Center(
            child: _pages.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tarea',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Fecha',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildTasksPage(TaskProvider taskProvider) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  labelText: 'Nombre de la tarea',
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
                    taskProvider.addTask(name, dueDate);
                    _taskController.clear();
                    _dueDateController.clear();
                  }
                },
                child: Text('Agregar'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(task['name']),
                  subtitle: Text('Due: ${task['due_date']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTaskScreen(
                                taskIndex: index,
                                taskName: task['name'],
                                dueDate: task['due_date'],
                              ),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          taskProvider.deleteTask(index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
