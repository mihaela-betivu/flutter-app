import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controllers/recipe_controller.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller = Get.find<RecipeController>();

    return Obx(() {
      return Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello ${controller.user.value?.name ?? ''}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    controller.user.value?.greeting ?? '',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ],
              ),
            ),
            // Avatar
            controller.user.value?.profileImage == null
                ? Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFFFCE80,
                      ), // fundalul galben-bej din exemplu
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // colțuri rotunjite
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        'assets/images/header_avatar.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFFFCE80,
                      ), // fundalul galben-bej din exemplu
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // colțuri rotunjite
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(
                              controller.user.value?.profileImage ?? '',
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
