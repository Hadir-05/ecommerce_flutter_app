class Users {
  final int id;
  final String email;
  final bool admin;
  final String identifiant;
  final String telephone;
  final String nom;
  final String prenom;
  final String password;

  Users.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        email = json['email'] ?? '',
        admin = json['admin'] ?? false,
        identifiant = json['identifiant'] ?? '',
        telephone = json['telephone'] ?? '',
        nom = json['nom'] ?? '',
        prenom = json['prenom'] ?? '',
        password = json['pw'] ?? '';
}
