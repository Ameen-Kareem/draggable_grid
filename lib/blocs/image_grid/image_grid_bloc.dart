import 'package:bloc/bloc.dart';
import 'package:draggable_grid/model/image_model.dart';
import 'package:meta/meta.dart';

part 'image_grid_event.dart';
part 'image_grid_state.dart';

class ImageGridBloc extends Bloc<ImageGridEvent, ImageGridState> {
  ImageGridBloc() : super(ImageGridInitial()) {
    on<LoadImagesEvent>((event, emit) {
      emit(LoadingState());
      final tiles = List.generate(
        9,
        (index) =>
            ImageTile(imagePath: 'assets/images/${index + 1}.jpg', id: index),
      );
      emit(ImageGridLoaded(tiles));
    });

    on<ReorderImageEvent>((event, emit) {
      if (state is ImageGridLoaded) {
        final currentState = state as ImageGridLoaded;
        final tiles = List<ImageTile>.from(currentState.tiles);

        if (event.oldIndex != event.newIndex &&
            event.oldIndex >= 0 &&
            event.newIndex >= 0 &&
            event.oldIndex < tiles.length &&
            event.newIndex < tiles.length) {
          final temp = tiles[event.oldIndex];
          tiles[event.oldIndex] = tiles[event.newIndex];
          tiles[event.newIndex] = temp;
        }

        emit(ImageGridLoaded(tiles));
      }
    });
  }
}
