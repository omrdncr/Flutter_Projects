// ignore_for_file: public_member_api_docs, sort_constructors_first

//servis sınıfı best practice
class PostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}

//buradan türetilmiş bir veriyi ekrana basarken Text(user8.body ?? 'Veri yok')
//model sınıfı içerisinden bir veri değiştireceksen user8 = user8.copyWith(title:'Flutter App');
