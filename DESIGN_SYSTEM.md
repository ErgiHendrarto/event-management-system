# Design System Documentation

## 🎨 Visual Design Guide

### Color Palette

#### Primary Colors
```
Purple Gradient:
- Start: #667eea (rgb(102, 126, 234))
- End: #764ba2 (rgb(118, 75, 162))

Usage: Buttons, Headers, Accent elements
```

#### Secondary Colors
```
Indigo: #4f46e5
Blue: #3b82f6
Green: #10b981 (Success)
Red: #ef4444 (Error)
Orange: #f59e0b (Warning)
```

#### Neutral Colors
```
Gray Scale:
- gray-50: #f9fafb (Background)
- gray-100: #f3f4f6 (Cards background)
- gray-200: #e5e7eb (Borders)
- gray-600: #4b5563 (Text secondary)
- gray-900: #111827 (Text primary)

White: #ffffff
Black: #000000
```

### Typography

#### Font Family
```css
font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
```

#### Font Sizes
```
text-xs: 0.75rem (12px)     - Labels, badges
text-sm: 0.875rem (14px)    - Secondary text
text-base: 1rem (16px)      - Body text
text-lg: 1.125rem (18px)    - Subheadings
text-xl: 1.25rem (20px)     - Card titles
text-2xl: 1.5rem (24px)     - Section headers
text-3xl: 1.875rem (30px)   - Page titles
text-4xl: 2.25rem (36px)    - Hero headings
text-5xl: 3rem (48px)       - Main hero
```

#### Font Weights
```
font-light: 300
font-normal: 400
font-medium: 500
font-semibold: 600
font-bold: 700
font-extrabold: 800
```

### Spacing System

```
Padding/Margin Scale (Tailwind):
p-1: 0.25rem (4px)
p-2: 0.5rem (8px)
p-3: 0.75rem (12px)
p-4: 1rem (16px)
p-6: 1.5rem (24px)
p-8: 2rem (32px)
p-12: 3rem (48px)
p-16: 4rem (64px)
p-20: 5rem (80px)
```

### Border Radius

```
rounded: 0.25rem (4px)      - Small elements
rounded-md: 0.375rem (6px)  - Buttons, inputs
rounded-lg: 0.5rem (8px)    - Cards
rounded-xl: 0.75rem (12px)  - Large cards
rounded-2xl: 1rem (16px)    - Hero images
rounded-full: 9999px        - Circular elements
```

### Shadows

```
shadow-sm: 0 1px 2px rgba(0,0,0,0.05)
shadow: 0 1px 3px rgba(0,0,0,0.1)
shadow-md: 0 4px 6px rgba(0,0,0,0.1)
shadow-lg: 0 10px 15px rgba(0,0,0,0.1)
shadow-xl: 0 20px 25px rgba(0,0,0,0.1)
shadow-2xl: 0 25px 50px rgba(0,0,0,0.25)
```

## 🖼️ Component Designs

### 1. Navigation Bar

```
Height: 64px (h-16)
Background: White with blur effect (backdrop-filter)
Border: Bottom border gray-200
Sticky: Yes (sticky top-0)

Elements:
- Logo (40x40px with gradient background)
- Nav links (font-medium, gray-700)
- User avatar (40x40px, rounded-full)
- Dropdown menu (shadow-lg)
```

### 2. Hero Section

```
Background: Gradient (purple to indigo)
Height: Auto with padding (py-20)
Text Color: White

Layout:
- Grid: 2 columns on desktop
- Left: Text content
- Right: Feature image with rotation effect

Typography:
- Main heading: text-5xl font-bold
- Subtitle: text-xl text-purple-100
- CTA buttons: px-8 py-4
```

### 3. Event Card

```
Dimensions:
- Width: Full (responsive grid)
- Image height: 192px (h-48)
- Padding: 24px (p-6)

Structure:
[Image with overlay badges]
[Category + Date]
[Title (2 lines max)]
[Location icon + text]
[Capacity bar]
[Action button]

Hover Effect:
- translateY(-8px)
- shadow-xl
- transition: 0.3s ease
```

### 4. Buttons

#### Primary Button
```css
.btn-primary {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 12px 24px;
    border-radius: 8px;
    font-weight: 600;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}
```

#### Secondary Button
```css
.btn-secondary {
    background: white;
    color: #667eea;
    border: 2px solid #667eea;
    padding: 12px 24px;
    border-radius: 8px;
    font-weight: 600;
}
```

### 5. Form Inputs

```css
input, select, textarea {
    width: 100%;
    padding: 12px 16px;
    border: 1px solid #e5e7eb;
    border-radius: 8px;
    font-size: 16px;
}

input:focus {
    outline: none;
    border-color: #667eea;
    ring: 2px #667eea;
}
```

### 6. Badge Components

```
Category Badge:
- bg-purple-100
- text-purple-600
- px-3 py-1
- rounded-full
- text-sm font-semibold

Price Badge:
- bg-green-500 (free) or bg-purple-600 (paid)
- text-white
- px-3 py-1
- rounded-full
- text-sm font-semibold

Status Badge:
- bg-{color}-100
- text-{color}-600
- Similar structure
```

### 7. Cards

```css
.event-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    overflow: hidden;
}

.event-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0,0,0,0.1);
    transition: all 0.3s ease;
}
```

## 📐 Layout Patterns

### Grid Layouts

#### Event Grid
```html
<!-- Mobile: 1 column -->
<!-- Tablet: 2 columns -->
<!-- Desktop: 3 columns -->

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
    <!-- Event cards -->
</div>
```

#### Dashboard Stats
```html
<div class="grid grid-cols-2 md:grid-cols-4 gap-6">
    <!-- Stat cards -->
</div>
```

### Container Widths
```
max-w-7xl: 80rem (1280px) - Main content
max-w-4xl: 56rem (896px) - Narrow content
max-w-2xl: 42rem (672px) - Forms
```

### Responsive Breakpoints
```
sm: 640px
md: 768px
lg: 1024px
xl: 1280px
2xl: 1536px
```

## 🎭 Animation Classes

### Fade In
```css
.animate-fade-in {
    animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
```

### Card Hover
```css
.card-hover {
    transition: all 0.3s ease;
}

.card-hover:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
}
```

### Button Hover
```css
.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}
```

## 🖌️ Icon System

### Font Awesome Icons Used

```
Navigation:
- fa-calendar-alt (Logo)
- fa-th-large (Dashboard)
- fa-user (Profile)
- fa-sign-out-alt (Logout)

Events:
- fa-calendar-alt (Date)
- fa-map-marker-alt (Location)
- fa-users (Capacity)
- fa-ticket-alt (Registration)
- fa-tag (Price)

Actions:
- fa-search (Search)
- fa-filter (Filter)
- fa-edit (Edit)
- fa-trash (Delete)
- fa-share-alt (Share)

Status:
- fa-check-circle (Success)
- fa-exclamation-circle (Warning)
- fa-times-circle (Error)
- fa-info-circle (Info)

Social:
- fab fa-facebook-f
- fab fa-twitter
- fab fa-instagram
- fab fa-linkedin-in
```

### Icon Sizes
```
text-sm: 14px (small inline icons)
text-lg: 18px (button icons)
text-xl: 20px (card icons)
text-2xl: 24px (feature icons)
text-4xl: 36px (empty states)
```

## 🎨 Page-Specific Designs

### Homepage
- Hero section with gradient
- Search bar (elevated card)
- Featured events grid
- Category tiles
- Features section
- CTA section

### Events Listing
- Filter bar (sticky)
- Results count
- Event cards grid
- Pagination

### Event Detail
- Full-width hero image
- 2-column layout (content + sidebar)
- Sticky registration card
- Similar events carousel

### Dashboard
- Stats grid (4 columns)
- Charts section
- Recent activity list
- Quick actions

## 🔍 UI States

### Loading State
```html
<div class="animate-pulse">
    <div class="h-48 bg-gray-200 rounded-lg"></div>
    <div class="h-4 bg-gray-200 rounded mt-4"></div>
    <div class="h-4 bg-gray-200 rounded mt-2 w-3/4"></div>
</div>
```

### Empty State
```html
<div class="text-center py-20">
    <i class="fas fa-calendar-times text-5xl text-gray-400"></i>
    <h3 class="text-2xl font-bold text-gray-900 mt-6">No Events Found</h3>
    <p class="text-gray-600 mt-2">Try adjusting your filters</p>
</div>
```

### Error State
```html
<div class="bg-red-50 border-l-4 border-red-500 p-4 rounded-lg">
    <div class="flex items-center">
        <i class="fas fa-exclamation-circle text-red-500 text-xl mr-3"></i>
        <p class="text-red-700">Error message here</p>
    </div>
</div>
```

### Success State
```html
<div class="bg-green-50 border-l-4 border-green-500 p-4 rounded-lg">
    <div class="flex items-center">
        <i class="fas fa-check-circle text-green-500 text-xl mr-3"></i>
        <p class="text-green-700">Success message here</p>
    </div>
</div>
```

## 💡 Design Principles

1. **Consistency**
   - Use same spacing scale throughout
   - Consistent button styles
   - Uniform card designs

2. **Hierarchy**
   - Clear typographic hierarchy
   - Proper use of color for emphasis
   - Logical information structure

3. **Accessibility**
   - Sufficient color contrast (WCAG AA)
   - Keyboard navigation support
   - Screen reader friendly
   - Focus indicators

4. **Responsiveness**
   - Mobile-first approach
   - Flexible grids
   - Readable on all devices
   - Touch-friendly tap targets (min 44x44px)

5. **Performance**
   - Optimized images
   - Minimal animations
   - Fast loading times
   - Progressive enhancement

---

**This design system ensures consistency and professionalism throughout the application!** 🎨
