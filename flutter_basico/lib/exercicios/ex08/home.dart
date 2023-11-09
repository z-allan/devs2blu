import 'package:flutter/material.dart';

class MyToDoList extends StatefulWidget {
  const MyToDoList({super.key});

  @override
  State<MyToDoList> createState() => _MyToDoListState();
}

class _MyToDoListState extends State<MyToDoList> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _task = TextEditingController();
  final List<TaskModel> _taskList = [TaskModel(task: 'Teste de tarefa')];

  Widget _buildTasktTile(int index) {
    TextStyle? changeStyle;

    if (_taskList[index].checked) {
      changeStyle = const TextStyle(
          color: Color.fromARGB(255, 177, 177, 177),
          decoration: TextDecoration.lineThrough);
    }

    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: _taskList[index].checked,
        onChanged: (value) {
          setState(() {
            _taskList[index].checked = value!;
          });
        },
        title: Text(_taskList[index].task, style: changeStyle));
  }

  @override
  Widget build(BuildContext context) {
    void addTask() {
      setState(() {
        _taskList.add(TaskModel(task: _task.text));
        _task.clear();
      });
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tarefas')),
      body: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: _task,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo tarefa não pode ser vazio';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Tarefa',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addTask();
                            }
                          },
                          icon: const Icon(Icons.save)),
                    )),
              ),
              Expanded(
                child: ListView.builder(
                    //scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    itemCount: _taskList.length,
                    itemBuilder: (context, index) {
                      return _buildTasktTile(index);
                    }),
              )
            ],
          )),
    );
  }
}

class TaskModel {
  late String task;
  late bool checked;

  TaskModel({required this.task, this.checked = false});
}
