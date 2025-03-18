import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas Populares'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_off_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            MovieSlider(
              movies: moviesProvider.onDisplayPopular,
              title: 'Populares',
            ),
          ],
        ),
      ),
    );
  }
}
