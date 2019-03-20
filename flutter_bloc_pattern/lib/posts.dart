
class Post {
  int id;
  String title;
  String imageUrl;
  String link;
  String content;

  Post(this.id, this.title, this.imageUrl, this.link, this.content);

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        json['id'],
        json['title']['rendered'],
        json["jetpack_featured_media_url"],
        json["link"],
        json['excerpt']['rendered']);
  }
}