// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserRequest {
  final String userId;
  final String password;

  UserRequest({required this.userId, required this.password});

  UserRequest copyWith({
    String? userId,
    String? password,
  }) {
    return UserRequest(
      userId: userId ?? this.userId,
      password: password ?? this.password,
    );
  }
}
