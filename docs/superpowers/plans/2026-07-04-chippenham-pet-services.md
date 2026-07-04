# Chippenham Pet Services Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a polished one-page static website for Chippenham Pet Services with responsive layout, placeholder local-service copy, favicon, `robots.txt`, `sitemap.xml`, and a phone-first contact flow.

**Architecture:** The site will be a single hand-authored `index.html` file containing semantic HTML and embedded CSS, plus a small set of root-level support files. A lightweight PowerShell smoke-test script will verify the static deliverables, required sections, and key SEO/contact links without introducing a frontend toolchain.

**Tech Stack:** HTML5, CSS3, SVG favicon asset, PowerShell smoke tests, Git

---

## File Structure

- Create: `C:\Users\john\Documents\Chippenham Pet Services\index.html`
  Purpose: The full one-page website, including semantic structure, embedded CSS, responsive layout, placeholder content, and any tiny optional JavaScript.

- Create: `C:\Users\john\Documents\Chippenham Pet Services\favicon.svg`
  Purpose: Simplified heart-and-pets favicon matching the approved brand direction.

- Create: `C:\Users\john\Documents\Chippenham Pet Services\robots.txt`
  Purpose: Crawl guidance for search engines for the static site root.

- Create: `C:\Users\john\Documents\Chippenham Pet Services\sitemap.xml`
  Purpose: Sitemap containing the homepage URL placeholder structure, easy to update once the final domain is confirmed.

- Create: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`
  Purpose: Lightweight automated smoke test for required sections, phone link, favicon reference, and SEO support files.

## Task 1: Create the Static Site Smoke Tests First

**Files:**
- Create: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`
- Test: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`

- [ ] **Step 1: Write the failing smoke test script**

```powershell
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$indexPath = Join-Path $root 'index.html'
$robotsPath = Join-Path $root 'robots.txt'
$sitemapPath = Join-Path $root 'sitemap.xml'
$faviconPath = Join-Path $root 'favicon.svg'

function Assert-Contains {
    param(
        [string]$Content,
        [string]$Expected,
        [string]$Message
    )

    if (-not $Content.Contains($Expected)) {
        throw $Message
    }
}

if (-not (Test-Path $indexPath)) { throw 'Missing index.html' }
if (-not (Test-Path $robotsPath)) { throw 'Missing robots.txt' }
if (-not (Test-Path $sitemapPath)) { throw 'Missing sitemap.xml' }
if (-not (Test-Path $faviconPath)) { throw 'Missing favicon.svg' }

$html = Get-Content $indexPath -Raw
$robots = Get-Content $robotsPath -Raw
$sitemap = Get-Content $sitemapPath -Raw
$favicon = Get-Content $faviconPath -Raw

Assert-Contains $html '<title>' 'Missing page title'
Assert-Contains $html 'meta name="description"' 'Missing meta description'
Assert-Contains $html 'href="tel:01234567890"' 'Missing phone link'
Assert-Contains $html 'id="services"' 'Missing services section'
Assert-Contains $html 'id="pricing"' 'Missing pricing section'
Assert-Contains $html 'id="about"' 'Missing about section'
Assert-Contains $html 'id="coverage"' 'Missing coverage section'
Assert-Contains $html 'id="contact"' 'Missing contact section'
Assert-Contains $html 'favicon.svg' 'Missing favicon reference'
Assert-Contains $robots 'User-agent: *' 'robots.txt missing user-agent rule'
Assert-Contains $robots 'Sitemap:' 'robots.txt missing sitemap reference'
Assert-Contains $sitemap '<urlset' 'sitemap.xml missing urlset'
Assert-Contains $sitemap '<loc>' 'sitemap.xml missing loc entry'
Assert-Contains $favicon '<svg' 'favicon.svg missing svg root'

Write-Host 'PASS: static site smoke checks'
```

- [ ] **Step 2: Run the test to verify it fails**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\site-check.ps1`

Expected: FAIL with `Missing index.html`

- [ ] **Step 3: Create the minimal test directory and script**

```powershell
New-Item -ItemType Directory -Path .\tests -Force | Out-Null
Set-Content -Path .\tests\site-check.ps1 -Value @'
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$indexPath = Join-Path $root 'index.html'
$robotsPath = Join-Path $root 'robots.txt'
$sitemapPath = Join-Path $root 'sitemap.xml'
$faviconPath = Join-Path $root 'favicon.svg'

function Assert-Contains {
    param(
        [string]$Content,
        [string]$Expected,
        [string]$Message
    )

    if (-not $Content.Contains($Expected)) {
        throw $Message
    }
}

if (-not (Test-Path $indexPath)) { throw 'Missing index.html' }
if (-not (Test-Path $robotsPath)) { throw 'Missing robots.txt' }
if (-not (Test-Path $sitemapPath)) { throw 'Missing sitemap.xml' }
if (-not (Test-Path $faviconPath)) { throw 'Missing favicon.svg' }

$html = Get-Content $indexPath -Raw
$robots = Get-Content $robotsPath -Raw
$sitemap = Get-Content $sitemapPath -Raw
$favicon = Get-Content $faviconPath -Raw

Assert-Contains $html '<title>' 'Missing page title'
Assert-Contains $html 'meta name="description"' 'Missing meta description'
Assert-Contains $html 'href="tel:01234567890"' 'Missing phone link'
Assert-Contains $html 'id="services"' 'Missing services section'
Assert-Contains $html 'id="pricing"' 'Missing pricing section'
Assert-Contains $html 'id="about"' 'Missing about section'
Assert-Contains $html 'id="coverage"' 'Missing coverage section'
Assert-Contains $html 'id="contact"' 'Missing contact section'
Assert-Contains $html 'favicon.svg' 'Missing favicon reference'
Assert-Contains $robots 'User-agent: *' 'robots.txt missing user-agent rule'
Assert-Contains $robots 'Sitemap:' 'robots.txt missing sitemap reference'
Assert-Contains $sitemap '<urlset' 'sitemap.xml missing urlset'
Assert-Contains $sitemap '<loc>' 'sitemap.xml missing loc entry'
Assert-Contains $favicon '<svg' 'favicon.svg missing svg root'

Write-Host 'PASS: static site smoke checks'
'@
```

- [ ] **Step 4: Run the test again to verify it still fails for the expected reason**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\site-check.ps1`

Expected: FAIL with `Missing index.html`

- [ ] **Step 5: Commit**

```bash
git add tests/site-check.ps1
git commit -m "test: add static site smoke checks"
```

## Task 2: Build the Supporting SEO and Favicon Assets

**Files:**
- Create: `C:\Users\john\Documents\Chippenham Pet Services\favicon.svg`
- Create: `C:\Users\john\Documents\Chippenham Pet Services\robots.txt`
- Create: `C:\Users\john\Documents\Chippenham Pet Services\sitemap.xml`
- Test: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`

- [ ] **Step 1: Create the minimal favicon and SEO support files**

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" role="img" aria-label="Chippenham Pet Services favicon">
  <rect width="64" height="64" rx="14" fill="#f5efe3"/>
  <path d="M32 54C20 46 12 38 12 27c0-7 5-12 12-12 4 0 7 2 8 5 1-3 4-5 8-5 7 0 12 5 12 12 0 11-8 19-20 27Z" fill="#1f5b3a"/>
  <circle cx="24" cy="29" r="4" fill="#f5efe3"/>
  <circle cx="40" cy="29" r="4" fill="#f5efe3"/>
  <path d="M27 40c2-3 8-3 10 0" stroke="#f5efe3" stroke-width="3" stroke-linecap="round" fill="none"/>
</svg>
```

```text
User-agent: *
Allow: /
Sitemap: https://www.example.com/sitemap.xml
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.example.com/</loc>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
</urlset>
```

- [ ] **Step 2: Save the support files**

```powershell
Set-Content -Path .\favicon.svg -Value @'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" role="img" aria-label="Chippenham Pet Services favicon">
  <rect width="64" height="64" rx="14" fill="#f5efe3"/>
  <path d="M32 54C20 46 12 38 12 27c0-7 5-12 12-12 4 0 7 2 8 5 1-3 4-5 8-5 7 0 12 5 12 12 0 11-8 19-20 27Z" fill="#1f5b3a"/>
  <circle cx="24" cy="29" r="4" fill="#f5efe3"/>
  <circle cx="40" cy="29" r="4" fill="#f5efe3"/>
  <path d="M27 40c2-3 8-3 10 0" stroke="#f5efe3" stroke-width="3" stroke-linecap="round" fill="none"/>
</svg>
'@

Set-Content -Path .\robots.txt -Value @'
User-agent: *
Allow: /
Sitemap: https://www.example.com/sitemap.xml
'@

Set-Content -Path .\sitemap.xml -Value @'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://www.example.com/</loc>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
</urlset>
'@
```

- [ ] **Step 3: Run the smoke test to verify the next failure**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\site-check.ps1`

Expected: FAIL with `Missing index.html`

- [ ] **Step 4: Commit**

```bash
git add favicon.svg robots.txt sitemap.xml
git commit -m "feat: add favicon and SEO support files"
```

## Task 3: Build the Page Skeleton and Core SEO Metadata

**Files:**
- Create: `C:\Users\john\Documents\Chippenham Pet Services\index.html`
- Test: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`

- [ ] **Step 1: Write the minimal HTML that should satisfy the smoke test structure**

```html
<!DOCTYPE html>
<html lang="en-GB">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Chippenham Pet Services | Pet Walking and Sitting</title>
  <meta name="description" content="Friendly, reliable pet care in Chippenham and nearby villages, with dog walking, pet sitting, and pop-in visits.">
  <link rel="icon" href="favicon.svg" type="image/svg+xml">
</head>
<body>
  <header>
    <a href="#contact">Call now</a>
  </header>
  <main>
    <section id="services"></section>
    <section id="pricing"></section>
    <section id="about"></section>
    <section id="coverage"></section>
    <section id="contact">
      <a href="tel:01234567890">01234567890</a>
    </section>
  </main>
</body>
</html>
```

- [ ] **Step 2: Save the minimal HTML skeleton**

```powershell
Set-Content -Path .\index.html -Value @'
<!DOCTYPE html>
<html lang="en-GB">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Chippenham Pet Services | Pet Walking and Sitting</title>
  <meta name="description" content="Friendly, reliable pet care in Chippenham and nearby villages, with dog walking, pet sitting, and pop-in visits.">
  <link rel="icon" href="favicon.svg" type="image/svg+xml">
</head>
<body>
  <header>
    <a href="#contact">Call now</a>
  </header>
  <main>
    <section id="services"></section>
    <section id="pricing"></section>
    <section id="about"></section>
    <section id="coverage"></section>
    <section id="contact">
      <a href="tel:01234567890">01234567890</a>
    </section>
  </main>
</body>
</html>
'@
```

- [ ] **Step 3: Run the smoke test to verify it passes**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\site-check.ps1`

Expected: PASS with `PASS: static site smoke checks`

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "feat: add page skeleton and metadata"
```

## Task 4: Implement the Final Layout, Styling, and Responsive Structure

**Files:**
- Modify: `C:\Users\john\Documents\Chippenham Pet Services\index.html`
- Test: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`

- [ ] **Step 1: Expand the page into the final semantic layout**

```html
<body>
  <a class="skip-link" href="#main-content">Skip to content</a>
  <header class="site-header">
    <div class="brand">
      <img src="favicon.svg" alt="" width="56" height="56">
      <div class="brand-copy">
        <p class="eyebrow">Chippenham and nearby villages</p>
        <h1>Gentle, reliable pet care with a personal touch</h1>
      </div>
    </div>
    <nav class="site-nav" aria-label="Primary">
      <a href="#services">Services</a>
      <a href="#pricing">Pricing</a>
      <a href="#about">About</a>
      <a href="#coverage">Coverage</a>
      <a class="button button-secondary" href="#contact">Contact</a>
    </nav>
  </header>

  <main id="main-content">
    <section class="hero">
      <div class="hero-copy">
        <p class="kicker">Friendly local pet care</p>
        <h2>Walking, sitting, and pop-in visits tailored to your pet's routine.</h2>
        <p>Chippenham Pet Services offers calm, dependable care for dogs, cats, and small pets, with one-to-one support designed around each home and personality.</p>
        <div class="hero-actions">
          <a class="button button-primary" href="tel:01234567890">Call 01234567890</a>
          <a class="button button-link" href="#services">View services</a>
        </div>
      </div>
      <div class="hero-panel" aria-hidden="true"></div>
    </section>

    <section id="services" class="section"></section>
    <section id="pricing" class="section"></section>
    <section id="about" class="section"></section>
    <section id="coverage" class="section"></section>
    <section id="contact" class="section"></section>
  </main>
</body>
```

- [ ] **Step 2: Add the embedded CSS system for mobile-first responsive design**

```css
:root {
  --bg: #f6efe4;
  --bg-soft: #fbf7f0;
  --surface: rgba(255, 255, 255, 0.74);
  --surface-strong: #fffdf9;
  --text: #163b28;
  --muted: #4f6d5b;
  --accent: #1f5b3a;
  --accent-soft: #dbe8dc;
  --warm: #d9b98f;
  --border: rgba(31, 91, 58, 0.14);
  --shadow: 0 24px 60px rgba(22, 59, 40, 0.12);
  --radius: 28px;
  --container: min(1120px, calc(100% - 2rem));
}

* { box-sizing: border-box; }
html { scroll-behavior: smooth; }
body {
  margin: 0;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  color: var(--text);
  background:
    radial-gradient(circle at top left, rgba(219, 232, 220, 0.75), transparent 34%),
    radial-gradient(circle at right 20%, rgba(217, 185, 143, 0.18), transparent 28%),
    var(--bg);
}

.site-header,
.section,
.hero {
  width: var(--container);
  margin: 0 auto;
}

.button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 48px;
  padding: 0.85rem 1.25rem;
  border-radius: 999px;
  text-decoration: none;
  font-weight: 600;
}

.button-primary {
  color: #fff;
  background: var(--accent);
  box-shadow: var(--shadow);
}

.button-secondary {
  color: var(--accent);
  background: rgba(255, 255, 255, 0.78);
}

@media (min-width: 720px) {
  .hero {
    display: grid;
    grid-template-columns: 1.1fr 0.9fr;
    gap: 2rem;
    align-items: center;
  }

  .service-grid,
  .pricing-grid,
  .trust-grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1.25rem;
  }
}
```

- [ ] **Step 3: Run the smoke test to confirm structure remains valid**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\site-check.ps1`

Expected: PASS with `PASS: static site smoke checks`

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "feat: add responsive page layout and styles"
```

## Task 5: Add Final Content for Services, Pricing, Trust, Coverage, and Contact

**Files:**
- Modify: `C:\Users\john\Documents\Chippenham Pet Services\index.html`
- Test: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`

- [ ] **Step 1: Add the placeholder service and pricing content**

```html
<section id="services" class="section">
  <div class="section-heading">
    <p class="kicker">Services</p>
    <h2>Flexible care for daily routines, busy weeks, and time away.</h2>
  </div>
  <div class="service-grid">
    <article class="card">
      <h3>Dog walking</h3>
      <p>Solo or small-group walks designed around pace, confidence, and routine.</p>
    </article>
    <article class="card">
      <h3>Pop-in visits</h3>
      <p>Feeding, fresh water, cuddles, litter checks, and a reassuring visit while you're out.</p>
    </article>
    <article class="card">
      <h3>Pet sitting</h3>
      <p>Calm home-based care to help pets stay settled in familiar surroundings.</p>
    </article>
    <article class="card">
      <h3>Holiday support</h3>
      <p>Planned visits and updates to keep routines comfortable while you're away.</p>
    </article>
  </div>
</section>

<section id="pricing" class="section">
  <div class="section-heading">
    <p class="kicker">Example pricing</p>
    <h2>Simple guide prices for review.</h2>
    <p class="section-note">These example prices are placeholders and can be adjusted after client review.</p>
  </div>
  <div class="pricing-grid">
    <article class="price-card">
      <h3>30 minute dog walk</h3>
      <p class="price">From £14</p>
    </article>
    <article class="price-card">
      <h3>60 minute dog walk</h3>
      <p class="price">From £22</p>
    </article>
    <article class="price-card">
      <h3>Pop-in visit</h3>
      <p class="price">From £12</p>
    </article>
    <article class="price-card">
      <h3>Pet sitting</h3>
      <p class="price">From £18 per visit</p>
    </article>
  </div>
</section>
```

- [ ] **Step 2: Add the personal trust, coverage, and contact content**

```html
<section id="about" class="section">
  <div class="section-heading">
    <p class="kicker">About</p>
    <h2>Personal care built around each pet.</h2>
  </div>
  <div class="trust-grid">
    <article class="card">
      <h3>One familiar person</h3>
      <p>Pets benefit from calm, consistent care, so the service is presented as friendly, local, and one-to-one.</p>
    </article>
    <article class="card">
      <h3>Routine-led visits</h3>
      <p>Walks and visits are shaped around feeding times, confidence levels, and the little habits that help pets feel secure.</p>
    </article>
  </div>
</section>

<section id="coverage" class="section">
  <div class="section-heading">
    <p class="kicker">Coverage area</p>
    <h2>Serving Chippenham and nearby villages.</h2>
    <p>Ideal for pet owners looking for reliable local support close to home.</p>
  </div>
</section>

<section id="contact" class="section contact-panel">
  <div>
    <p class="kicker">Contact</p>
    <h2>Call to chat about your pet and the care you need.</h2>
    <p>If you'd like to talk through walks, visits, or a regular routine, call anytime to start the conversation.</p>
  </div>
  <a class="button button-primary" href="tel:01234567890">Call 01234567890</a>
</section>
```

- [ ] **Step 3: Run the smoke test to verify the full content still passes**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\site-check.ps1`

Expected: PASS with `PASS: static site smoke checks`

- [ ] **Step 4: Commit**

```bash
git add index.html
git commit -m "feat: add final site content and pricing"
```

## Task 6: Final Verification and Preview Readiness

**Files:**
- Modify: `C:\Users\john\Documents\Chippenham Pet Services\index.html` if verification reveals a defect
- Modify: `C:\Users\john\Documents\Chippenham Pet Services\robots.txt` if verification reveals a defect
- Modify: `C:\Users\john\Documents\Chippenham Pet Services\sitemap.xml` if verification reveals a defect
- Test: `C:\Users\john\Documents\Chippenham Pet Services\tests\site-check.ps1`

- [ ] **Step 1: Run the automated smoke check**

Run: `powershell -ExecutionPolicy Bypass -File .\tests\site-check.ps1`

Expected: PASS with `PASS: static site smoke checks`

- [ ] **Step 2: Run a manual HTML sanity inspection**

Run: `Get-Content .\index.html -First 80`

Expected: Visible title, meta description, favicon link, hero content, and embedded CSS opening block

- [ ] **Step 3: Check git status before close-out**

Run: `git status --short`

Expected: clean working tree

- [ ] **Step 4: Commit any final verification fixes if needed**

```bash
git add index.html robots.txt sitemap.xml tests/site-check.ps1 favicon.svg
git commit -m "chore: finalize static site draft"
```
