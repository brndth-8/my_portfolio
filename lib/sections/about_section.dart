import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : size.width * 0.12,
        vertical: 100,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0D1121),
        border: Border(top: BorderSide(color: Color(0xFF1A2035))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionLabel(label: 'About Me'),
          const SizedBox(height: 48),
          isMobile ? _buildMobileLayout() : _buildDesktopLayout(size),
          const SizedBox(height: 80),
          _buildSkills(isMobile),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(Size size) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 5, child: _buildTextContent()),
        const SizedBox(width: 80),
        Expanded(flex: 3, child: _buildProfileCard()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildProfileCard(),
        const SizedBox(height: 40),
        _buildTextContent(),
      ],
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Turning ideas into\nworking solutions.',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontSize: 42,
            fontWeight: FontWeight.w800,
            height: 1.15,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 28),
        Text(
          "I'm Bernadeth Soriano, an Information Technology student and the programmer of our capstone project. I enjoy learning new technologies and solving real-world problems through code.",
          style: GoogleFonts.spaceGrotesk(
            color: const Color(0xFF8899BB),
            fontSize: 16,
            height: 1.9,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Working on our capstone has built my confidence and sharpened my development skills. I'm motivated every day to improve and work toward my dream of becoming a network engineer.",
          style: GoogleFonts.spaceGrotesk(
            color: const Color(0xFF4A5A7A),
            fontSize: 15,
            height: 1.9,
          ),
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildTag('Java'),
            _buildTag('Python'),
            _buildTag('C#'),
            _buildTag('JavaScript'),
            _buildTag('Flutter'),
            _buildTag('Dart'),
            _buildTag('HTML & CSS'),
            _buildTag('MySQL'),
            _buildTag('MongoDB'),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        border: Border.all(color: const Color(0xFF1E2A42)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF64B5F6), Color(0xFF90CAF9)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                'BS',
                style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xFF0A0D1A),
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Bernadeth Soriano',
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'IT Student · Capstone Developer',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF64B5F6),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 24),
          const Divider(color: Color(0xFF1C2638)),
          const SizedBox(height: 20),
          _buildInfoRow(
              Icons.location_on_outlined, 'San Jose Del Monte, Bulacan'),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.school_outlined, 'BSIT · STI-SJDM · 3rd Year'),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.wifi_outlined, 'Aspiring Network Engineer'),
          const SizedBox(height: 12),
          _buildInfoRow(Icons.calendar_today_outlined, 'Enrolled Aug 2023'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF4A5A7A), size: 16),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.spaceGrotesk(
                color: const Color(0xFF8899BB), fontSize: 13),
          ),
        ),
      ],
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        border: Border.all(color: const Color(0xFF243050)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          color: const Color(0xFFAABBCC),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSkills(bool isMobile) {
    final skills = [
      {'label': 'Java', 'pct': 0.85},
      {'label': 'Python', 'pct': 0.80},
      {'label': 'C#', 'pct': 0.80},
      {'label': 'JavaScript', 'pct': 0.70},
      {'label': 'HTML & CSS', 'pct': 0.70},
      {'label': 'MySQL / MongoDB', 'pct': 0.70},
      {'label': 'Flutter / Dart', 'pct': 0.50},
    ];

    final half = (skills.length / 2).ceil();
    final left = skills.sublist(0, half);
    final right = skills.sublist(half);

    Widget buildBar(Map<String, dynamic> s) => Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s['label'] as String,
                      style: GoogleFonts.spaceGrotesk(
                          color: Colors.white70, fontSize: 13)),
                  Text('${((s['pct'] as double) * 100).toInt()}%',
                      style: GoogleFonts.spaceGrotesk(
                          color: const Color(0xFF64B5F6), fontSize: 12)),
                ],
              ),
              const SizedBox(height: 8),
              Stack(children: [
                Container(height: 3, color: const Color(0xFF1C2638)),
                FractionallySizedBox(
                  widthFactor: s['pct'] as double,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF64B5F6), Color(0xFF90CAF9)],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Skills & Technologies',
            style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 36),
        isMobile
            ? Column(children: skills.map(buildBar).toList())
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(children: left.map(buildBar).toList())),
                  const SizedBox(width: 60),
                  Expanded(
                      child: Column(children: right.map(buildBar).toList())),
                ],
              ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFF64B5F6),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            color: const Color(0xFF64B5F6),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
