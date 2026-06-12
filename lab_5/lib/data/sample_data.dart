import '../models/movie.dart';

final List<Movie> movies = [
  Movie(
    id: 1,
    title: "Dune: Part Two",
    imageUrl: "https://thfvnext.bing.com/th/id/OIP.Z9N_NakLUDzF_9mnYkdGXAHaEK?r=0&o=7&cb=thfvnextfalcon2rm=3&rs=1&pid=ImgDetMain&o=7&rm=3",
    description:
        "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.",
    rating: 8.6,
    genres: ["Sci-Fi", "Adventure", "Drama"],
    trailers: ["Official Trailer #1", "IMAX Sneak Peek"],
  ),
  Movie(
    id: 2,
    title: "Deadpool & Wolverine",
    imageUrl: "https://tse2.mm.bing.net/th/id/OIP.3pmEAeXUZynmPOQlPBrsXgHaEK?r=0&cb=thfvnextfalcon2&rs=1&pid=ImgDetMain&o=7&rm=3",
    description:
        "The Merc with a Mouth teams up with the Adamantium claws for an action-packed adventure.",
    rating: 8.3,
    genres: ["Action", "Comedy"],
    trailers: ["Official Trailer", "Behind the Scenes"],
  ),
];