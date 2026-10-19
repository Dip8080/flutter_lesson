import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/property_model.dart';
import 'network_image_fallback.dart';

class FeaturedRentalsSection extends StatefulWidget {
  const FeaturedRentalsSection({super.key});

  @override
  State<FeaturedRentalsSection> createState() => _FeaturedRentalsSectionState();
}

class _FeaturedRentalsSectionState extends State<FeaturedRentalsSection> {
  final List<PropertyModel> properties = const [
    PropertyModel(
      id: '1',
      title: 'Urban Flat, West Coast',
      specs: '2 Beds • 2 Baths • 1,200 sqft',
      price: '\$2,850/mo',
      rating: 4.9,
      reviewsCount: 124,
      imageUrl:
          'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=800&q=80',
    ),
    PropertyModel(
      id: '2',
      title: 'Modernist Townhouse',
      specs: '3 Beds • 2.5 Baths • 1,800 sqft',
      price: '\$3,400/mo',
      rating: 4.8,
      reviewsCount: 98,
      imageUrl:
          'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
    ),
    PropertyModel(
      id: '3',
      title: 'Garden View Villa',
      specs: '4 Beds • 3 Baths • 2,400 sqft',
      price: '\$4,200/mo',
      rating: 4.95,
      reviewsCount: 210,
      imageUrl:
          'https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?auto=format&fit=crop&w=800&q=80',
    ),
    PropertyModel(
      id: '4',
      title: 'Penthouse Suite',
      specs: '2 Beds • 2 Baths • 1,400 sqft',
      price: '\$3,100/mo',
      rating: 4.7,
      reviewsCount: 85,
      imageUrl:
          'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=800&q=80',
    ),
    PropertyModel(
      id: '5',
      title: 'Lakeside Haven',
      specs: '5 Beds • 4 Baths • 3,200 sqft',
      price: '\$5,500/mo',
      rating: 5.0,
      reviewsCount: 64,
      imageUrl:
          'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&w=800&q=80',
    ),
    PropertyModel(
      id: '6',
      title: 'Cozy Studio Loft',
      specs: '1 Bed • 1 Bath • 750 sqft',
      price: '\$1,950/mo',
      rating: 4.85,
      reviewsCount: 142,
      imageUrl:
          'https://images.unsplash.com/photo-1505691938895-1758d7feb511?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  bool isLoadingMore = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Title
          Text(
            'Featured Open\nRentals',
            textAlign: TextAlign.center,
            style: GoogleFonts.playfairDisplay(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF111827),
              letterSpacing: -0.3,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 24),

          // Property Cards List
          Column(
            children: properties.map((property) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Viewing ${property.title}',
                          style: GoogleFonts.plusJakartaSans(),
                        ),
                        backgroundColor: const Color(0xFF00565B),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Property Image Card
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: NetworkImageFallback(
                          imageUrl: property.imageUrl,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Property Title
                      Text(
                        property.title,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF111827),
                          letterSpacing: -0.2,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Specs
                      Text(
                        property.specs,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF6B7280),
                        ),
                      ),

                      const SizedBox(height: 6),

                      // Price & Rating Row
                      Row(
                        children: [
                          Text(
                            property.price,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF00565B),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: const BoxDecoration(
                              color: Color(0xFF9CA3AF),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: Color(0xFFF59E0B),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${property.rating}',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${property.reviewsCount} reviews)',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          // Load More Button
          SizedBox(
            height: 46,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00565B),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 28),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);
                setState(() => isLoadingMore = true);
                await Future.delayed(const Duration(milliseconds: 600));
                if (!mounted) return;
                setState(() => isLoadingMore = false);
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(
                      'All latest properties loaded',
                      style: GoogleFonts.plusJakartaSans(),
                    ),
                    backgroundColor: const Color(0xFF00565B),
                  ),
                );
              },
              child: isLoadingMore
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Load More',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.2,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
