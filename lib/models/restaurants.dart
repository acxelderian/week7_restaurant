import 'dart:convert';

import 'package:restaurant/models/menus.dart';

class restaurant {
  List<Restaurants>? restaurants;

  restaurant({this.restaurants});

  restaurant.fromJson(Map<String, dynamic> json) {
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(new Restaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurants {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  // final Menus menus;

  Restaurants(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.pictureId,
        required this.city,
        required this.rating,
        // required this.menus
      });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
    id: json['id'],
    name : json['name'],
    description : json['description'],
    pictureId : json['pictureId'],
    city : json['city'],
    rating : json['rating'],
    // menus : Menus.fromJson(json['Menus'])
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['pictureId'] = this.pictureId;
    data['city'] = this.city;
    data['rating'] = this.rating;
    // if (this.menus != null) {
    //   data['menus'] = this.menus.toJson();
    // }
    return data;
  }
}
