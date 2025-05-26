import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String bookId;
  final String name;
  final String author;
  final String type;
  final String description;
  final String rate;
  final String image;
  final String file;
  final String audio;

  const BookModel({
    required this.bookId,
    required this.name,
    required this.author,
    required this.type,
    required this.description,
    required this.rate,
    required this.image,
    required this.file,
    required this.audio,
  });

  const BookModel.initial()
      : this(
          bookId: '',
          name: '',
          author: '',
          type: '',
          description: '',
          rate: '',
          image: '',
          file: '',
          audio: '',
        );

  BookModel copyWith({
    String? bookId,
    String? name,
    String? author,
    String? type,
    String? description,
    String? rate,
    String? image,
    String? file,
    String? audio,
  }) =>
      BookModel(
        bookId: bookId ?? this.bookId,
        name: name ?? this.name,
        author: author ?? this.author,
        type: type ?? this.type,
        description: description ?? this.description,
        rate: rate ?? this.rate,
        image: image ?? this.image,
        file: file ?? this.file,
        audio: audio ?? this.audio,
      );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        bookId: json['bookId'] as String? ?? '',
        name: json['name'] as String? ?? '',
        author: json['author'] as String? ?? '',
        type: json['type'] as String? ?? '',
        description: json['description'] as String? ?? '',
        rate: json['rate'] as String? ?? '',
        image: json['image'] as String? ?? '',
        file: json['file'] as String? ?? '',
        audio: json['audio'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'bookId': bookId,
        'name': name,
        'author': author,
        'type': type,
        'description': description,
        'rate': rate,
        'image': image,
        'file': file,
        'audio': audio
      };

  @override
  List<Object?> get props => [
        bookId,
        name,
        author,
        type,
        description,
        rate,
        image,
        file,
        audio,
      ];
}
