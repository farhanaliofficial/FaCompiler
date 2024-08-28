<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT">
  <img src="https://img.shields.io/badge/Python-3.x-blue.svg" alt="Python: 3.x">
  <img src="https://img.shields.io/badge/Cython-Enabled-brightgreen.svg" alt="Cython: Enabled">
  <img src="https://img.shields.io/badge/Build-GCC-important.svg" alt="Build: GCC">
  <img src="https://img.shields.io/badge/Compression-UPX-orange.svg" alt="Compression: UPX">
</p>

<h1 align="center">FaCompiler</h1>

<p align="center">
  FaCompiler is a powerful command-line tool designed to compile Python scripts into optimized executables. Leveraging Cython, GCC, and UPX, FaCompiler creates compact, high-performance binaries from your Python code, making it perfect for Termux environments.
</p>

<p align="center">
  <img src="https://img.shields.io/github/stars/farhanaliofficial/FaCompiler?style=social" alt="GitHub stars">
  <img src="https://img.shields.io/github/forks/farhanaliofficial/FaCompiler?style=social" alt="GitHub forks">
</p>

## ✨ Features

- **Automatic Compilation:** Converts Python files into optimized executables.
- **Dynamic Python Version Detection:** Automatically detects and uses the correct Python version for compilation.
- **Compression:** Compresses the final executable with UPX for reduced file size.
- **Optimized for Termux:** Seamlessly integrates with your Termux environment.

## 📥 Installation

### Step 1: Clone the Repository
To get started, clone the FaCompiler repository:

```bash
git clone https://github.com/farhanaliofficial/FaCompiler.git
cd FaCompiler
```

### Step 2: Move the Script to Your Executables Directory
After cloning the repository, move the `FaCompiler` script to your Termux executable directory:

```bash
mv FaCompiler.sh $HOME/../usr/bin/FaCompiler
chmod +x $HOME/../usr/bin/FaCompiler
```

This will make `FaCompiler` accessible from anywhere in your Termux environment.

## 🚀 Usage

### Compile a Python Script
To compile a Python script into an executable, use the following command:

```bash
FaCompiler <input_file.py> -o <output_file>
```

### Display Help
For help and usage information, run:

```bash
FaCompiler --help
```

### Display Version
To display the current version of FaCompiler, run:

```bash
FaCompiler --version
```

## 🛠️ Example

Suppose you have a Python script named `example.py`. To compile it into an executable named `example`, run:

```bash
FaCompiler example.py -o example
```

This will generate an optimized executable from your Python script.

## 🤝 Contributing

Contributions are welcome! Please fork the repository, create a new branch for your feature or bugfix, and submit a pull request.

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add new feature'`)
5. Push to the branch (`git push origin feature-branch`)
6. Open a pull request

## 📜 License

FaCompiler is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## 👤 Author

**Farhan Ali**

- GitHub: [@farhanaliofficial](https://github.com/farhanaliofficial)
