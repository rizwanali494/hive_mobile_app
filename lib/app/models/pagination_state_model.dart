class PaginationState {
  final bool isLastPage;
  final bool isGettingMore;

  PaginationState({
    required this.isLastPage,
    required this.isGettingMore,
  });

  factory PaginationState.GettingMore() {
    return PaginationState(
      isLastPage: false,
      isGettingMore: true,
    );
  }

  factory PaginationState.LastPage() {
    return PaginationState(
      isLastPage: true,
      isGettingMore: false,
    );
  }

  factory PaginationState.Loaded() {
    return PaginationState(
      isLastPage: false,
      isGettingMore: false,
    );
  }
}
