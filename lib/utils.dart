String imageChecker(imgUrl) {
  if (imgUrl == "") {
    return "https://via.placeholder.com/150";
  }

  if (imgUrl == '"https://placeimg.com/640/480/any"') {
    return "https://placeimg.com/640/480/any";
  }

  if (imgUrl == null) {
    return "https://via.placeholder.com/150";
  }

  return imgUrl;
}
