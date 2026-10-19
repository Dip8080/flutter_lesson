import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'network_image_fallback.dart';

class AffordableRentalsSection extends StatelessWidget {
  const AffordableRentalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Heading
          Text(
            'Affordable Rentals and\nEase of Payment',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
              letterSpacing: -0.3,
              height: 1.25,
            ),
          ),

          const SizedBox(height: 28),

          // Overlapping Images Collage
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Stack(
              children: [
                // Top-Left Image: Happy couple moving in
                Positioned(
                  top: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width * 0.58,
                  height: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: NetworkImageFallback(
                      imageUrl:
                          'https://images.unsplash.com/photo-1560518883-ce09059eeffa?auto=format&fit=crop&w=700&q=80',
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                // Bottom-Right Overlapping Image: Keys handover & payment
                Positioned(
                  bottom: 0,
                  right: 0,
                  width: MediaQuery.of(context).size.width * 0.60,
                  height: 170,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: NetworkImageFallback(
                      imageUrl:
                          'https://images.unsplash.com/photo-1560520653-9e0e4c89eb11?auto=format&fit=crop&w=700&q=80',
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          // Subheading
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Affordable Rentals &\nFlexible Payment Plans',
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF111827),
                letterSpacing: -0.2,
                height: 1.25,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Detailed Paragraph
          Text(
            'Discover rental living that fits your budget without compromising on quality or style. We offer straightforward pricing, transparent lease agreements, and zero unexpected hidden charges.\n\nOur intuitive platform makes paying rent effortless with automated monthly payments, split-payment options for roommates, and digital receipts all in one place. Enjoy peace of mind knowing your home and finances are in perfect harmony.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13.5,
              height: 1.6,
              color: const Color(0xFF4B5563),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
