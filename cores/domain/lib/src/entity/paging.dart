final class Paging {
  final int currentPage;
  final int totalPages;
  final int pageSize;

  const Paging({
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
  });
}
