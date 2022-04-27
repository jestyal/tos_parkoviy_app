import 'package:flutter/material.dart';
// import 'package:project1/constants.dart';

class Category {
  final String title;
  final String image;

  Category(this.title, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['image']))
    .toList();

List categoriesData = [
  {"name": "Дома", 'image': "assets/images/4.png"},
  {"name": "Мероприятия", 'image': "assets/images/1.png"},
  {"name": "Организации", 'image': "assets/images/2.png"},
  {"name": "Пространства", 'images': "assets/images/3.png"},
];
