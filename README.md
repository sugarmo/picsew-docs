# Picsew Documentation (MkDocs)

This directory contains the MkDocs version of the Picsew documentation website with multi-language support.

## Features

- **Multi-language Support**: English, 简体中文, 繁體中文, 日本語
- **Material Design**: Modern and responsive interface
- **Image Assets**: Shared across all languages
- **GitHub Pages Ready**: Configured for automatic deployment

## Development Setup

### Prerequisites
- Python 3.8 or higher
- pip

### Installation

1. **Create virtual environment**:
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

2. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

3. **Start development server**:
   ```bash
   mkdocs serve
   ```

4. **Open browser**: http://127.0.0.1:8000/

### Building for Production

```bash
mkdocs build
```

The static files will be generated in the `site/` directory.

## Project Structure

```
mkdocs/
├── mkdocs.yml          # Configuration file
├── requirements.txt    # Python dependencies
├── docs/               # Documentation source
│   ├── index.md        # English homepage
│   ├── assets/         # Shared images
│   ├── zh/             # 简体中文
│   ├── zh-hant/        # 繁體中文
│   └── ja/             # 日本語
├── site/               # Built website (generated)
└── venv/               # Virtual environment (not in git)
```

## Language Structure

Each language has its own directory with:
- Localized navigation menus
- Translated content
- Language-specific homepage
- Shared image assets (using `/assets/` paths)

## Deployment

The site is configured for GitHub Pages deployment using GitHub Actions. The workflow is defined in `.github/workflows/deploy.yml`.

## Adding New Content

1. Add the markdown file to all language directories
2. Update the navigation in `mkdocs.yml` for each language
3. Ensure image paths use `/assets/filename.jpg` format

## Notes

- **Virtual Environment**: The `venv/` directory is excluded from Git
- **Dependencies**: Use `requirements.txt` to track Python package dependencies
- **Images**: All images use absolute paths (`/assets/`) for compatibility with local preview and deployment
- **Build Output**: The `site/` directory is also excluded from Git as it's generated during deployment