import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/hero_section.dart';
import 'widgets/value_prop_section.dart';
import 'widgets/news_stories_section.dart';
import 'widgets/featured_rentals_section.dart';
import 'widgets/affordable_rentals_section.dart';
import 'widgets/invite_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawer: Drawer(
          backgroundColor: const Color(0xFF0F172A),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF007A78),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.home_work_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Property Rentals',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                _buildDrawerItem(context, Icons.explore_outlined, 'Explore Rentals'),
                _buildDrawerItem(context, Icons.featured_play_list_outlined, 'Featured Properties'),
                _buildDrawerItem(context, Icons.article_outlined, 'News & Stories'),
                _buildDrawerItem(context, Icons.payment_outlined, 'Payment Solutions'),
                _buildDrawerItem(context, Icons.card_giftcard_outlined, 'Referral Program'),
                _buildDrawerItem(context, Icons.help_outline_rounded, '24/7 Support'),
                const Divider(color: Colors.white24, height: 40),
                _buildDrawerItem(context, Icons.person_outline_rounded, 'My Account'),
                _buildDrawerItem(context, Icons.settings_outlined, 'Preferences'),
              ],
            ),
          ),
        ),
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Hero Section with header and search card
              HeroSection(),

              // 2. Feature Value Proposition Cards
              ValuePropSection(),

              // 3. News & Stories Section
              NewsStoriesSection(),

              // 4. Featured Open Rentals List
              FeaturedRentalsSection(),

              // 5. Affordable Rentals & Ease of Payment
              AffordableRentalsSection(),

              // 6. Invite & Seamless Experience Section
              InviteSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      leading: Icon(icon, color: const Color(0xFF4DB6AC), size: 22),
      title: Text(
        title,
        style: GoogleFonts.plusJakartaSans(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '$title selected',
              style: GoogleFonts.plusJakartaSans(),
            ),
            backgroundColor: const Color(0xFF00565B),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
