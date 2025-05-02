import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String bookId;
  final String name;
  final String type;
  final String description;
  final String rate;
  final String image;

  const BookModel({
    required this.bookId,
    required this.name,
    required this.type,
    required this.description,
    required this.rate,
    required this.image,
  });

  const BookModel.initial()
      : this(
          bookId: '',
          name: '',
          type: '',
          description: '',
          rate: '',
          image: '',
        );

  BookModel copyWith({
    String? bookId,
    String? name,
    String? type,
    String? description,
    String? rate,
    String? image,
  }) =>
      BookModel(
        bookId: bookId ?? this.bookId,
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        rate: rate ?? this.rate,
        image: image ?? this.image,
      );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        bookId: json['bookId'] as String? ?? '',
        name: json['name'] as String? ?? '',
        type: json['type'] as String? ?? '',
        description: json['description'] as String? ?? '',
        rate: json['rate'] as String? ?? '',
        image: json['image'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'bookId': bookId,
        'name': name,
        'type': type,
        'description': description,
        'rate': rate,
        'image': image
      };

  @override
  List<Object?> get props => [
        bookId,
        name,
        type,
        description,
        rate,
        image,
      ];
}
