import 'dart:collection';

class User {
  // Map of hash and url
  Map<String, String> likes = HashMap();
  Map<String, String> dislikes = HashMap();
  Map<String, String> bookmarks = HashMap();
  var loggedIn = false;
  bool isLiked(String postHash) {
    return likes.containsKey(postHash);
  }

  bool isDisliked(String postHash) {
    return dislikes.containsKey(postHash);
  }

  bool isBookmarked(String postHash) {
    return bookmarks.containsKey(postHash);
  }
}
