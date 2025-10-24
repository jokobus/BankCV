# Banking CV Template

A clean, professional LaTeX CV template designed for banking and finance professionals. Features include:

- Modern, professional layout
- Clean typography using TeX Gyre Termes font
- Hyperlinked contact information
- Consistent spacing and margins
- Support for dense layout option
- Three-column skills section
- Section rules with customizable spacing
- Bullet point customization

## Prerequisites

- A LaTeX distribution (e.g., MiKTeX, TeX Live)
- Required packages:
  - geometry (page layout)
  - titlesec (section formatting)
  - enumitem (list customization)
  - multicol (skills section)
  - hyperref (clickable links)
  - textcase (section capitalization)
  - tgtermes (main font)
  - fontenc (font encoding)
  - parskip (paragraph spacing)
  - inputenc (input encoding)

## Usage

1. Place `bankingcv.cls` in the same directory as your CV tex file
2. Create your CV using the template structure:

```latex
\documentclass{bankingcv}
%\documentclass[10pt, a4paper, dense]{bankingcv}
\usepackage[utf8]{inputenc}

\begin{document}
    % Header with contact information
    \makeheader
        {Your Name}
        {City, Country}
        {+1-234-567-890}
        {email@example.com}
        {linkedin.com/in/yourusername}

    % Professional Experience
    \section{Professional Experience}
    
    \cventry
        {Company Name}
        {Location}
        {Job Title}
        {Start Date -- End Date}
    \begin{itemize}
        \item Achievement 1
        \item Achievement 2
    \end{itemize}

    % Education
    \section{Education}
    
    \cveduentry
        {University Name}
        {Location}
        {Degree Program}
        {Graduation Date}

    % Skills
    \section{Skills}
    
    \begin{skillslist}
        \item Skill 1
        \item Skill 2
        \item Skill 3
    \end{skillslist}
\end{document}
```

## Class Options

- Frequently used options: 
  - Font size: `8pt` to `12pt` (default `10pt`)
  - Paper format: `a4paper` (default) or `letters`
  - Spacing: none (default) or specify `dense` to use more compact spacing throughout
- Other options:
  - Any valid article class option is supported

## Commands

### Header
```latex
\makeheader{Name}{Location}{Phone}{Email}{LinkedIn/Github}
```
Creates the header section with contact information. The LinkedIn/Github URL should be provided without 'https://'.

### Experience Entry
```latex
\cventry{Company}{Location}{Title}{Date Range}
```
Creates an experience entry. Use with itemize environment for bullet points.

### Education Entry
```latex
\cveduentry{School}{Location}{Degree/Major}{Date}
```
Creates an education entry in a format matching the experience entries.

### Skills List
```latex
\begin{skillslist}
    \item Skill 1
    \item Skill 2
    \item Skill 3
\end{skillslist}
```
Creates a three-column list of skills.

## Customization

The template defines several length parameters that can be adjusted:

- Margins: 
  - `\cv@margin@top` (default: 2.5cm)
  - `\cv@margin@bottom` (default: 1cm)
  - `\cv@margin@left` (default: 2cm)
  - `\cv@margin@right` (default: 2cm)
- Header spacing:
  - `\cv@space@headerbreak` - Space after name
  - `\cv@space@afterheader` - Space after contact info
- Section spacing:
  - `\cv@space@sectionbefore` - Space before titles
  - `\cv@space@sectionrule` - Space after rules
  - `\cv@space@sectionafter` - Space after sections
- Entry spacing:
  - `\cv@space@cventrybefore/after` - Experience entries
  - `\cv@space@eduentrybefore/after` - Education entries
- List formatting:
  - `\cv@list@leftmargin` - Bullet list indentation
  - `\cv@space@itemsep` - Space between bullets
  - `\cv@space@skillslistbefore/after` - Skills section
  - `\cv@space@skillsitemsep` - Skills items spacing

To modify these, use `\setlength` in your document preamble:

```latex
\setlength{\cv@margin@left}{2.5cm}
```

## Compilation

Compile your CV using pdflatex:

```bash
pdflatex yourcv.tex
```

Run twice to ensure proper formatting and hyperlinks.

## License

This template is provided as-is for free use under the MIT License. You may modify and distribute it according to your needs, but please retain the original attribution.