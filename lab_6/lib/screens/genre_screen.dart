import 'package:flutter/material.dart';

import '../data/movie_data.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import '../widgets/genre_chip_section.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = '';
  String selectedSort = 'A-Z';

  final Set<String> selectedGenres = {};

  final List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
    'Sci-Fi',
    'Adventure',
    'Animation',
  ];

  List<Movie> getVisibleMovies() {
    List<Movie> visibleMovies = allMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      final matchesGenre =
          selectedGenres.isEmpty ||
          movie.genres.any((genre) => selectedGenres.contains(genre));

      return matchesSearch && matchesGenre;
    }).toList();

    switch (selectedSort) {
      case 'A-Z':
        visibleMovies.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Z-A':
        visibleMovies.sort((a, b) => b.title.compareTo(a.title));
        break;

      case 'Year':
        visibleMovies.sort((a, b) => b.year.compareTo(a.year));
        break;

      case 'Rating':
        visibleMovies.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }

    return visibleMovies;
  }

  void toggleGenre(String genre) {
    setState(() {
      if (selectedGenres.contains(genre)) {
        selectedGenres.remove(genre);
      } else {
        selectedGenres.add(genre);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movies = getVisibleMovies();

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Browser')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find a Movie',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search movie...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              GenreChipSection(
                genres: genres,
                selectedGenres: selectedGenres,
                onGenreToggle: toggleGenre,
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  const Text(
                    'Sort By:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 12),
                  DropdownButton<String>(
                    value: selectedSort,
                    items: const [
                      DropdownMenuItem(value: 'A-Z', child: Text('A-Z')),
                      DropdownMenuItem(value: 'Z-A', child: Text('Z-A')),
                      DropdownMenuItem(value: 'Year', child: Text('Year')),
                      DropdownMenuItem(value: 'Rating', child: Text('Rating')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedSort = value;
                        });
                      }
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      return ListView.builder(
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(movie: movies[index]);
                        },
                      );
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 2.2,
                      children: movies.map((movie) {
                        return MovieCard(movie: movie);
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
