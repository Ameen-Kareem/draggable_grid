part of 'image_grid_bloc.dart';

class ImageGridEvent {}

class LoadImagesEvent extends ImageGridEvent {}

class ReorderImageEvent extends ImageGridEvent {
  final int oldIndex;
  final int newIndex;

  ReorderImageEvent(this.oldIndex, this.newIndex);
}
