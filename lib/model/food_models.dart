class Food {
  String? status;
  String? message;
  List<Data>? data;

  Food({this.status, this.message, this.data});

  Food.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? title;
  String? price;
  String? image;

  Data({this.title, this.price, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    image = json['image'];
  }

}


