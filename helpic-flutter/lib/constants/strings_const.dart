class Strings {
  Strings._();

  //General
  static const String appName = "Helpic";

  //Splash
  static const String website = "Helpic";

  //Home
  static const String downloadText = "Download";
  static const String addFavouritesText = "Adicionar aos favoritos.";
  static const String enterSearchText = "Pesquise algo especifico.";
  static const String searchText = "Pesquisa";

  //How To Use
  static const String goBackText = "Voiltar";

  //Search
  static const String noResults = "Sem resultados.";
  static const String searchHint = "Digite a sua pesquisa.";
  static const String images = "Imagens";
  static const String videos = "Videos";

  //Detail Page
  static const String commentsText = "Comentarios";
  static const String downloadsText = "Downloads";
  static const String likesText = "Likes";
  static const String downloadProfilePictureText = "Foto de perfil";
  static const String addToFavouriteText = "Adicionar aos favoritos";
  static const String removeFromFavouriteText = "Remover dos Favoritos";
  static const String favouritesText = "Favoritos";
  static const String viewAdText = "";
  static const String okText = "Ok";
  static const String cancelText = "Cancelar";
  static const String downloadedText = "Download efetuado!";
  static const String progressText = "Andamento:";

  //Get key https://pixabay.com/api/docs/
  static const String API_KEY = "11990318-dcf17d26f79864dd1e5099fba";

  //Base URL
  static const SEARCH_URL =
      "https://pixabay.com/api/?key=${API_KEY}&image_type=photo&pretty=true&safesearch=true&per_page=40&q=";

  static const SEARCH_VIDEOS_URL =
      "https://pixabay.com/api/videos/?key=${API_KEY}&video_type=film&safesearch=true&per_page=40&pretty=true&q=";

  static const FETCH_VIDEO_PREVIEW_URL = "https://i.vimeocdn.com/video/";
  static const IMAGE_PREVIEW_SIZE = "_200x150";

  //Errors
  static const String noInternet = "Opps! Sem internet. Conecte-se a uma rede mais próxima";
}
