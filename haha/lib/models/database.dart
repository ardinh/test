class Favorite {
  final String? id;
  final String? favorite;

  const Favorite({
    this.id,
    this.favorite,
  });

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'favorite': favorite,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'db{id: $id, favorite: $favorite}';
  }
}
