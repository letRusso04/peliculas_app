import 'package:flutter/material.dart';
import 'package:peliculas_app/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  const MovieSlider({super.key, required this.movies, this.title});
  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: 290,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title!.length >= 1)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder:
                  (_, int index) => _MoviePoster(moviesPath: movies[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie moviesPath;
  const _MoviePoster({required this.moviesPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap:
                () => Navigator.pushNamed(
                  context,
                  'details',
                  arguments: 'movie-arg',
                ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(moviesPath.PosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            moviesPath.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
