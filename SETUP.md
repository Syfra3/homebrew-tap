# Homebrew Tap Setup

Instructions for setting up the Homebrew tap as a separate GitHub repository.

## Why a Separate Repository?

Homebrew convention requires tap repositories to be named `homebrew-{tap-name}` and contain only formula files at the root or in `Formula/` directory. This separation also:

- Keeps main repo lean
- Allows independent CI/CD for formula updates
- Follows Homebrew best practices

## One-Time Setup

### 1. Create GitHub Repository

```bash
# Via GitHub CLI
gh repo create Syfra3/homebrew-tap --public --description "Homebrew tap for Syfra tools"

# Or manually via GitHub web UI:
# Name: homebrew-tap
# Owner: Syfra3
# Public repository
```

### 2. Initialize and Push

```bash
# From the syfra repo root
cd homebrew-tap

# Initialize git (if not already done)
git init
git add .
git commit -m "Initial Homebrew tap for Syfra tools"

# Add remote and push
git remote add origin https://github.com/Syfra3/homebrew-tap.git
git branch -M main
git push -u origin main
```

### 3. Verify Tap Works

```bash
# Tap the repository
brew tap Syfra3/tap

# Try installing (after first release exists)
brew install ancora

# Check installation
ancora --version
```

## Updating the Formula

After each release, update the formula with new version and checksums.

### Manual Method

```bash
# 1. Download release tarballs for all platforms
VERSION=1.0.0
for platform in darwin-amd64 darwin-arm64 linux-amd64 linux-arm64; do
  curl -LO "https://github.com/Syfra3/syfra/releases/download/v${VERSION}/ancora-${VERSION}-${platform}.tar.gz"
done

# 2. Compute SHA256 checksums
for file in ancora-*.tar.gz; do
  sha256sum "$file"
done

# 3. Update Formula/ancora.rb with new version and SHA256s
# Edit the file manually or use sed

# 4. Commit and push
git add Formula/ancora.rb
git commit -m "Update ancora to v${VERSION}"
git push
```

### Automated Method (Recommended)

Create a GitHub Actions workflow in the tap repo:

`.github/workflows/update-formula.yml`:
```yaml
name: Update Formula

on:
  repository_dispatch:
    types: [new-release]

jobs:
  update:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Update formula
        env:
          VERSION: ${{ github.event.client_payload.version }}
        run: |
          # Download checksums from release
          for platform in darwin-amd64 darwin-arm64 linux-amd64 linux-arm64; do
            curl -sL "https://github.com/Syfra3/syfra/releases/download/v${VERSION}/ancora-${VERSION}-${platform}.tar.gz.sha256" \
              > "${platform}.sha256"
          done
          
          # Update formula with new version and checksums
          # (You'll need a script to do the actual replacement)
          
      - name: Create PR
        uses: peter-evans/create-pull-request@v5
        with:
          title: "Update ancora to v${{ github.event.client_payload.version }}"
          commit-message: "Update ancora to v${{ github.event.client_payload.version }}"
          branch: "update-v${{ github.event.client_payload.version }}"
```

Then trigger from main repo's release workflow:
```yaml
# In .github/workflows/release.yml, add after release creation:
- name: Notify tap repository
  run: |
    curl -X POST \
      -H "Authorization: token ${{ secrets.TAP_REPO_TOKEN }}" \
      -H "Accept: application/vnd.github.v3+json" \
      https://api.github.com/repos/Syfra3/homebrew-tap/dispatches \
      -d '{"event_type":"new-release","client_payload":{"version":"${{ steps.version.outputs.VERSION }}"}}'
```

## Formula Structure

The formula file (`Formula/ancora.rb`) contains:

- **Metadata**: description, homepage, license
- **Platform detection**: Different URLs/SHA256s for macOS Intel, macOS ARM, Linux amd64, Linux ARM
- **Installation**: Binary installation to `bin/`
- **Testing**: Basic smoke test to verify installation

## Testing Changes Locally

Before pushing formula updates:

```bash
# Test formula syntax
brew audit --strict Formula/ancora.rb

# Test installation locally
brew install --build-from-source Formula/ancora.rb

# Or test from tap
brew uninstall ancora
brew install --debug --verbose Syfra3/tap/ancora
```

## Troubleshooting

### Formula fails to install

**Check:**
- URLs are correct and accessible
- SHA256 checksums match actual files
- Platform detection logic is correct

**Debug:**
```bash
brew install --verbose --debug Syfra3/tap/ancora
```

### Tap not found

**Check:**
- Repository is named `homebrew-tap` (not just `tap`)
- Repository is public
- Formula files are in root or `Formula/` directory

### Wrong binary for architecture

**Check:**
- `Hardware::CPU.arm?` and `Hardware::CPU.intel?` logic
- URL construction for each platform

## Maintenance

### Regular Tasks

- Update formula after each release
- Test installation on macOS (Intel + ARM) and Linux
- Monitor GitHub issues for installation problems
- Keep formula in sync with main repo's releases

### Optional Enhancements

- Add `bottle` blocks for precompiled binaries (not needed for Go)
- Add `livecheck` block for automatic update detection
- Add `caveats` for post-install instructions

## Resources

- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew Acceptable Formulae](https://docs.brew.sh/Acceptable-Formulae)
- [Creating a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
