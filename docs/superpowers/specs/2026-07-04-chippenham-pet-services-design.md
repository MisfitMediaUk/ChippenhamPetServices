# Chippenham Pet Services Design

## Overview

This project is a simple one-page marketing website for a local pet walking and pet sitting service in Chippenham and nearby villages. The first draft is intended to give the client something polished to review, using placeholder service descriptions, pricing, and supporting imagery where needed.

The site will be a static, hand-built page with no framework or build step. It should feel fresh, clean, local, natural, and friendly, reflecting a one-person service rather than a larger commercial brand.

## Goals

- Present the business as warm, reliable, and personal
- Make the main call to action a phone call
- Work cleanly on mobile, tablet, and desktop
- Use a heart-and-pets visual theme based on the provided logo concepts
- Include enough example content for review without depending on final copy
- Provide basic search engine discovery files for launch readiness

## Non-Goals

- No contact form
- No booking system
- No CMS or editable backend
- No multi-page structure beyond a single landing page and supporting SEO files
- No dependency on external libraries or frameworks

## Audience

The primary audience is local pet owners looking for a trustworthy individual to care for their pets. The page should reassure visitors quickly and make it easy to call.

## Brand Direction

The visual direction is based on the two provided logo concepts:

- Deep woodland green as the primary brand color
- Warm cream and soft natural tones for backgrounds
- A heart-and-pets motif used as a recurring visual cue
- A local, natural, lightly editorial feel rather than a corporate or tech-styled layout

The final design should lean more toward the heart-and-pets symbol than either exact logo composition. The favicon should be a simplified heart-and-pets mark derived from the same theme.

## Tone of Voice

The copy should sound like one caring local person offering dependable pet care. The tone should be:

- Friendly
- Calm
- Reassuring
- Personal
- Straightforward

The site should avoid corporate claims, sales-heavy wording, or generic service-business language.

## Site Structure

The website will consist of a single `index.html` page with anchored sections:

1. Hero
2. Services
3. Pricing
4. About
5. Coverage Area
6. Contact

Supporting root-level files:

- `robots.txt`
- `sitemap.xml`
- Favicon asset or assets

## Section Requirements

### Hero

The hero should establish trust immediately and make the service clear. It should include:

- Brand/logo treatment
- Short headline focused on gentle, reliable pet care
- Brief supporting copy
- Primary call-to-action button using `tel:01234567890`
- Secondary prompt to scroll to services or pricing if useful

The hero should feel spacious and welcoming on mobile first, with stronger visual composition on tablet and desktop.

### Services

This section should include example services suitable for review, such as:

- Dog walking
- Pet sitting
- Pop-in visits
- Holiday care

Each service should have a short description written as template copy that the client can later adjust.

### Pricing

The pricing section should show clear example pricing with the understanding that it is indicative. This must be obvious in the wording so the client can safely review layout and service framing without treating the prices as final.

Example services should have a small, scannable structure, such as:

- Service name
- Duration or visit type
- Example starting price

### About

This section should reinforce the one-person nature of the service. It should describe the business as local, caring, dependable, and attentive to each pet's routine and personality.

The copy may reference calm routines, tailored care, and peace of mind for owners, but should avoid inventing unverified credentials or claims.

### Coverage Area

The site should assume service coverage is:

- Chippenham
- Nearby villages

This wording should stay broad enough for the client to refine later, while still feeling locally grounded.

### Contact

The only contact method for this version is phone. The contact section should repeat the call-to-action clearly and keep the next step simple:

- Call link or button using `tel:01234567890`
- Displayed placeholder number `01234567890`
- Short invitation to call and discuss the pet's needs

No contact form or email address should be included.

## Visual Design

### Layout

The layout should be clean and modern, but softened with natural styling. It should use:

- Generous spacing
- Rounded cards or panels
- Organic separators or subtle curved shapes
- A clear reading order with strong section rhythm

The design should avoid looking overly rustic, cluttered, or template-generic.

### Color

Recommended palette direction:

- Deep green for headings, buttons, and key accents
- Cream or warm off-white for the main background
- Muted sage for cards or supporting surfaces
- A restrained warm accent for highlights if needed

### Typography

Typography should balance warmth and clarity:

- A script-style accent may be used for brand treatment only
- Headings should use a refined serif or soft serif
- Body text should use a clean, highly readable sans-serif

The typography should remain accessible and legible on small screens.

### Imagery

The page may include light supporting visuals if they improve the presentation, such as:

- Soft pet-themed illustrations
- Abstract natural shapes
- Minimal decorative line art

Imagery should support the design rather than dominate it. The client already has logo concepts, so the overall composition should not compete with the branding.

## Responsive Behavior

The page must be designed mobile first and remain polished on tablets.

Responsive expectations:

- Mobile: single-column layout, generous tap targets, concise spacing
- Tablet: two-column sections where appropriate, stronger hero balance
- Desktop: wider spacing and more visual breathing room without feeling sparse

Navigation, buttons, pricing cards, and section spacing should all remain easy to use on touch devices.

## Technical Approach

- Single static `index.html`
- CSS embedded in the document unless a separate stylesheet becomes clearly beneficial during implementation
- Minimal or no JavaScript
- No framework, package manager, or build tooling
- Local assets only

This keeps the project easy to preview, edit, and deploy.

## SEO and Discovery

The page should include basic on-page SEO setup:

- Descriptive page title
- Meta description
- Sensible heading structure
- Social preview metadata if practical within the static page

Supporting files:

- `robots.txt`
- `sitemap.xml`

The live domain is already owned, but the final domain string has not yet been provided. Implementation should therefore keep any absolute URLs easy to update later.

## Accessibility and Quality

The implementation should aim for:

- Semantic HTML structure
- Sufficient color contrast
- Accessible link and button labels
- Mobile-friendly tap areas
- Sensible alt text for meaningful visuals

The phone link must work correctly and be easy to find more than once on the page.

## Content Assumptions

The following are approved placeholders for the first draft:

- Phone number: `01234567890`
- Coverage area: Chippenham and nearby villages
- Services: generated template content
- Pricing: generated example pricing
- Supporting imagery: generated or simplified visuals if needed

These assumptions are intentional and should be easy to replace later.

## Deliverables

The first implementation pass should produce:

- A complete one-page website in `index.html`
- Responsive styling suitable for mobile and tablet
- A favicon based on the heart-and-pets motif
- `robots.txt`
- `sitemap.xml`

## Testing Expectations

Quality checks during implementation should confirm:

- Internal section links work
- `tel:01234567890` links work
- Layout remains readable on mobile and tablet widths
- The content hierarchy is clear
- The page has no dependency on external frameworks or runtime services

## Open Items For Later Review

These are intentionally deferred for client review after the draft exists:

- Final phone number
- Final domain string for canonical URLs and sitemap
- Final pricing
- Final service wording
- Final logo selection or refinement
