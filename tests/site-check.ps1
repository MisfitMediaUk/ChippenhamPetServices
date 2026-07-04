$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$indexPath = Join-Path $root 'index.html'
$robotsPath = Join-Path $root 'robots.txt'
$sitemapPath = Join-Path $root 'sitemap.xml'
$faviconPath = Join-Path $root 'favicon.svg'
$logoPath = Join-Path $root 'logo-primary.svg'
$serviceDogPath = Join-Path $root 'dog-services.svg'
$portraitPath = Join-Path $root 'dog-portrait.png'

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
if (-not (Test-Path $logoPath)) { throw 'Missing logo-primary.svg' }
if (-not (Test-Path $serviceDogPath)) { throw 'Missing dog-services.svg' }
if (-not (Test-Path $portraitPath)) { throw 'Missing dog-portrait.png' }

$html = Get-Content $indexPath -Raw
$robots = Get-Content $robotsPath -Raw
$sitemap = Get-Content $sitemapPath -Raw
$favicon = Get-Content $faviconPath -Raw
$logo = Get-Content $logoPath -Raw
$serviceDog = Get-Content $serviceDogPath -Raw

Assert-Contains $html '<title>' 'Missing page title'
Assert-Contains $html 'meta name="description"' 'Missing meta description'
Assert-Contains $html 'href="tel:01234567890"' 'Missing phone link'
Assert-Contains $html 'id="services"' 'Missing services section'
Assert-Contains $html 'id="pricing"' 'Missing pricing section'
Assert-Contains $html 'id="about"' 'Missing about section'
Assert-Contains $html 'id="coverage"' 'Missing coverage section'
Assert-Contains $html 'id="contact"' 'Missing contact section'
Assert-Contains $html 'favicon.svg' 'Missing favicon reference'
Assert-Contains $html 'logo-primary.svg' 'Missing primary logo reference'
Assert-Contains $html 'dog-portrait.png' 'Missing portrait dog image reference'
Assert-Contains $html 'full-bleed' 'Missing full-width layout treatment'
Assert-Contains $html '--mustard' 'Missing mustard accent color'
Assert-Contains $html '£14' 'Missing pound pricing format'
Assert-Contains $html 'price-card' 'Missing price card markup'
Assert-Contains $html 'align-self: end' 'Missing bottom-aligned pricing layout'
if ($html.Contains('dog-services.svg')) { throw 'Unexpected doodle image reference' }
Assert-Contains $robots 'User-agent: *' 'robots.txt missing user-agent rule'
Assert-Contains $robots 'Sitemap:' 'robots.txt missing sitemap reference'
Assert-Contains $sitemap '<urlset' 'sitemap.xml missing urlset'
Assert-Contains $sitemap '<loc>' 'sitemap.xml missing loc entry'
Assert-Contains $favicon '<svg' 'favicon.svg missing svg root'
Assert-Contains $logo '<svg' 'logo-primary.svg missing svg root'
Assert-Contains $serviceDog '<svg' 'dog-services.svg missing svg root'

Write-Host 'PASS: static site smoke checks'
