class Products {
  final int id;
  final String description;
  final String libelle;
  final double prix;
  final int quantite;

  Products.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        description = json['description'] ?? '',
        libelle = json['libelle'] ?? '',
        prix = json['prix'] ?? '',
        quantite = json['quantite'] ?? '';
}
