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

  static const Map<String, int> categoryToIdMap = <String, int>{
    "Any category": -1,
    "General Knowledge": 9,
    "Entertainment: Books": 10,
    "Entertainment: Film": 11,
    "Entertainment: Music": 12,
    "Entertainment: Musicals & Theatres": 13,
    "Entertainment: Television": 14,
    "Entertainment: Video Games": 15,
    "Entertainment: Board Games": 16,
    "Science & Nature": 17,
    "Science: Computers": 18,
    "Sciente: Mathematics": 19,
    "Mythology": 20,
    "Sports": 21,
    "Geography": 22,
    "History": 23,
    "Politics": 24,
    "Art": 25,
    "Celebrities": 26,
    "Animals": 27,
    "Vehicles": 28,
    "Entertainment: Comics": 29,
    "Science: Gadgets": 30,
    "Entertainment: Japanese Anime & Manga": 31,
    "Entertainment: Cartoon & Animations": 32,
  };
}
