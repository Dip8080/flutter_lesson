import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsStoriesSection extends StatelessWidget {
  const NewsStoriesSection({super.key});

  final List<Map<String, dynamic>> stories = const [
    {
      'icon': Icons.spa_outlined,
      'text': 'Interior design trends for stylish, comfortable home spaces',
    },
    {
      'icon': Icons.home_work_outlined,
      'text': 'Comprehensive guide to securing your ideal rental house',
    },
    {
      'icon': Icons.trending_up_rounded,
      'text': 'Smart financial tips for renters and home seekers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Heading
          Text(
            'News & Stories',
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
              letterSpacing: -0.3,
            ),
          ),

          const SizedBox(height: 20),

          // Featured Card with Image Background
          Container(
            height: 480,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Plant / Room Image
                  Image.network(
                    'https://images.unsplash.com/photo-1545241047-6083a3684587?auto=format&fit=crop&w=1000&q=80',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFF2C3E50),
                      );
                    },
                  ),

                  // Dark gradient from transparent to deep charcoal
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.40),
                          Colors.black.withValues(alpha: 0.85),
                          Colors.black.withValues(alpha: 0.95),
                        ],
                        stops: const [0.2, 0.5, 0.75, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),

                  // Floating Content Items at Bottom
                  Positioned(
                    left: 18,
                    right: 18,
                    bottom: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: stories.map((story) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    story['text'] as String,
                                    style: GoogleFonts.plusJakartaSans(),
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: const Color(0xFF00565B),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Teal Bullet Icon
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF007A78).withValues(alpha: 0.8),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white.withValues(alpha: 0.2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Icon(
                                    story['icon'] as IconData,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 12),

                                // Story Headline
                                Expanded(
                                  child: Text(
                                    story['text'] as String,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      height: 1.35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
