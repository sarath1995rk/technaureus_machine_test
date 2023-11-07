import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technaures_machine_test/common/palette.dart';
import 'package:technaures_machine_test/common/sizes.dart';
import 'package:technaures_machine_test/common/theme_x.dart';
import 'package:technaures_machine_test/models/category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categories,
    required this.onItemTapped,
  });

  final List<Category> categories;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: List.generate(
        categories.length,
        (index) => Padding(
          padding: EdgeInsets.all(Sizes.paddingH12),
          child: InkWell(
            key: const Key('category_inkwell'),
            onTap: () => onItemTapped(index),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Palette.darkBlue,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0xff333333).withOpacity(.15),
                      spreadRadius: 0,
                      blurRadius: 10),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: Sizes.buttonHeight48,
                    width: Sizes.buttonHeight48,
                    decoration: BoxDecoration(
                      color: Palette.secondary,
                      borderRadius: BorderRadius.circular(Corners.radius10),
                    ),
                    child: Image.network(
                      categories[index].image,
                    ),
                  ),
                  SizedBox(height: Sizes.paddingV12),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.paddingH12,
                    ),
                    child: Text(
                      categories[index].title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: context.bodyMedium(
                        textColor: Palette.white
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
