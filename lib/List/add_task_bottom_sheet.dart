import 'package:flutter/material.dart';

class add_task_bottom_sheet extends StatefulWidget {
  @override
  State<add_task_bottom_sheet> createState() => _add_task_bottom_sheetState();
}

class _add_task_bottom_sheetState extends State<add_task_bottom_sheet> {
  var formKey = GlobalKey<FormState>(); //الكي بتاع الفاليديشن بتاع الفورم
  DateTime selectedData =
      DateTime.now(); //فاريبل علشان اعرف احطه في التيكست ويتغير
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Task",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Form(
              key:
                  formKey, ////الكي بتاع الفاليديشن بتاع الفورم دا علشان اوصل ل اي حاجة جوا للفورم اللي انا فيها
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Task Title ';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Task Title",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Task Description ';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Task Description",
                      ),
                      maxLines: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Select Date ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  InkWell(
                      onTap: ShowCalender,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${selectedData.day}/${selectedData.month}/${selectedData.year}',
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //add task to firebase
                        addTask();
                      },
                      child: Text(
                        'Add',
                        style: Theme.of(context).textTheme.titleLarge,
                      ))
                ],
              ))
        ],
      ),
    );
  }

// دا للتاريخ اني اختاره ويبقي موجود ويطلع
  void ShowCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedData = chosenDate;
      setState(() {});
    }
  }

  /// دا علشان لما ادوس تتسيف في الفايربيز
  void addTask() {
    if (formKey.currentState?.validate() == true) {
      ///add task to firebase
    }
  }
}
