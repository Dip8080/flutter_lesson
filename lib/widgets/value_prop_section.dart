import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValuePropSection extends StatelessWidget {
  const ValuePropSection({super.key});

  final List<Map<String, String>> items = const [
    {
      'title': 'Flexibility',
      'subtitle': 'Availability 24/7',
    },
    {
      'title': 'Instant Booking',
      'subtitle': 'Fast confirmation',
    },
    {
      'title': 'Wide Selection',
      'subtitle': '10,000+ verified homes',
    },
    {
      'title': 'Best Price',
      'subtitle': 'Guaranteed rates',
    },
    {
      'title': 'No Application Fee',
      'subtitle': '100% transparent process',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        children: items.map((item) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 14.0),
            padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: const Color(0xFFE5E7EB),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item['title']!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF111827),
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item['subtitle']!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
