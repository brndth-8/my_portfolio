import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();
  bool _sent = false;
  String? _error;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  // ── Sends via mailto: — opens the user's default email client
  // with To, Subject, and Body pre-filled.
  Future<void> _submit() async {
    final name = _nameCtrl.text.trim();
    final senderEmail = _emailCtrl.text.trim();
    final message = _msgCtrl.text.trim();

    if (name.isEmpty || senderEmail.isEmpty || message.isEmpty) {
      setState(() => _error = 'Please fill in all fields before sending.');
      return;
    }

    setState(() => _error = null);

    final subject = Uri.encodeComponent('Portfolio Contact from $name');
    final body = Uri.encodeComponent(
      'Hi Bernadeth,\n\nYou received a new message from your portfolio:\n\n'
      'Name: $name\n'
      'Email: $senderEmail\n\n'
      'Message:\n$message\n\n'
      '---\nSent via bernadeth-soriano.dev portfolio',
    );

    final mailtoUri = Uri.parse(
      'mailto:sorianobernadeth08@gmail.com?subject=$subject&body=$body',
    );

    if (await canLaunchUrl(mailtoUri)) {
      await launchUrl(mailtoUri);
      setState(() => _sent = true);
    } else {
      setState(() => _error =
          'Could not open email client. Please email directly at sorianobernadeth08@gmail.com');
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri))
      launchUrl(uri, mode: LaunchMode.externalApplication);
  }

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
          _SectionLabel(label: '04 — Contact'),
          const SizedBox(height: 20),
          Text(
            "Let's Connect.",
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: isMobile ? 32 : 56,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Open to opportunities, collaborations, and new connections.\nDrop me a message — I\'ll get back to you!',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF4A5A7A),
              fontSize: 16,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 64),
          isMobile
              ? Column(children: [
                  _buildForm(),
                  const SizedBox(height: 48),
                  _buildContactInfo(),
                ])
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _buildForm()),
                    const SizedBox(width: 80),
                    Expanded(flex: 3, child: _buildContactInfo()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    if (_sent) {
      return Container(
        padding: const EdgeInsets.all(48),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          border: Border.all(color: const Color(0xFF64B5F6).withOpacity(0.3)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFF64B5F6).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.check, color: Color(0xFF64B5F6), size: 32),
            ),
            const SizedBox(height: 20),
            Text('Email Client Opened!',
                style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Text(
              'Your message has been pre-filled in your email app.\nJust hit Send — and Bernadeth will receive it!',
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xFF4A5A7A), fontSize: 14, height: 1.7),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => setState(() {
                _sent = false;
                _nameCtrl.clear();
                _emailCtrl.clear();
                _msgCtrl.clear();
              }),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color(0xFF64B5F6).withOpacity(0.4)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('Send Another',
                    style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF64B5F6), fontSize: 13)),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                child: _buildField('Your Name', _nameCtrl,
                    hint: 'e.g. Juan Dela Cruz')),
            const SizedBox(width: 16),
            Expanded(
                child: _buildField('Your Email', _emailCtrl,
                    hint: 'e.g. juan@email.com')),
          ],
        ),
        _buildField('Message', _msgCtrl,
            maxLines: 6, hint: 'Tell Bernadeth what\'s on your mind...'),
        if (_error != null) ...[
          const SizedBox(height: 8),
          Text(_error!,
              style: GoogleFonts.spaceGrotesk(
                  color: Colors.redAccent, fontSize: 13)),
        ],
        const SizedBox(height: 20),
        GestureDetector(
          onTap: _submit,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: const Color(0xFF64B5F6),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Send Message',
                  style: GoogleFonts.spaceGrotesk(
                    color: const Color(0xFF0A0D1A),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.send_outlined,
                    color: Color(0xFF0A0D1A), size: 16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Clicking "Send Message" opens your default email app with the message pre-filled.',
          style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF3A4A6B), fontSize: 11, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildField(String label, TextEditingController ctrl,
      {int maxLines = 1, String hint = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.spaceGrotesk(
            color: const Color(0xFF8899BB),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: ctrl,
          maxLines: maxLines,
          style: GoogleFonts.spaceGrotesk(color: Colors.white, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.spaceGrotesk(
                color: const Color(0xFF2A3A52), fontSize: 13),
            filled: true,
            fillColor: const Color(0xFF111827),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xFF1E2A42)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xFF1E2A42)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide:
                  const BorderSide(color: Color(0xFF64B5F6), width: 1.5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch',
          style: GoogleFonts.spaceGrotesk(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 28),
        _buildContactItem(
          Icons.email_outlined,
          'Email',
          'sorianobernadeth08@gmail.com',
          'mailto:sorianobernadeth08@gmail.com',
        ),
        const SizedBox(height: 20),
        _buildContactItem(
          Icons.phone_outlined,
          'Mobile',
          '09503732426',
          'tel:+639503732426',
        ),
        const SizedBox(height: 20),
        _buildContactItem(
          Icons.location_on_outlined,
          'Location',
          'San Jose Del Monte, Bulacan',
          null,
        ),
        const SizedBox(height: 48),
        Text(
          'Find me online',
          style: GoogleFonts.spaceGrotesk(
            color: const Color(0xFF4A5A7A),
            fontSize: 12,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildSocialBtn(
                'GitHub', Icons.code, 'https://github.com/brndth-8'),
            _buildSocialBtn('Email', Icons.email_outlined,
                'mailto:sorianobernadeth08@gmail.com'),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem(
      IconData icon, String label, String value, String? url) {
    return GestureDetector(
      onTap: url != null ? () => _launchUrl(url) : null,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              border: Border.all(color: const Color(0xFF1E2A42)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, color: const Color(0xFF64B5F6), size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF555555), fontSize: 11)),
                Text(value,
                    style: GoogleFonts.spaceGrotesk(
                      color:
                          url != null ? Colors.white : const Color(0xFF8899BB),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      decoration: url != null ? TextDecoration.underline : null,
                      decorationColor: Colors.white24,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialBtn(String label, IconData icon, String url) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          border: Border.all(color: const Color(0xFF1E2A42)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF8899BB), size: 14),
            const SizedBox(width: 8),
            Text(label,
                style: GoogleFonts.spaceGrotesk(
                    color: const Color(0xFF8899BB),
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
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
