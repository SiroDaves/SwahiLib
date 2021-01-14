import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}

final List<Category> categories = [
  Category(1,"Jumla", icon: FontAwesomeIcons.globeAfrica),
  Category(2,"Watu", icon: FontAwesomeIcons.peopleArrows),
  Category(3,"Wanyama", icon: FontAwesomeIcons.dog),
  Category(4,"Wadudu", icon: FontAwesomeIcons.fish),
  Category(5,"Mimea", icon: FontAwesomeIcons.tree),
  Category(6,"Chakula", icon: FontAwesomeIcons.cocktail),
  Category(7,"Muziki", icon: FontAwesomeIcons.music),
  Category(8,"Mahali", icon: FontAwesomeIcons.mosque),
  Category(9,"Michezo", icon: FontAwesomeIcons.footballBall),
  Category(10,"Teknolojia", icon: FontAwesomeIcons.mobileAlt),
  Category(15,"Kompyuta", icon: FontAwesomeIcons.laptopCode),
  Category(11,"Magari", icon: FontAwesomeIcons.carAlt),
  Category(12,"Hesabu", icon: FontAwesomeIcons.sortNumericDown),
  Category(13,"Jeografia", icon: FontAwesomeIcons.mountain),
  Category(14,"Sayansi", icon: FontAwesomeIcons.microscope),
  Category(16,"Sanaa", icon: FontAwesomeIcons.paintBrush),
  Category(17,"Fanicha", icon: FontAwesomeIcons.table),
  Category(18,"Mavazi", icon: FontAwesomeIcons.umbrella),
  Category(19,"Magonjwa", icon: FontAwesomeIcons.diagnoses),
  Category(20,"Tabia", icon: FontAwesomeIcons.walking),
  Category(21,"Hali ya Anga", icon: FontAwesomeIcons.rainbow),
  Category(22,"Misimu", icon: FontAwesomeIcons.water),
];