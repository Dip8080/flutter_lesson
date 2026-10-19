import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteSection extends StatelessWidget {
  const InviteSection({super.key});

  final List<Map<String, dynamic>> actionButtons = const [
    {
      'icon': Icons.headset_mic_outlined,
      'label': '24/7 Support',
    },
    {
      'icon': Icons.payment_outlined,
      'label': 'Easy Payment',
    },
    {
      'icon': Icons.apartment_rounded,
      'label': 'Browse Homes',
    },
    {
      'icon': Icons.shield_outlined,
      'label': 'Safe & Verified',
    },
    {
      'icon': Icons.group_outlined,
      'label': 'Refer Friends',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Heading
          Text(
            'Invite Others &\nShare Your\nSeamless\nMonthly Rent\nPayment Experience',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
              letterSpacing: -0.3,
              height: 1.25,
            ),
          ),

          const SizedBox(height: 24),

          // Referral description in rounded container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: const Color(0xFFE5E7EB),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              'Invite your friends, colleagues, and family to join our rental community. Both of you receive exclusive rental credits, priority booking privileges, and zero-fee transactions on upcoming leases.',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13.5,
                height: 1.55,
                color: const Color(0xFF4B5563),
              ),
            ),
          ),

          const SizedBox(height: 28),

          // 5 Styled Pill Action Buttons
          Column(
            children: actionButtons.map((btn) {
              return Container(
                width: double.infinity,
                height: 62,
                margin: const EdgeInsets.only(bottom: 12.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4EAE7),
                    foregroundColor: const Color(0xFF00565B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${btn['label']} selected',
                          style: GoogleFonts.plusJakartaSans(),
                        ),
                        backgroundColor: const Color(0xFF00565B),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        btn['icon'] as IconData,
                        size: 22,
                        color: const Color(0xFF00565B),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        btn['label'] as String,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF004B4F),
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 32),

          // Bottom Footer / Brand note
          Text(
            '© 2026 Property Rental Solutions. All rights reserved.',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11.5,
              color: const Color(0xFF9CA3AF),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
