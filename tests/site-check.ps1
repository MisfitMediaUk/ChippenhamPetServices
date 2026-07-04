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
