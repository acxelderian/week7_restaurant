import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/models/restaurants.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);
  static const routeName= '/restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant App"),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurants> restaurants = parseRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
                return buildItem(context, restaurants[index]);
            }
            );
        }
      )
    );
  }
}

List<Restaurants> parseRestaurants(String? json) {
  if(json == null) {
    return [];
  }
  final List parsed = jsonDecode(json)["restaurants"];
  return parsed.map((json) => Restaurants.fromJson(json)).toList();
}

Widget buildItem(BuildContext context, Restaurants restaurant) {
  return ListTile(
    leading: Image.network(restaurant.pictureId),
    title: Text(restaurant.name),
    subtitle: Text(restaurant.description),
  );
}
