
// ignore_for_file: camel_case_types, unused_import

import 'package:market/models/Shop_App/change_Favorites_model.dart';

abstract class shopStates{}
 class shopIntialState extends shopStates{}

   class shopBottomNavState extends shopStates{}

  class shopLoadingHomeState extends shopStates{}

   class shopSuccessHomeState extends shopStates{}
  
    class shopErrorHomeState extends shopStates{

      final String error;

       shopErrorHomeState(this.error);
    }
    // state GetCategory
     class shopSuccessCategoryState extends shopStates{}

   class shopErrorCategoryState extends shopStates{}
class shopChangeFavoritesState extends shopStates{}

class shopSuccessChangeFavoritesState extends shopStates{

}

class shopErrorChangeFavoritesState extends shopStates{}

class shopLoadingGetFavoritesState extends shopStates{}

class shopSuccessGetFavoritesState extends shopStates{}

class shopErrorGetFavoritesState extends shopStates{}

class shopLoadingUserDataState extends shopStates{}

class shopSuccessUserDataState extends shopStates{}

class shopErrorUserDataState extends shopStates{}