import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  final int activeIndex;
  final void Function(int) onNavTap;

  const NavBar({super.key, required this.activeIndex, required this.onNavTap});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;

  final List<String> _navItems = ['Home', 'About', 'Experience', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            decoration: BoxDecoration(
              color: const Color(0xFF0A0D1A).withOpacity(0.92),
              border: const Border(
                bottom: BorderSide(color: Color(0xFF1C2638), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                GestureDetector(
                  onTap: () => widget.onNavTap(0),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      children: const [
                        TextSpan(text: 'soriano'),
                        TextSpan(
                          text: '.',
                          style: TextStyle(color: Color(0xFF64B5F6)),
                        ),
                        TextSpan(text: 'bernadeth'),
                      ],
                    ),
                  ),
                ),
                if (!isMobile)
                  Row(
                    children: List.generate(_navItems.length, (i) {
                      final isActive = widget.activeIndex == i;
                      return GestureDetector(
                        onTap: () => widget.onNavTap(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.only(left: 32),
                          padding: const EdgeInsets.only(bottom: 3),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isActive
                                    ? const Color(0xFF64B5F6)
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            _navItems[i],
                            style: GoogleFonts.spaceGrotesk(
                              color: isActive
                                  ? const Color(0xFF64B5F6)
                                  : const Color(0xFF8899BB),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                if (isMobile)
                  IconButton(
                    onPressed: () => setState(() => _menuOpen = !_menuOpen),
                    icon: Icon(
                      _menuOpen ? Icons.close : Icons.menu,
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
          if (isMobile && _menuOpen)
            Container(
              width: double.infinity,
              color: const Color(0xFF111827),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: List.generate(_navItems.length, (i) {
                  final isActive = widget.activeIndex == i;
                  return GestureDetector(
                    onTap: () {
                      widget.onNavTap(i);
                      setState(() => _menuOpen = false);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 32),
                      child: Text(
                        _navItems[i],
                        style: GoogleFonts.spaceGrotesk(
                          color: isActive
                              ? const Color(0xFF64B5F6)
                              : Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}
