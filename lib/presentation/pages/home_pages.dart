// ignore_for_file: prefer_const_constructors

import 'package:crud_api_collect/data/models/target.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crud_api_collect/domain/entities/target.dart';
import 'package:crud_api_collect/presentation/controllers/target_controller.dart';

class HomePage extends StatelessWidget {
  final TargetController targetController = Get.find();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController targetTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection Target'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Target Name'),
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: targetTimeController,
              decoration: InputDecoration(labelText: 'Target Time'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    TargetModel newTarget = TargetModel(
                      id: '1', // Sesuaikan dengan logika yang sesuai
                      name: nameController.text,
                      amount: double.parse(amountController.text),
                      targetTime: DateTime.parse(targetTimeController.text),
                      description: descriptionController.text,
                    );
                    await targetController.addTarget(newTarget);
                  },
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (targetController.targets.isNotEmpty) {
                      // Ambil target yang ingin diupdate dari daftar
                      Target targetToUpdate = targetController.targets[0];

                      // Update nilai-nilai sesuai dengan input
                      targetToUpdate.name = nameController.text;
                      targetToUpdate.amount =
                          double.parse(amountController.text);
                      targetToUpdate.targetTime =
                          DateTime.parse(targetTimeController.text);
                      targetToUpdate.description = descriptionController.text;

                      await targetController.updateTarget(targetToUpdate);
                    }
                  },
                  child: Text('Update'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (targetController.targets.isNotEmpty) {
                      // Ambil ID target yang ingin dihapus dari daftar
                      String targetIdToDelete = targetController.targets[0].id;

                      await targetController.deleteTarget(targetIdToDelete);
                    }
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await targetController.fetchTargets();
              },
              child: Text('Read Targets'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(
                () {
                  return ListView.builder(
                    itemCount: targetController.targets.length,
                    itemBuilder: (context, index) {
                      Target target = targetController.targets[index];
                      return ListTile(
                        title: Text(target.name),
                        subtitle: Text(target.description),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
