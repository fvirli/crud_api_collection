import 'package:crud_api_collect/domain/entities/target.dart';
import 'package:crud_api_collect/domain/repositories/target_repository.dart';

class GetTargetsUseCase {
  final TargetRepository repository;

  GetTargetsUseCase({required this.repository});

  Future<List<Target>> execute() async {
    return await repository.getTargets();
  }
}
