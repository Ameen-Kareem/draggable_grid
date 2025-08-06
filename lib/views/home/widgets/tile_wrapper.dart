import 'package:draggable_grid/model/image_model.dart';
import 'package:flutter/material.dart';

class TileWrapper extends StatefulWidget {
  final int index;

  const TileWrapper({super.key, required this.index});

  @override
  State<TileWrapper> createState() => _TileWrapperState();
}

class _TileWrapperState extends State<TileWrapper> {
  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<int>(
      data: widget.index,
      feedback: Opacity(
        opacity: 0.8,
        child: _buildTile(tile, isDragging: true),
      ),
      childWhenDragging: Opacity(opacity: 0.3, child: _buildTile(tile)),
      onDragStarted: () => setState(() => isDragging = true),
      onDragEnd: (_) => setState(() => isDragging = false),
      child: _buildTile(tile),
    );
  }

  Widget _buildTile(ImageTile tile, {bool isDragging = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(tile.imagePath, fit: BoxFit.cover),
      ),
    );
  }
}
