#!/bin/bash
# Meeting Copilot - one-time setup on a Mac. Double-click it in Finder.
cd "$(dirname "$0")" || exit 1
fail() { echo; echo "  $1"; echo; read -n1 -p "Press any key to close." || true; exit 1; }

echo "=== Meeting Copilot - Mac setup ==="
echo

echo "[1/5] Checking Node.js and Python..."
command -v node >/dev/null || fail "Node.js is missing. Install the LTS version from https://nodejs.org and run this again."
NODE_MAJOR=$(node -p 'process.versions.node.split(".")[0]')
[ "$NODE_MAJOR" -ge 18 ] || fail "Node.js $NODE_MAJOR is too old. Install the LTS version from https://nodejs.org."
PY=""
for c in /opt/homebrew/bin/python3 /usr/local/bin/python3 python3; do
  if command -v "$c" >/dev/null && "$c" -c 'import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)' 2>/dev/null; then PY="$c"; break; fi
done
[ -n "$PY" ] || fail "Python 3.9 or newer is missing. Install it from https://python.org and run this again."
echo "    node $(node -v), $("$PY" -V)"

echo "[2/5] Node packages..."
npm install --no-fund --no-audit || fail "npm install failed. Check your internet connection and run this again."

echo "[3/5] Python audio packages (into ./.venv)..."
[ -x .venv/bin/python3 ] || "$PY" -m venv .venv || fail "Could not create the Python environment."
./.venv/bin/python3 -m pip install -q --upgrade pip
./.venv/bin/python3 -m pip install -q -r audio/requirements-mac.txt || fail "pip install failed. See the error above."

echo "[4/5] Building the system-audio helper..."
command -v swiftc >/dev/null || fail "Apple's developer tools are missing. Run:  xcode-select --install  then run this again."
swiftc -O -o audio/mac/syscap audio/mac/syscap.swift || fail "The Swift build failed. Run:  xcode-select --install  then try again."

echo "[5/5] Downloading the speech model (about 75 MB, once)..."
./.venv/bin/python3 -c "from faster_whisper import WhisperModel; WhisperModel('tiny.en', compute_type='int8')" \
  || echo "    Could not download it now. It will download the first time you start listening."
./.venv/bin/python3 -c "import sounddevice, scipy, faster_whisper, webrtcvad, websockets" \
  || fail "The audio packages did not import. See the error above."
./audio/mac/syscap --devices >/dev/null || fail "The system-audio helper did not run."

echo
echo "Setup finished."
echo
echo "Last step, once: sign in to the AI that writes your answers. Pick one."
echo "  Claude:   open Terminal, run  claude , type  /login  and finish in the browser."
echo "  ChatGPT:  open Terminal, run  npm install -g @openai/codex  then  codex login"
echo
echo "Then double-click START.command. The first start asks for Microphone and"
echo "Screen & System Audio Recording: allow both for Electron."
read -n1 -p "Press any key to close." || true
exit 0
