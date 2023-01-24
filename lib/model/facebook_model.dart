class FaceBookModel {
  final String? name;
  final String? email;
  final String? id;

  FaceBookModel({this.name, this.email, this.id});

  factory FaceBookModel.fromJson(Map<String, dynamic> json) => FaceBookModel(
    email: json['email'],
    name: json['name'],
    id: json['id'],
  );
}