import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/contact_section.dart';
import 'widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  int _activeSection = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    if (offset < 500) {
      if (_activeSection != 0) setState(() => _activeSection = 0);
    } else if (offset < 1200) {
      if (_activeSection != 1) setState(() => _activeSection = 1);
    } else if (offset < 2200) {
      if (_activeSection != 2) setState(() => _activeSection = 2);
    } else {
      if (_activeSection != 3) setState(() => _activeSection = 3);
    }
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0D1A),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(key: heroKey),
                AboutSection(key: aboutKey),
                ExperienceSection(key: experienceKey),
                ContactSection(key: contactKey),
                _buildFooter(),
              ],
            ),
          ),
          NavBar(
            activeIndex: _activeSection,
            onNavTap: (index) {
              final keys = [heroKey, aboutKey, experienceKey, contactKey];
              _scrollTo(keys[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF1A2035))),
      ),
      child: Text(
        '© 2025 Bernadeth Soriano — Built with Flutter Web.',
        textAlign: TextAlign.center,
        style: GoogleFonts.spaceGrotesk(
          color: const Color(0xFF3A4A6B),
          fontSize: 13,
        ),
      ),
    );
  }
}
