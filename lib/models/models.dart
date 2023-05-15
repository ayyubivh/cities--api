import 'dart:convert';

// City cityFromJson(String str) => City.fromJson(json.decode(str));

String cityToJson(City data) => json.encode(data.toJson());

class City {
  Response response;
  String result;
  bool showMessage;
  int status;

  City({
    required this.response,
    required this.result,
    required this.showMessage,
    required this.status,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        response: Response.fromJson(json["response"]),
        result: json["result"],
        showMessage: json["show_message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "response": response.toJson(),
        "result": result,
        "show_message": showMessage,
        "status": status,
      };
}

class Response {
  List<Detail> details;

  Response({
    required this.details,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  int id;
  District district;
  String name;
  bool status;
  bool popular;
  DateTime createdAt;
  DateTime updatedAt;

  Detail({
    required this.id,
    required this.district,
    required this.name,
    required this.status,
    required this.popular,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json["id"],
        district: District.fromJson(json["district"]),
        name: json["name"],
        status: json["status"],
        popular: json["popular"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "district": district.toJson(),
        "name": name,
        "status": status,
        "popular": popular,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class District {
  int id;
  String name;
  State state;
  bool status;

  District({
    required this.id,
    required this.name,
    required this.state,
    required this.status,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        state: State.fromJson(json["state"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "state": state.toJson(),
        "status": status,
      };
}

class State {
  int id;
  Name name;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  State({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Name { KERALA, TAMIL_NADU }

final nameValues =
    EnumValues({"Kerala": Name.KERALA, "Tamil Nadu": Name.TAMIL_NADU});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
