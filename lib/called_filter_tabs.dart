import 'package:menu_functions_simcards/api_sort.dart';

class CalledFilterTabs {
  Map<String, String> status = {
    'type': 'INCLUDE',
  };

  CalledFilterTabs(this.status);

  dynamic variable(ApiSort sort) {
    return {
      "orderBy": {"field": sort.name, "sort": sort.direction},
      "pagination": {"size": sort.limit, "page": sort.page},
      "status": status,
    };
  }

  @override
  String toString() {
    return 'Instance of CalledFilterTabs(status:$status)';
  }
}
