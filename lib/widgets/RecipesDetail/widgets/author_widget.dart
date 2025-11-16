import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorWidget extends StatelessWidget {
  final String avatarAsset; // ex: 'assets/images/laura.jpg'
  final String name; // ex: 'Laura Wilson'
  final String location; // ex: 'Lagos, Nigeria'
  final String pinIconAsset; // ex: 'assets/icons/pin.svg' (sau .png)
  final VoidCallback? onFollow;

  const AuthorWidget({
    super.key,
    required this.avatarAsset,
    required this.name,
    required this.location,
    required this.pinIconAsset,
    this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatarAsset)),
          const SizedBox(width: 16),

          // Nume + locație
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    // Dacă iconul este SVG
                    SvgPicture.asset(
                      pinIconAsset,
                      width: 17,
                      height: 17,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF63B19B), // punct verde deschis
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 3),
                    Flexible(
                      child: Text(
                        location,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA9A9A9),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Buton Follow (pastilă)
          ElevatedButton(
            onPressed: onFollow ?? () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color(0xFF129575),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
            child: const Text('Follow'),
          ),
        ],
      ),
    );
  }
}
