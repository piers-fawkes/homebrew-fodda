# Fodda Homebrew Tap (`homebrew-fodda`)

This repository serves as Fodda's official Homebrew Tap, allowing developers to install the Fodda Onboarding CLI using standard Homebrew commands:

```bash
brew tap piers-fawkes/fodda
brew install fodda-cli
```

---

## 🚀 Publishing Flow

To release a new version of the CLI via Homebrew, follow this workflow:

### 1. Publish the CLI to npm
From the `/fodda-cli` directory:
```bash
npm publish --access public
```

### 2. Calculate the Package SHA-256
Fetch the published tarball from the npm registry and compute its SHA-256 checksum:
```bash
curl -sL https://registry.npmjs.org/fodda-cli/-/fodda-cli-1.0.0.tgz | shasum -a 256
```

### 3. Update the Formula
*   Open `Formula/fodda-cli.rb` in this repository.
*   Update the `url` to reference the version tag (e.g. `1.0.0`).
*   Update the `sha256` field with the checksum calculated in Step 2.

### 4. Push Updates to GitHub
Push these changes to a public GitHub repository named `piers-fawkes/homebrew-fodda`:
```bash
git add .
git commit -m "Update fodda-cli to 1.0.0"
git push origin main
```
Homebrew will automatically detect the formula updates within minutes!
