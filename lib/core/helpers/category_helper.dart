import 'package:happiness_quiz/core/constants/image_path.dart';

class CategoryHelper implements Exception {
  static const List<String> allCategories = [
    "Any category",
    "General Knowledge",
    "Entertainment: Books",
    "Entertainment: Film",
    "Entertainment: Music",
    "Entertainment: Musicals & Theatres",
    "Entertainment: Television",
    "Entertainment: Video Games",
    "Entertainment: Board Games",
    "Science & Nature",
    "Science: Computers",
    "Sciente: Mathematics",
    "Mythology",
    "Sports",
    "Geography",
    "History",
    "Politics",
    "Art",
    "Celebrities",
    "Animals",
    "Vehicles",
    "Entertainment: Comics",
    "Science: Gadgets",
    "Entertainment: Japanese Anime & Manga",
    "Entertainment: Cartoon & Animations",
  ];

  static const Map<String, String> categoryToImagePathMap = <String, String>{
    "Any category": AppImages.randomIconPath,
    "General Knowledge": AppImages.generalKnowledgeIconPath,
    "Entertainment: Books": AppImages.booksIconPath,
    "Entertainment: Film": AppImages.filmIconPath,
    "Entertainment: Music": AppImages.musicIconPath,
    "Entertainment: Musicals & Theatres": AppImages.musicalsAndTheatresIconPath,
    "Entertainment: Television": AppImages.televisionIconPath,
    "Entertainment: Video Games": AppImages.videoGamesIconPath,
    "Entertainment: Board Games": AppImages.boardGamesIconPath,
    "Science & Nature": AppImages.natureIconPath,
    "Science: Computers": AppImages.computersIconPath,
    "Sciente: Mathematics": AppImages.mathIconPath,
    "Mythology": AppImages.mythologyIconPath,
    "Sports": AppImages.sportsIconPath,
    "Geography": AppImages.geographyIconPath,
    "History": AppImages.historyIconPath,
    "Politics": AppImages.politicsIconPath,
    "Art": AppImages.artIconPath,
    "Celebrities": AppImages.celebritiesIconPath,
    "Animals": AppImages.animalsIconPath,
    "Vehicles": AppImages.vehiclesIconPath,
    "Entertainment: Comics": AppImages.comicsIconPath,
    "Science: Gadgets": AppImages.gadgetsIconPath,
    "Entertainment: Japanese Anime & Manga": AppImages.animeIconPath,
    "Entertainment: Cartoon & Animations": AppImages.cartoonIconPath,
  };
}