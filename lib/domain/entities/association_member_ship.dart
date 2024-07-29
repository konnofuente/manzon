import 'package:manzon/domain/entities/enums/role_enum.dart';

class AssociationMembership {
  final String associationId;
  final Role role;

  AssociationMembership({required this.associationId, required this.role});

  factory AssociationMembership.fromJson(Map<String, dynamic> json) {
    return AssociationMembership(
      associationId: json['associationId'],
      role: Role.values.firstWhere((r) => r.toString() == 'Role.${json['role']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'associationId': associationId,
      'role': role.toString().split('.').last,
    };
  }
}
