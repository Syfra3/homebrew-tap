# Syfra Homebrew Tap

Official Homebrew tap for Syfra tools.

## Usage

```bash
brew tap Syfra3/tap
brew install ancora
```

## Available Formulae

- **ancora** - Persistent memory for AI coding agents

## Setup Instructions

This tap is automatically used by the Syfra distribution system. If you need to set it up as a separate GitHub repository:

1. Create a new GitHub repository: `Syfra3/homebrew-tap`
2. Copy the contents of this `homebrew-tap/` directory to the root of that repository
3. Push to GitHub
4. The tap will be available at `Syfra3/tap`

## Updating Formulae

Formulae are automatically updated by the release workflow in the main Syfra repository. SHA256 checksums are computed and inserted during the release process.

## Manual Updates

If you need to manually update a formula:

1. Download the release tarball
2. Compute SHA256: `sha256sum ancora-*.tar.gz`
3. Update the formula file with new version and SHA256
4. Commit and push

## License

MIT
