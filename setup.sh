#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Setting up pinchtab development environment..."
echo ""

# Install git hooks
echo "📌 Installing git hooks..."
./scripts/install-hooks.sh

# Download dependencies
echo "📦 Downloading Go dependencies..."
go mod download

# Verify environment
echo "✅ Verifying Go environment..."
go version
echo ""

# Optional: Check for golangci-lint
if command -v golangci-lint &>/dev/null; then
  echo "✅ golangci-lint found: $(golangci-lint --version | head -1)"
else
  echo "⚠️  golangci-lint not found (optional for local linting)"
  echo "   Install: brew install golangci-lint"
  echo "   Or: go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest"
fi

echo ""
echo "✅ Development environment ready!"
echo ""
echo "Next steps:"
echo "  go build ./cmd/pinchtab     # Build pinchtab"
echo "  go test ./...               # Run tests"
echo "  gofmt -w .                  # Format code"
echo ""
echo "Git hooks will run automatically on commit."
