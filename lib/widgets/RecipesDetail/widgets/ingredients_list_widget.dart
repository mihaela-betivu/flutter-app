import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IngredientItem {
  final String name;
  final String qty;        // ex. "500g"
  final String assetIcon;  // ex. 'assets/food/tomato.png'
  IngredientItem(this.name, this.qty, this.assetIcon);
}

class IngredientsList extends StatelessWidget {
  final List<IngredientItem> items;
  final String servesLabel;   // ex. "1 serve"

  const IngredientsList({
    super.key,
    required this.items,
    this.servesLabel = '1 serve',
  });

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF3F3F3);        // fundal mare
    const iconBg = Color(0xFFFFFFFF);    // pătrat icon

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          // Header (serve / items)
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/serve.svg',
                width: 17,
                height: 17,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFA9A9A9),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                servesLabel,
                style: const TextStyle(
                  color: Color(0xFFA9A9A9),
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
              ),
              const Spacer(),
              Text(
                '${items.length} Items',
                style: const TextStyle(
                  color: Color(0xFFA9A9A9),
                  fontWeight: FontWeight.w400,
                  fontSize: 11,
                ),
              ),
            ],
          ),

          // Listă cu scrollbar
          ClipRRect(
            child: Scrollbar(
              thickness: 6,
              radius: const Radius.circular(20),
              interactive: true,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: items.length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  final it = items[i];
                  return Container(
                    height: 76,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    child: Row(
                      children: [
                        // pătrat cu icon
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            color: iconBg,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(it.assetIcon, fit: BoxFit.contain),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // nume
                        Expanded(
                          child: Text(
                            it.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF121212),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // cantitate
                        Text(
                          it.qty,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA9A9A9),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
