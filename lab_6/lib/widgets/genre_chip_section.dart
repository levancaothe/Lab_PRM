import 'package:flutter/material.dart';

class GenreChipSection extends StatelessWidget {
  final List<String> genres;
  final Set<String> selectedGenres;
  final ValueChanged<String> onGenreToggle;

  const GenreChipSection({
    super.key,
    required this.genres,
    required this.selectedGenres,
    required this.onGenreToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres.map((genre) {
        final isSelected = selectedGenres.contains(genre);

        return FilterChip(
          label: Text(genre),
          selected: isSelected,
          selectedColor: Colors.indigo.shade100,
          checkmarkColor: Colors.indigo,
          onSelected: (_) {
            onGenreToggle(genre);
          },
        );
      }).toList(),
    );
  }
}