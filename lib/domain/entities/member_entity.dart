import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  final String id;
  final String name;
  final String role; // Existing field for role
  final String userId; // Existing field for user ID
  final String phoneNumber; // New field for phone number

  MemberEntity({
    required this.id,
    required this.name,
    required this.role, // Initialize in the constructor
    required this.userId, // Initialize in the constructor
    required this.phoneNumber, // Initialize in the constructor
  });

  @override
  List<Object?> get props => [id, name, role, userId, phoneNumber];

  // JSON serialization
  factory MemberEntity.fromJson(Map<String, dynamic> json) {
    return MemberEntity(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      userId: json['userId'],
      phoneNumber: json['phoneNumber'], // Deserialize from JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'userId': userId,
      'phoneNumber': phoneNumber, // Serialize to JSON
    };
  }
}
