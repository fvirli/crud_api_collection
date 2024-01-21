// ignore_for_file: avoid_print

import 'package:crud_api_collect/domain/entities/target.dart';

class TargetModel extends Target {
  TargetModel({
    required String id,
    required String name,
    required double amount,
    required DateTime targetTime,
    required String description,
  }) : super(
          id: id,
          name: name,
          amount: amount,
          targetTime: targetTime,
          description: description,
        );

  factory TargetModel.fromJson(Map<String, dynamic> json) {
    return TargetModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      amount: json['amount']?.toDouble() ?? 0.0, // convert to double
      targetTime: DateTime.parse(json['targetTime'] ?? ''),
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'targetTime': targetTime.toIso8601String(),
      'description': description,
    };
  }

  // Method to convert Target to TargetModel
  factory TargetModel.fromTarget(Target target) {
    return TargetModel(
      id: target.id,
      name: target.name,
      amount: target.amount,
      targetTime: target.targetTime,
      description: target.description,
    );
  }
}

// Usage example
void someFunction(TargetModel targetModel) {
  // Do something with targetModel
  print('Target ID: ${targetModel.id}');
  print('Target Name: ${targetModel.name}');
  print('Target Amount: ${targetModel.amount}');
  print('Target Time: ${targetModel.targetTime}');
  print('Target Description: ${targetModel.description}');
}

void main() {
  Target target = Target(
    id: '1',
    name: 'Target 1',
    amount: 1,
    targetTime: DateTime.now(),
    description: 'This is target 1',
  );

  // Convert Target to TargetModel
  TargetModel targetModel = TargetModel.fromTarget(target);

  // Call someFunction with TargetModel
  someFunction(targetModel);
}
