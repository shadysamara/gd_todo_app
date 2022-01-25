class News {
  String title;
  String details;
  List<ImageSlider> images;
  News(this.title, this.details, this.images);
}

class ImageSlider {
  String imageUrl;
  String newsUrl;
}
