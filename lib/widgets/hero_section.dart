import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  String selectedLocation = 'New York, USA';
  String selectedType = 'Apartment';
  RangeValues priceRange = const RangeValues(1200, 4500);

  final List<String> locations = [
    'New York, USA',
    'Los Angeles, USA',
    'San Francisco, USA',
    'Chicago, USA',
    'Miami, USA',
  ];

  final List<String> propertyTypes = [
    'Apartment',
    'Modern Townhouse',
    'Luxury Villa',
    'Studio Loft',
    'Penthouse',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Hero Image with dark overlay
        Positioned.fill(
          child: Image.network(
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=1200&q=80',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1E2B37), Color(0xFF0F172A)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              );
            },
          ),
        ),

        // Dark gradient overlay for text readability
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: 0.55),
                  Colors.black.withValues(alpha: 0.70),
                  Colors.black.withValues(alpha: 0.90),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        // Foreground Content
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top Header Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Brand Icon / Circle Avatar
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: Color(0xFF007A78),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.home_work_outlined,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),

                    // Hamburger Menu Button
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 36),

                // Main Headline
                Text(
                  'Seamless, Flexible\nProperty Rental\nSolutions',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.25,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 16),

                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Experience seamless and flexible property rental solutions with our tailored services. Whether you\'re searching for your dream home or looking for a short-term stay...',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.85),
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Translucent Search Filter Card
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.18),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Location Section
                          Text(
                            'Location',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedLocation,
                              isDense: true,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              dropdownColor: const Color(0xFF1F2937),
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              items: locations.map((loc) {
                                return DropdownMenuItem(
                                  value: loc,
                                  child: Text(loc),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() => selectedLocation = val);
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 14),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.12),
                            height: 1,
                          ),
                          const SizedBox(height: 14),

                          // Type Section
                          Text(
                            'Type',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedType,
                              isDense: true,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              dropdownColor: const Color(0xFF1F2937),
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              items: propertyTypes.map((type) {
                                return DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                );
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) {
                                  setState(() => selectedType = val);
                                }
                              },
                            ),
                          ),

                          const SizedBox(height: 14),
                          Divider(
                            color: Colors.white.withValues(alpha: 0.12),
                            height: 1,
                          ),
                          const SizedBox(height: 14),

                          // Price Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Price Range',
                                style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\$${priceRange.start.toInt()} - \$${priceRange.end.toInt()}/mo',
                                style: GoogleFonts.plusJakartaSans(
                                  color: const Color(0xFF4DB6AC),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Dual Range Slider
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: const Color(0xFF007A78),
                              inactiveTrackColor: Colors.white24,
                              trackHeight: 3,
                              thumbColor: const Color(0xFF26A69A),
                              overlayColor: const Color(0x3326A69A),
                              rangeThumbShape: const RoundRangeSliderThumbShape(
                                enabledThumbRadius: 9,
                                elevation: 3,
                              ),
                            ),
                            child: RangeSlider(
                              values: priceRange,
                              min: 500,
                              max: 8000,
                              divisions: 75,
                              onChanged: (RangeValues values) {
                                setState(() {
                                  priceRange = values;
                                });
                              },
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Search Button
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00565B),
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Searching $selectedType in $selectedLocation (\$${priceRange.start.toInt()}-\$${priceRange.end.toInt()})',
                                      style: GoogleFonts.plusJakartaSans(),
                                    ),
                                    backgroundColor: const Color(0xFF00565B),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Text(
                                'Search',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
