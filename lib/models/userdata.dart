class UserData {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  // Factory method to create UserData instance from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['tell'],
    );
  }
}