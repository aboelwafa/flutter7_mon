// ignore_for_file: file_names

class ChangeFavoritesModel
{
  late bool status;
  String? message;

  ChangeFavoritesModel.fromjson(Map<String,dynamic>json)
  {
    status=json['status'];
    message=json['message'];
  }
}