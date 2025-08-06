#  Draggable Image Grid (Flutter + BLoC)

This is a Flutter-based draggable 3x3 image grid built as part of a technical assessment for **Marinade-AI**. Users can drag and reposition square images in real time. The app is responsive and optimized for 60 FPS performance.

---

## 📱 Features

✅ 3x3 draggable image grid  
✅ Responsive layout  
✅ BLoC + Equatable architecture  
✅ Drag-and-drop with live tile swapping   
✅ Pre-cached images for smooth rendering


##  Folder Structure


lib/
├── blocs/
│   └── image_grid/
│       ├── image_grid_bloc.dart       # Core BLoC logic
│       ├── image_grid_event.dart      # BLoC Events
│       └── image_grid_state.dart      # BLoC States
│
├── model/
│   └── image_model.dart               # ImageTile data class (Equatable)
│
├── views/
│   └── home/
│       ├── home.dart                  # Main screen with GridView
│       └── widgets/
│           ├── tile_wrapper.dart      # DragTarget + Draggable wrapper
│
├── widgets/
│   └── custom_widgets.dart            # Common tile widget UI
│
└── main.dart                          # App entry point

## Getting Started

**1.Clone the repository**

    https://github.com/Ameen-Kareem/draggable_grid.git
    cd draggable_image_grid
