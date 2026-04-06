#!/usr/bin/env bash
# Update Homebrew formula with release checksums

set -euo pipefail

if [ $# -eq 0 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0"
    exit 1
fi

VERSION="$1"
REPO="Syfra3/syfra"
PACKAGE="ancora"

echo "Updating ${PACKAGE} formula to version ${VERSION}..."

# Download SHA256 checksums from release
declare -A CHECKSUMS

for platform in darwin-arm64 darwin-amd64 linux-arm64 linux-amd64; do
    echo "Downloading checksum for ${platform}..."
    URL="https://github.com/${REPO}/releases/download/ancora-v${VERSION}/${PACKAGE}-${VERSION}-${platform}.tar.gz.sha256"
    
    SHA256=$(curl -sL "$URL" | awk '{print $1}')
    
    if [ -z "$SHA256" ]; then
        echo "ERROR: Could not fetch checksum for ${platform}"
        exit 1
    fi
    
    CHECKSUMS[$platform]="$SHA256"
    echo "  ${platform}: ${SHA256}"
done

# Update formula file
FORMULA="Formula/${PACKAGE}.rb"

echo ""
echo "Updating ${FORMULA}..."

# Update version
sed -i "s/version \".*\"/version \"${VERSION}\"/" "$FORMULA"

# Update SHA256s
sed -i "s/PLACEHOLDER_SHA256_DARWIN_ARM64/${CHECKSUMS[darwin-arm64]}/" "$FORMULA"
sed -i "s/PLACEHOLDER_SHA256_DARWIN_AMD64/${CHECKSUMS[darwin-amd64]}/" "$FORMULA"
sed -i "s/PLACEHOLDER_SHA256_LINUX_ARM64/${CHECKSUMS[linux-arm64]}/" "$FORMULA"
sed -i "s/PLACEHOLDER_SHA256_LINUX_AMD64/${CHECKSUMS[linux-amd64]}/" "$FORMULA"

echo ""
echo "Formula updated successfully!"
echo ""
echo "Review changes:"
echo "  git diff ${FORMULA}"
echo ""
echo "Then commit and push:"
echo "  git add ${FORMULA}"
echo "  git commit -m \"Update ${PACKAGE} to v${VERSION}\""
echo "  git push"
