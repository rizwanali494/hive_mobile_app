extension ListSortingExtensions<T> on List<T> {
  void sortByRecentOrder({
    required DateTime Function(T item) getDateAdded,
  }) {
    sort(
      (a, b) {
        var time = getDateAdded(a);
        var time2 = getDateAdded(b);
        return time2.compareTo(time);
      },
    );
  }
}
