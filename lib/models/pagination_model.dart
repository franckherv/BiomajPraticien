


class PaginationModel{

  String nextPageUrl;
  int current;
  int pageCount;
  int lastPage;

  PaginationModel.fromJson(Map map):
        nextPageUrl = map['next_page_url'] != null ? map["next_page_url"] : null,
        pageCount = map['total'] != null ? map["total"] : null,
        lastPage = map['last_page'] != null ? map["last_page"] : null,
        current = map['current_page'] != null ? map["current_page"] : null;

}