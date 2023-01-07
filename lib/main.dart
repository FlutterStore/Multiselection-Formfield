// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List? _myActivities;
  late String _myActivitiesResult;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
  }

  _saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('MultiSelect Formfield',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: MultiSelectFormField(
                autovalidate: AutovalidateMode.disabled,
                chipBackGroundColor: Colors.red,
                chipLabelStyle: const TextStyle(fontWeight: FontWeight.normal, color: Colors.white,fontSize: 15),
                dialogTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                checkBoxActiveColor: Colors.red,
                checkBoxCheckColor: Colors.white,
                fillColor: Colors.green.withOpacity(0.4),
                dialogShapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                title: const Text(
                  "My workouts",
                  style: TextStyle(fontSize: 20,),
                ),
                validator: (value) {
                  if (value == null || value.length == 0) {
                    return 'Please select one or more options';
                  }
                  return null;
                },
                dataSource: const [
                  {
                    "display": "Apple",
                    "value": "Apple",
                  },
                  {
                    "display": "Mango",
                    "value": "Mango",
                  },
                  {
                    "display": "Orange",
                    "value": "Orange",
                  },
                  {
                    "display": "Chiku",
                    "value": "Chiku",
                  },
                  {
                    "display": "Strawberry",
                    "value": "Strawberry",
                  },
                  {
                    "display": "Banana",
                    "value": "Banana",
                  },
                  {
                    "display": "Elderberry",
                    "value": "Elderberry",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: const Text('Please choose one or more'),
                initialValue: _myActivities,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _myActivities = value;
                  });
                },
              ),
            ),
            InkWell(
              onTap: _saveForm,
              child: Container(
                height: 35,
                width: 120,
                alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(_myActivitiesResult),
            )
          ],
        ),
      ),
    );
  }
}