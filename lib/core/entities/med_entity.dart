import 'package:equatable/equatable.dart';

class MedEntity extends Equatable {
  final String id;
  final String name;

  const MedEntity({required this.id, required this.name});

  @override

  List<Object?> get props => [id, name];
}
