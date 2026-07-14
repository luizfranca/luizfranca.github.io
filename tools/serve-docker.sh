#!/usr/bin/env bash
# Run Jekyll locally via Docker when Ruby is not installed on the host.
set -euo pipefail

IMAGE="mcr.microsoft.com/devcontainers/jekyll:2-bullseye"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

docker run --rm -it --network host \
  -e BUNDLE_APP_CONFIG=/srv/jekyll/.bundle \
  -v "$ROOT:/srv/jekyll" \
  -w /srv/jekyll \
  "$IMAGE" \
  bash -lc 'bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload'
