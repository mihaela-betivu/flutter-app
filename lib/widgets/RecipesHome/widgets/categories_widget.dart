import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/RecipesHome/widgets/category_tag.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SizedBox(
        height: 31,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            SizedBox(width: 30),
            CategoryTag(label: 'All', selected: true),
            CategoryTag(label: 'Indian'),
            CategoryTag(label: 'Italian'),
            CategoryTag(label: 'Asian'),
            CategoryTag(label: 'Chinese'),
            CategoryTag(label: 'Italian'),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
