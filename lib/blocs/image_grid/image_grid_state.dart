part of 'image_grid_bloc.dart';

class ImageGridState {}

final class ImageGridInitial extends ImageGridState {}

class ImageGridLoaded extends ImageGridState {
  final List<ImageTile> tiles;

  ImageGridLoaded(this.tiles);
}

class LoadingState extends ImageGridState {}
