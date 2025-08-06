import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class ImageTile extends Equatable {
  final String imagePath;
  final int id;

  const ImageTile({required this.imagePath, required this.id});
  @override
  List<Object> get props => [imagePath, id];
}
