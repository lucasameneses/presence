import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence/stores/controller.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = Get.find<PresenceController>().listEntry;
    return Container(
      child:ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                background: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment(0.9, 0.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                direction: DismissDirection.endToStart,
                child: Card(
                  child: ListTile(
                    title: Text(list[index]),
                  ),
                ),
                //Função para excluir Equipamento
                onDismissed: (direction) {
                  print(TimeOfDay.now().hour);
                  print(TimeOfDay.now().minute);
                  Get.find<PresenceController>().listExit.add(list[index]);
                  list.remove(list[index]);
                },
              );
            },
          ),
    );
  }
}