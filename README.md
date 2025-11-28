# Homebrew Tap for MatteriaTrack

[![Homebrew Tap](https://img.shields.io/badge/homebrew--tap-ind4skylivey%2Ftap-orange?style=for-the-badge&logo=homebrew)](https://github.com/ind4skylivey/homebrew-tap)
[![MatteriaTrack Version](https://img.shields.io/badge/MatteriaTrack-v1.0.4-blue?style=for-the-badge)](https://github.com/ind4skylivey/matteria-track)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

This repository is the official [Homebrew](https://brew.sh) tap for **MatteriaTrack**, a Final Fantasy-themed CLI time tracker inspired by Zeit.

## 📦 Installation

You can install MatteriaTrack directly using the following command:

```bash
brew install ind4skylivey/tap/materiatrack
```

Alternatively, you can tap this repository first to track updates more easily:

```bash
brew tap ind4skylivey/tap
brew install materiatrack
```

## 🔄 Updating

To update MatteriaTrack to the latest version, run:

```bash
brew update
brew upgrade materiatrack
```

## 🛠 Usage

Once installed, the `materiatrack` command (and its alias `mtrack`) will be available in your terminal.

```bash
# Start tracking a task
mtrack track -p "Project7" -t "Mako Reactor Bombing"

# Stop tracking
mtrack finish

# List entries
mtrack list
```

For full documentation and configuration options, please visit the [main repository](https://github.com/ind4skylivey/matteria-track).

## 🐛 Issues & Support

If you encounter any issues with the installation or the Homebrew formula itself, please open an issue in this repository.

For bugs or feature requests related to the application logic, please report them in the [MatteriaTrack main repository](https://github.com/ind4skylivey/matteria-track/issues).

## 📄 License

This project is licensed under the MIT License.