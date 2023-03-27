class Selectable<T> {
  bool isSelected = false;
  T data;
  Selectable(this.data, this.isSelected);
}

class HomeSlider {
  int id;
  String image;
  String title;
  HomeSlider(this.id, this.image, this.title);
}
