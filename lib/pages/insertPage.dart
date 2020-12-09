import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/stores/controller.dart';

import 'initialPage.dart';

class InsertPage extends StatelessWidget {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insira uma pessoa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                labelText: 'Nome'),
          ),
          RaisedButton(
              child: Text("Salvar"),
              onPressed: () {
                Get.find<PresenceController>()
                    .listEntry
                    .add(nameController.text);
                nameController.text = "";
                Get.to(InitialPage());
              })
        ],
      ),
    );
  }
}
