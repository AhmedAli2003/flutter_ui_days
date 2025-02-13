import 'package:flutter/material.dart';
import 'package:flutter_ui_days/days/day_001/src/promo_card.dart';
import 'package:google_fonts/google_fonts.dart';

const day001images = [
  'assets/images/day_001/one.jpg',
  'assets/images/day_001/two.jpg',
  'assets/images/day_001/three.jpg',
  'assets/images/day_001/four.jpg',
];

class PromoTodaySection extends StatelessWidget {
  const PromoTodaySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Promo Today',
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: day001images.length,
            itemBuilder: (context, index) => PromoCard(image: day001images[index]),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
