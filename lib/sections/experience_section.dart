import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static const _experiences = [
    {
      'role': 'BS Information Technology',
      'company': 'STI - San Jose Del Monte, Bulacan',
      'period': 'Aug 2023 – Present',
      'type': 'Full-time',
      'location': 'On-site',
      'desc':
          'Currently a 3rd-year BSIT student. Core subjects include Java programming, data structures, database systems, networking fundamentals, and software engineering.',
      'tech': ['Java', 'Python', 'C#', 'MySQL', 'Networking'],
      'highlight': true,
    },
    {
      'role': 'Capstone Project Lead Developer',
      'company': 'STI-SJDM · Academic Project',
      'period': '2025 – Present',
      'type': 'Academic',
      'location': 'On-site',
      'desc':
          'Serving as the main programmer for our capstone project. Responsible for full system design, development, and implementation using modern development tools and methodologies.',
      'tech': ['Flutter', 'Dart', 'MySQL', 'MongoDB', 'VS Code'],
      'highlight': false,
    },
    {
      'role': 'Flutter & Dart Self-Study',
      'company': 'Independent Learning',
      'period': '2024 – Present',
      'type': 'Self-Study',
      'location': 'Remote',
      'desc':
          'Self-studying Flutter for cross-platform mobile and web development. Actively building projects to practice skills and deepen understanding of the Dart language and widget tree.',
      'tech': ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
      'highlight': false,
    },
    {
      'role': 'Tech Stack Exploration',
      'company': 'Personal Projects',
      'period': '2023 – Present',
      'type': 'Personal',
      'location': 'Remote',
      'desc':
          'Continuously expanding knowledge in web and software development. Projects include HTML/CSS websites, Python scripts, C# desktop apps, and database design with MySQL and MongoDB.',
      'tech': ['HTML', 'CSS', 'JavaScript', 'Python', 'C#', 'MongoDB'],
      'highlight': false,
    },
  ];

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
      decoration: const BoxDecoration(color: Color(0xFF0A0D1A)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _SectionLabel(label: 'Journey'),
              if (!isMobile)
                Text(
                  '${_experiences.length} Milestones',
                  style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xFF3A4A6B), fontSize: 13),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'My Path So Far',
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: isMobile ? 32 : 56,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 64),
          ..._experiences.asMap().entries.map(
                (e) => _buildExperienceCard(e.value, e.key, isMobile),
              ),
          const SizedBox(height: 60),
          _buildTechStack(isMobile),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(
      Map<String, dynamic> exp, int index, bool isMobile) {
    final isHighlight = exp['highlight'] as bool;
    final techs = exp['tech'] as List<String>;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        border: Border.all(
          color: isHighlight
              ? const Color(0xFF64B5F6).withOpacity(0.4)
              : const Color(0xFF1E2A42),
          width: isHighlight ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isHighlight)
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF64B5F6).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: const Color(0xFF64B5F6).withOpacity(0.3)),
                        ),
                        child: Text(
                          'Current',
                          style: GoogleFonts.spaceGrotesk(
                            color: const Color(0xFF64B5F6),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    Text(
                      exp['role'] as String,
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exp['company'] as String,
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF64B5F6),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A0D1A),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xFF243050)),
                    ),
                    child: Text(
                      exp['period'] as String,
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF8899BB),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C2638),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          exp['type'] as String,
                          style: GoogleFonts.spaceGrotesk(
                              color: const Color(0xFF4A5A7A), fontSize: 11),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C2638),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          exp['location'] as String,
                          style: GoogleFonts.spaceGrotesk(
                              color: const Color(0xFF4A5A7A), fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            exp['desc'] as String,
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF8899BB),
              fontSize: 14,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: techs
                .map((t) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF64B5F6).withOpacity(0.07),
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            color: const Color(0xFF64B5F6).withOpacity(0.2)),
                      ),
                      child: Text(
                        t,
                        style: GoogleFonts.spaceGrotesk(
                          color: const Color(0xFF90CAF9),
                          fontSize: 12,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTechStack(bool isMobile) {
    final techs = [
      'Java',
      'Python',
      'C#',
      'Flutter',
      'Dart',
      'HTML',
      'CSS',
      'JavaScript',
      'MySQL',
      'MongoDB',
      'VS Code',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(label: 'Tech Stack'),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: techs
              .map((t) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF111827),
                      border: Border.all(color: const Color(0xFF243050)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      t,
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF8899BB),
                        fontSize: 13,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) => Row(children: [
        Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
                color: Color(0xFF64B5F6), shape: BoxShape.circle)),
        const SizedBox(width: 10),
        Text(label,
            style: GoogleFonts.spaceGrotesk(
                color: const Color(0xFF64B5F6),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2)),
      ]);
}
