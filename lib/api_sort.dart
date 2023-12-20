class ApiSort {
  String direction;
  String name;
  int limit;
  int page;

  ApiSort({
    this.direction = 'DESC',
    this.limit = 100,
    this.name = '_id',
    this.page = 1,
  });

  dynamic get data {
    return {
      "orderBy": {"field": name, "sort": direction},
      "pagination": {"size": limit, "page": page}
    };
  }
}
