class UiState {
  final bool isLoading;
  final bool hasError;
  final bool isRefreshing;
  final bool isFetchingMore;
  final bool hasAll;

  UiState({
    required this.isLoading,
    required this.hasError,
    required this.isRefreshing,
    required this.isFetchingMore,
    required this.hasAll,
  });

  factory UiState.loading() {
    return UiState(
      isLoading: true,
      hasError: false,
      isRefreshing: false,
      isFetchingMore: false,
      hasAll: false,
    );
  }

  factory UiState.loaded() {
    return UiState(
      isLoading: false,
      hasError: false,
      isRefreshing: false,
      isFetchingMore: false,
      hasAll: false,
    );
  }

  factory UiState.error() {
    return UiState(
      isLoading: false,
      hasError: true,
      isRefreshing: false,
      isFetchingMore: false,
      hasAll: false,

    );
  }

  factory UiState.refreshing() {
    return UiState(
      isLoading: false,
      hasError: false,
      isRefreshing: true,
      isFetchingMore: false,
      hasAll: false,

    );
  }

  factory UiState.fetchingMore() {
    return UiState(
      isLoading: false,
      hasError: false,
      isRefreshing: false,
      isFetchingMore: true,
      hasAll: false,

    );
  }

  factory UiState.hasAll() {
    return UiState(
      isLoading: false,
      hasError: false,
      isRefreshing: false,
      isFetchingMore: false,
      hasAll: true,
    );
  }
}
