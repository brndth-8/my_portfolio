import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dart:math' as math;

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _floatController;
  late Animation<double> _fadeAnim;
  late Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeOut);
    _floatAnim = Tween(begin: 0.0, end: 12.0).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      height: size.height,
      decoration: const BoxDecoration(color: Color(0xFF0A0D1A)),
      child: Stack(
        children: [
          // Grid background
          CustomPaint(
            size: Size(size.width, size.height),
            painter: GridPainter(),
          ),

          // Glowing orbs
          Positioned(
            top: size.height * 0.15,
            right: isMobile ? -80 : size.width * 0.1,
            child: AnimatedBuilder(
              animation: _floatAnim,
              builder: (context, child) => Transform.translate(
                offset: Offset(0, _floatAnim.value),
                child: child,
              ),
              child: Container(
                width: isMobile ? 250 : 400,
                height: isMobile ? 250 : 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF64B5F6).withOpacity(0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: size.height * 0.1,
            left: isMobile ? -60 : size.width * 0.05,
            child: Container(
              width: isMobile ? 180 : 300,
              height: isMobile ? 180 : 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF90CAF9).withOpacity(0.06),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : size.width * 0.12,
              vertical: 0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),

                FadeTransition(
                  opacity: _fadeAnim,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFF64B5F6).withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '✦  Available for opportunities',
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF64B5F6),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                FadeTransition(
                  opacity: _fadeAnim,
                  child: Text(
                    'Hi, I\'m',
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xFF8899BB),
                      fontSize: isMobile ? 18 : 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                FadeTransition(
                  opacity: _fadeAnim,
                  child: Text(
                    'Bernadeth Soriano',
                    style: GoogleFonts.spaceGrotesk(
                      color: Colors.white,
                      fontSize: isMobile ? 44 : 76,
                      fontWeight: FontWeight.w800,
                      height: 1.0,
                      letterSpacing: -2,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Text(
                      'I build  ',
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF8899BB),
                        fontSize: isMobile ? 20 : 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    DefaultTextStyle(
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF64B5F6),
                        fontSize: isMobile ? 20 : 32,
                        fontWeight: FontWeight.w700,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TypewriterAnimatedText('capstone systems.',
                              speed: const Duration(milliseconds: 80)),
                          TypewriterAnimatedText('Flutter apps.',
                              speed: const Duration(milliseconds: 80)),
                          TypewriterAnimatedText('network solutions.',
                              speed: const Duration(milliseconds: 80)),
                          TypewriterAnimatedText('clean code.',
                              speed: const Duration(milliseconds: 80)),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                FadeTransition(
                  opacity: _fadeAnim,
                  child: Text(
                    'IT Student  ·  Capstone Developer  ·  Future Network Engineer\nA 3rd-year BSIT student at STI-San Jose Del Monte, Bulacan.',
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xFF4A5A7A),
                      fontSize: isMobile ? 14 : 16,
                      height: 1.8,
                    ),
                  ),
                ),

                const SizedBox(height: 48),

                FadeTransition(
                  opacity: _fadeAnim,
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _buildCTAButton(
                        'View My Journey',
                        isPrimary: true,
                        onTap: () {},
                      ),
                      _buildCTAButton(
                        'Get In Touch',
                        isPrimary: false,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 64),

                FadeTransition(
                  opacity: _fadeAnim,
                  child: Row(
                    children: [
                      _buildStat('BSIT', 'Degree'),
                      _buildDivider(),
                      _buildStat('3rd Year', 'Level'),
                      _buildDivider(),
                      _buildStat('7+', 'Technologies'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: 36,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'scroll',
                  style: GoogleFonts.spaceGrotesk(
                    color: const Color(0xFF3A4A6B),
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                _ScrollArrow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTAButton(String label,
      {required bool isPrimary, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
        decoration: BoxDecoration(
          color:
              isPrimary ? const Color(0xFF64B5F6) : Colors.transparent,
          border: Border.all(
            color: isPrimary
                ? const Color(0xFF64B5F6)
                : const Color(0xFF333333),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            color: isPrimary ? const Color(0xFF0A0D1A) : Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            color: const Color(0xFF4A5A7A),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      color: const Color(0xFF1E2A42),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A2035).withOpacity(0.5)
      ..strokeWidth = 0.5;
    const step = 60.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _ScrollArrow extends StatefulWidget {
  @override
  State<_ScrollArrow> createState() => _ScrollArrowState();
}

class _ScrollArrowState extends State<_ScrollArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);
    _anim = Tween(begin: 0.0, end: 8.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, _anim.value),
        child: const Icon(Icons.keyboard_arrow_down,
            color: Color(0xFF3A4A6B), size: 20),
      ),
    );
  }
}
