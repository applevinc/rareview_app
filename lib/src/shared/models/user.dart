class UserProfile {
  final String id;
  final String name;
  final String email;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
  });

  UserProfile copyWith({String? name, String? email}) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
