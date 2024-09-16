# MAuth

Automate Microsoft Authenticator requests in Safari

## Requirements

Requires macOS Sequoia 15 or later.

## Installation

You must copy the [MAuth.applescript](MAuth.applescript) file and paste it into a Shortcut with an Run AppleScript action. Alternatively, you can use the shortcut I created [here](https://www.icloud.com/shortcuts/932d45b94177496fa36044470ac88893).

Note that using this script requires setting up two things:

### 1. Apple Events access in Safari

You need to enable programs to run code on Safari. How to:

1. Open Safari Settings
2. Go to "Developer"
3. Check "Allow JavaScript from Apple Events"

### 2. Assistive Access in System

You also need to allow MAuth to control your computer. How to:

1. Run MAuth normally once so that you see the "Shortcuts was prevented from
   controlling your computer" or similar message.
2. Go to `System Settings > Privacy & Security > Accessibility` and toggle on
   "Shortcuts".
