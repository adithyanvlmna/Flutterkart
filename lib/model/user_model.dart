class UserModel {
  final int userId;
  final int? shopId;
  final String email;
  final String phoneNumber;
  final String name;
  final String profileImage;
  final int userRole;
  final String gender;
  final int age;
  final dynamic roles;

  UserModel({
    required this.userId,
    this.shopId,
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.profileImage,
    required this.userRole,
    required this.gender,
    required this.age,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'] ?? 0,
      shopId: json['shop_id'],
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      name: json['name'] ?? '',
      profileImage: json['profile_image'] ?? '',
      userRole: json['user_role'] ?? 0,
      gender: json['gender'] ?? '',
      age: json['age'] ?? 0,
      roles: json['roles'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'shop_id': shopId,
      'email': email,
      'phone_number': phoneNumber,
      'name': name,
      'profile_image': profileImage,
      'user_role': userRole,
      'gender': gender,
      'age': age,
      'roles': roles,
    };
  }
}
