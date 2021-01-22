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
  Category(5,"Ndege", icon: FontAwesomeIcons.fish),
  Category(6,"Mimea", icon: FontAwesomeIcons.tree),
  Category(7,"Chakula", icon: FontAwesomeIcons.cocktail),
  Category(8,"Vyombo", icon: FontAwesomeIcons.water),
  Category(9,"Mahali", icon: FontAwesomeIcons.mosque),
  Category(10,"Michezo", icon: FontAwesomeIcons.footballBall),
  Category(11,"Usafiri", icon: FontAwesomeIcons.carAlt),
  Category(12,"Hesabu", icon: FontAwesomeIcons.sortNumericDown),
  Category(13,"Jeografia", icon: FontAwesomeIcons.mountain),
  Category(14,"Sayansi", icon: FontAwesomeIcons.microscope),
  Category(15,"Afya", icon: FontAwesomeIcons.diagnoses),
  Category(16,"Sanaa", icon: FontAwesomeIcons.paintBrush),
  Category(17,"Vifaa", icon: FontAwesomeIcons.paintBrush),
  Category(18,"Mavazi", icon: FontAwesomeIcons.umbrella),
  Category(19,"Muziki", icon: FontAwesomeIcons.music),
  Category(20,"Tabia", icon: FontAwesomeIcons.walking),
  Category(21,"Matendo", icon: FontAwesomeIcons.walking),
  Category(22,"Hisia", icon: FontAwesomeIcons.laptopCode),
  Category(23,"Watoto", icon: FontAwesomeIcons.laptopCode),
  Category(24,"Teknolojia", icon: FontAwesomeIcons.mobileAlt),
  Category(25,"Kompyuta", icon: FontAwesomeIcons.laptopCode),
  Category(26,"Jamii", icon: FontAwesomeIcons.laptopCode),
  Category(27,"Salamu", icon: FontAwesomeIcons.laptopCode),
  Category(28,"Hali ya Anga", icon: FontAwesomeIcons.rainbow),
  Category(29,"Misimu", icon: FontAwesomeIcons.water),
  Category(30,"Sauti", icon: FontAwesomeIcons.water),
  Category(31,"Mwili", icon: FontAwesomeIcons.table),
  Category(32,"Fanicha", icon: FontAwesomeIcons.table),
];