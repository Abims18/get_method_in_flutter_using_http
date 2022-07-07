class Users {
  final int page;
  final int per_page;
  final int total;
  final int tot_pages;

  final List<dynamic> data;
  final int id;
  final String? email;
  final String? first_name;
  final String? last_name;
  final String? avatar;

  const Users({
    required this.page,
    required this.per_page,
    required this.total,
    required this.tot_pages,

    required this.data,
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      page: json['page'],
      per_page: json['per_page'],
      total: json['total'],
      tot_pages: json['total_pages'],

      data: json['data'],
      id: json['data']['id'],
      email: json['data']['email'],
      first_name: json['data']['first_name'],
      last_name: json['data']['last_name'],
      avatar: json['data']['avatar'],
    );
  }
}