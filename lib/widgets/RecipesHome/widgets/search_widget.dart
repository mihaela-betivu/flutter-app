import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/recipe_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find<RecipeController>();

    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFD9D9D9),
                  width: 1.3,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    'assets/images/search-normal.svg',
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF94A3B8),
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        isDense: true,

                        hintText: controller.searchPlaceholder.value,
                        hintStyle: TextStyle(
                          color: Color(0xFFD9D9D9),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        controller.filterRecipes(value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(
                0xFF129575,
              ), // fundalul verde din exemplu
              borderRadius: BorderRadius.circular(
                10,
              ), // colțuri rotunjite
            ),
            child: SvgPicture.asset(
              'assets/images/setting-4.svg',
              width: 18,
              height: 18,
              colorFilter: const ColorFilter.mode(
                Color(0xFFFFFFFF),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
