## Index

1. [Keep Calm](#keep-calm)
2. [Project Structure](#project-structure)
3. [Dependencies](#dependencies)
4. [Download the font](#download-the-font)
5. [Usage](#usage)
6. [Run it!](#run-it)

## Keep Calm

A simple script to generate custom "Keep Calm" images!

## Project Structure
<details>
<summary>Click me</summary>

```
KeepCalm/
└── src/
    ├── assets/
    |   ├── colours/
    |   |   └── colours.txt
    |   └── font/
    |       └── ...
    ├── output/
    |   ├── keep_calm.png
    |   └── test.png
    ├── main.py
    └── script.sh
```
</details>

## Dependencies

Install `Pillow` dependency with the following command:

```shell
pip install Pillow==9.5.0
```

## Download the font

This project uses the [keep-calm.font](https://www.dafont.com/keep-calm.font) stored in `font.ttf` file within its main folder. Download it with the following commands (Make sure you are in the `KeepCalm` directory):

```shell
wget https://dl.dafont.com/dl/?f=keep_calm -O ./src/assets/font/font.zip
unzip ./src/assets/font/font.zip -d ./src/assets/font/
```

## Usage

This script has five arguments, all of them are optional, here is a description of each of them:

- `--width`, `-w`: Specifies the width of the image in pixels. It accepts an integer value. If not provided, it defaults to 200 pixels.

- `--text`, `-t`: Specifies the text content to be displayed on the image. It accepts up to 5 strings as arguments. If not provided, it defaults to ["keep", "calm", "and", "carry", "on"].

- `--bg-colour`: Specifies the background color of the image. It accepts a string representing a color name chosen from a predefined list of colors. If not provided, it defaults to "red".

- `--text-colour`: Specifies the color of the text displayed on the image. It accepts a string representing a color name chosen from a predefined list of colors. If not provided, it defaults to "white".

- `--output`, `-o`: Specifies the output file path and name for the generated image. It accepts a string representing the file path. If not provided, it defaults to "./src/output/keep_calm.png".

## Run it!

You have two options to run the script, you can do it by pointing directly to the `main.py` file or use a `script.sh` file with predefined data (Each runs from the `KeepCalm` directory):

```shell
python3 ./src/main.py
```

<div align="center">
  <a href="https://github.com/FJrodafo/University/blob/main/Languages/Python/KeepCalm/src/output/keep_calm.png">
    <img alt="KEEP CALM AND CARRY ON" src="https://raw.githubusercontent.com/FJrodafo/University/main/Languages/Python/KeepCalm/src/output/keep_calm.png">
  </a>
</div>

```shell
chmod +x ./src/script.sh
./src/script.sh
# or
python3 ./src/main.py --width 400 --text "keeeep" "caaaalm" "&" "continue" "coding" --bg-colour "coral" --text-colour "black" --output ./src/output/test.png
```

<div align="center">
  <a href="https://github.com/FJrodafo/University/blob/main/Languages/Python/KeepCalm/src/output/test.png">
    <img alt="KEEEEP CAAAALM & CONTINUE CODING" src="https://raw.githubusercontent.com/FJrodafo/University/main/Languages/Python/KeepCalm/src/output/test.png">
  </a>
</div>

<link rel="stylesheet" href="./../../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>