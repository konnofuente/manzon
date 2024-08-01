import 'package:manzon/domain/entities/export_domain_entities.dart';
import 'package:manzon/infrastructure/models/export_infrastruture_models.dart';

class MemberMapper {
  // Convert Entity to Model
  static MemberModel toModel(MemberEntity entity) {
    return MemberModel(
      id: entity.id,
      name: entity.name,
      role: entity.role,
      userId: entity.userId,
      phoneNumber: entity.phoneNumber, // Map phoneNumber from Entity to Model
    );
  }

  // Convert Model to Entity
  static MemberEntity toEntity(MemberModel model) {
    return MemberEntity(
      id: model.id,
      name: model.name,
      role: model.role,
      userId: model.userId,
      phoneNumber: model.phoneNumber, // Map phoneNumber from Model to Entity
    );
  }
}
