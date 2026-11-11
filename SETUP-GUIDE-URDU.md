# Setup Guide (Roman Urdu) — Windows

Ye guide beginners ke liye hai. Koi coding nahi aani chahiye. Bas steps follow karein.

## Step 1: Teen programs install karein (sirf pehli dafa)

1. **Node.js** — nodejs.org se "LTS" version download kar ke install karein.
2. **Python 3.12** — python.org/downloads se. Install karte waqt neeche
   **"Add python.exe to PATH"** wala box zaroor tick karein. Ye bohat zaroori hai.
3. **Claude Code** — Windows mein "Command Prompt" kholein aur ye likh kar Enter dabayein:
   ```
   npm install -g @anthropic-ai/claude-code
   ```

## Step 2: Claude mein login karein (sirf pehli dafa)

Command Prompt mein likhein `claude` aur Enter. Phir andar likhein `/login` aur browser mein
apne Claude Pro/Max account se login karein. (Free Claude account se ye kaam nahi karega.)

Agar Claude subscription nahi hai: ChatGPT Plus se bhi chal jata hai —
`npm install -g @openai/codex` phir `codex login`. Lekin Claude live jawab tez deta hai.

## Step 3: Project setup

1. Ye ZIP file unzip karein (right click → Extract All).
2. Folder kholein aur **SETUP.bat** par double-click karein.
3. 5-10 minute lagenge (speech model download hota hai). Window band hone tak intezar karein.

## Step 4: Check karein

**CHECK.bat** par double-click. Agar ye bataye ke Claude signed in hai aur jawab aa gaye, to sab theek hai.

## Step 5: Chalayein

**START.bat** par double-click. Do windows khulengi:
- **Dashboard** — yahan meeting se pehle brief likhte hain aur baad mein summary + roadmap dekhte hain.
- **Overlay** — chhota panel jo call ke dauran jawab dikhata hai.

## Meeting ka tareeqa

1. **Pehle:** `RANKQORA-BRIEF.md` kholein, brief copy kar ke Dashboard → Brief mein paste karein.
   Apni prices aur real results bharein. **Save brief** dabayein.
2. **Call ke dauran:** **Start listening** dabayein. Client sawal poochega to overlay par
   **SAY THIS** mein jawab aa jayega. Usay apne alfaaz mein bolein.
3. **Baad mein:** Notes & summary → **Generate summary**. Summary, action items, follow-up message
   aur **Client roadmap** mil jayega. **Download Word (.docx)** se save karein.

## Zaroori baatein

- Screen share karte waqt **poori screen nahi, sirf window ya tab share karein**. Is tarah overlay client ko nazar nahi aayega.
- Kai mulkon (UK, Canada, kuch US states) mein call transcribe karne se pehle client ko batana
  qanoonan zaroori hai. Simple keh dein: "I use a note-taking tool on my calls, is that OK?"
- Hotkeys: `Ctrl+Shift+H` overlay foran chhupao, `Ctrl+Shift+Space` dikhao/chhupao.
- Agar client ki baat ghalat likhi aa rahi ho, to Settings → Local model → **base.en** try karein (naye laptop par zyada accurate hai).
