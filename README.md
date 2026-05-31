# 🚀 Flutter Web Portfolio

A fully responsive personal portfolio built with **Flutter Web** — featuring a landing page, about/contact section, and portfolio/experience showcase.

---

## 📁 Project Structure

```
portfolio/
├── lib/
│   ├── main.dart               # App entry point
│   ├── app.dart                # Theme & MaterialApp
│   ├── home_page.dart          # Root page with nav & scroll
│   ├── widgets/
│   │   └── nav_bar.dart        # Responsive nav bar
│   └── sections/
│       ├── hero_section.dart   # Landing / Hero
│       ├── about_section.dart  # About + Skills
│       ├── experience_section.dart  # Work history
│       ├── portfolio_section.dart   # Projects grid
│       └── contact_section.dart    # Contact form + info
├── web/
│   └── index.html              # HTML shell with loader
├── .github/workflows/
│   └── deploy.yml              # GitHub Actions auto-deploy
├── vercel.json                 # Vercel config
├── firebase.json               # Firebase Hosting config
└── pubspec.yaml
```

---

## ✏️ Personalization (Edit These First)

Open the following files and replace placeholder content:

| File | What to change |
|------|----------------|
| `lib/sections/hero_section.dart` | Your name, subtitle, tagline |
| `lib/sections/about_section.dart` | Bio, location, skills |
| `lib/sections/experience_section.dart` | Your work history |
| `lib/sections/portfolio_section.dart` | Your projects |
| `lib/sections/contact_section.dart` | Email, social links |
| `lib/app.dart` | App title in MaterialApp |
| `web/index.html` | Meta description, OG tags |

---

## 🛠️ Local Development

### Prerequisites
- Flutter SDK ≥ 3.0.0 ([install guide](https://flutter.dev/docs/get-started/install))
- Chrome browser (for web development)

### Run locally
```bash
# Install dependencies
flutter pub get

# Run in Chrome
flutter run -d chrome

# Or with hot reload
flutter run -d chrome --web-port 3000
```

---

## 🚢 Deployment

### Option 1 — GitHub Pages (Recommended, Free)

1. Push this project to a GitHub repository
2. Go to **Settings → Pages**
3. Set source to **GitHub Actions**
4. The workflow in `.github/workflows/deploy.yml` auto-deploys on every push to `main`
5. Your site will be live at: `https://YOUR_USERNAME.github.io/REPO_NAME/`

> ⚠️ Update `--base-href` in `deploy.yml` to match your repo name.

---

### Option 2 — Vercel (Easiest, Free)

**Method A: Vercel CLI**
```bash
npm install -g vercel

# Build first
flutter build web --release --web-renderer canvaskit

# Deploy the build output
vercel build/web --prod
```

**Method B: Vercel Dashboard**
1. Go to [vercel.com](https://vercel.com) and import your GitHub repo
2. Set **Build Command**: `flutter build web --release --web-renderer canvaskit`
3. Set **Output Directory**: `build/web`
4. Set **Install Command**: 
   ```
   curl -fsSL https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.0-stable.tar.xz | tar -xJ -C /opt && export PATH=/opt/flutter/bin:$PATH && flutter pub get
   ```
5. Deploy — your site is live instantly with a `.vercel.app` domain.

---

### Option 3 — Firebase Hosting (Free tier)

```bash
# 1. Install Firebase CLI
npm install -g firebase-tools

# 2. Login
firebase login

# 3. Initialize (select Hosting, use build/web as public dir)
firebase init hosting

# 4. Build
flutter build web --release --web-renderer canvaskit

# 5. Deploy
firebase deploy --only hosting
```

Your site will be at: `https://YOUR_PROJECT.web.app`

---

## 🎨 Customization

### Colors
Edit `lib/app.dart` — the `ColorScheme` block:
```dart
primary: Color(0xFFE8FF47),    // Accent (yellow-green)
secondary: Color(0xFFFF6B35),  // Secondary accent (orange)
surface: Color(0xFF0A0A0A),    // Background
```

### Fonts
The app uses **Space Grotesk** via `google_fonts`. Change in `lib/app.dart`:
```dart
GoogleFonts.spaceGroteskTextTheme(...)
// → GoogleFonts.interTextTheme(...)
// → GoogleFonts.poppinsTextTheme(...)
```

### Adding Projects
In `lib/sections/portfolio_section.dart`, add to the `_projects` list:
```dart
{
  'title': 'My New Project',
  'category': 'Web',   // Mobile | Web | Open Source
  'desc': 'Project description...',
  'tech': ['Flutter', 'Firebase'],
  'color': 0xFF00D4AA,
  'icon': Icons.star_outline,
  'live': true,
  'featured': false,
},
```

---

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `google_fonts` | Space Grotesk typography |
| `animated_text_kit` | Typewriter effect in hero |
| `url_launcher` | External links |
| `visibility_detector` | Scroll-triggered animations |
| `font_awesome_flutter` | Social icons |

---

## 📄 License

MIT — free to use, modify, and deploy for personal or commercial use.
