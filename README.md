# BankCV – Professional Banking CV Class

A modern, professional LaTeX CV template widely used in banking, finance, consulting, and STEM fields. Popular in both corporate and academic settings across the US and internationally, this template combines clean typography with consistent spacing and extensive customization options to create compelling resumes for any profession.

## Features

- Clean, professional layout with customizable fonts
- Flexible header with optional FontAwesome icons
- Hyperlinked contact information with location mapping
- Customizable spacing and margins
- Support for dense layout and custom density
- Three-column skills section
- Section rules with configurable spacing
- Smart bullet point formatting
- LinkedIn and GitHub integration

## Quick Start

1. Place `bankcv.cls` in your tex file's directory
2. Modify `bankcv.tex`
3. Compile
    ```bash
    pdflatex bankcv.tex
    ```

## Class Options
```latex
\documentclass[serif, 10pt, a4paper, dense, density=1.0]{bankcv}
```
- Font style: `serif` (default, TeX Gyre Termes) or `sansserif` (Helvetica)
- Font size: `8pt`, `9pt`, `10pt` (default), `11pt`, `12pt`
- Paper: `a4paper` (default), `letterpaper` (or other)
- Layout: `dense` for compact spacing
- Density: `density=<value>` for custom spacing scale (default 1.0)
- All standard article class options supported

## Commands

### Header
```latex
\makeheader[icons]{name}[location][mapurl][phone]{email}[linkedin][github]
```
- `icons`: Optional boolean for FontAwesome icons (true/false, default: false)
- Required: `name`, `email`
- Optional: `location`, `mapurl`, `phone`, `linkedin`, `github`
- URLs should not include `https://` as they will be made clickable automatically

### Section
```latex
\section{About Me}
	\vspace{\cventrybefore}
	Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
```
Note: When a section is followed directly by a text block (rather than a list or entry), add `\vspace{\cventrybefore}` after the section to maintain consistent spacing. This is the only special spacing adjustment needed in the template.

### Experience Entry
```latex
\cventry{company}{location}{title}{dates}

\begin{itemize}
  \item Description
  ...
\end{itemize}
```

### Education Entry
```latex
\cveduentry{school}{location}{degree}{date}

\begin{itemize}
  \item Description
  ...
\end{itemize}
```

### Skills List
```latex
\begin{skillslist}[columns]
    \item Skill 1
    ...
\end{skillslist}
```
Default is 3 columns, but can be changed to your liking. 

## Dependencies

This template requires the following LaTeX packages:

Layout and Structure:
- `geometry` - Page layout and margins
- `titlesec` - Section formatting
- `multicol` - Multi-column layout support
- `enumitem` - List customization

Typography:
- `fontenc` - Font encoding
- `tgtermes` - TeX Gyre Termes font (serif option)
- `helvet` - Helvetica font (sans-serif option)
- `fontawesome5` - Icons for contact information

Functionality:
- `hyperref` - Clickable links and URLs
- `xargs` - Extended command definitions

Most of these packages are included in standard LaTeX distributions.

## License

MIT License - See LICENSE file.