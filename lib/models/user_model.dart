
class User {
    int id;
    String firstName;
    String lastName;
    String email;
    String username;
    dynamic avatar;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.username,
        required this.avatar,
    });

    factory User.fromJson(Map json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        username: json["username"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "username": username,
        "avatar": avatar,
    };
}
