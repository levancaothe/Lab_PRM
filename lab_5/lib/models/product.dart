class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final double rating;
  final List<String> genres;
  final List<String> trailers;

  Movie({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.genres,
    required this.trailers,
  });
}