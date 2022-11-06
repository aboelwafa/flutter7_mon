// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/layout/Shop_App/cubit/cubit.dart';
import 'package:market/models/Shop_App/Favorites_model.dart';
import 'package:market/shared/Components/components.dart';
import 'package:market/shared/style/colors.dart';

import '../../layout/Shop_App/cubit/states.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return  BlocConsumer<ShopCubit,shopStates>
        (
        listener: (context, state) {},
        builder: (context, state) {
          return
            ConditionalBuilder(
              condition: ShopCubit.get(context).favoritesModel.data != null,
              builder:(context) =>  ListView.separated(
                  itemBuilder: (context, index) => buildFavItem(ShopCubit.get(context).favoritesModel.data!.data![index],context),
                  separatorBuilder:(context, index) =>mydivider()  ,
                  itemCount:ShopCubit.get(context).favoritesModel.data!.data!.length,
              ),
              fallback: (context) =>  Center(child: CircularProgressIndicator()),
            );
        },


      ) ;
  }
  Widget buildFavItem(FavoritesData model,context)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      height: 120.0,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${model.product!.image}'),
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,

              ),
              if(model.product!.discount!=0)
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('DISCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 20.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  '${model.product!.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      model.product!.price.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: defaultColor,
                      ),

                    ),
                    SizedBox(width: 5.0,),
                    if(model.product!.discount!=0)
                      Text(
                        model.product!.oldPrice.toString(),
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough

                        ),

                      ),
                    Spacer(),
                    IconButton(

                        icon:CircleAvatar(
                          radius: 20.0,
                          backgroundColor: ShopCubit.get(context).favorites[model.product!.id]! ?defaultColor :Colors.grey ,
                          // backgroundColor: Colors.deepPurpleAccent,
                          child: Icon(
                            Icons.favorite_border,
                            size: 18.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: (){
                            ShopCubit.get(context).changeFavorites(model.product!.id);
                          // print(token);
                        }
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}