import argparse
from os import path
from PIL import Image, ImageFont, ImageDraw

with open("./src/assets/colours/colours.txt", "r") as f:
    colours = [line.strip() for line in f]


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--width",
        "-w",
        type=int,
        default=200,
        help="image width",
    )
    parser.add_argument(
        "--text",
        "-t",
        type=str,
        nargs=5,
        default=["keep", "calm", "and", "carry", "on"],
        help="keep calm message",
    )
    parser.add_argument(
        "--bg-colour",
        type=str,
        default="red",
        choices=colours,
        help="background colour",
    )
    parser.add_argument(
        "--text-colour",
        type=str,
        default="white",
        choices=colours,
        help="background colour",
    )
    parser.add_argument(
        "--output",
        "-o",
        type=str,
        default="./src/output/keep_calm.png",
        help="output image file path",
    )
    return parser.parse_args()


def create_image(args):
    MARGIN = 20
    HEIGHT = 300
    WIDTH = args.width
    LINES = args.text
    BACKGROUND = args.bg_colour
    TEXT = args.text_colour
    FONTSIZE = 30
    DIRNAME = path.dirname(__file__)
    img = Image.new("RGB", (WIDTH, HEIGHT), color=BACKGROUND)
    draw = ImageDraw.Draw(img)
    fontsize = FONTSIZE
    lines = list(map(str.upper, LINES))

    def getFont(line, size, index=0):
        font_path = path.join(DIRNAME, "./assets/font/KeepCalm-Medium.ttf")
        font = ImageFont.truetype(
            font_path, size if index != 2 else int(2 * round(size / 4))
        )
        width, height = font.getsize(line)
        return (width, height, font)

    maxlength = 0
    while True:
        for n, line in enumerate(lines):
            width, height, font = getFont(line, fontsize, n)
            maxlength = max(width, maxlength)
        if maxlength < WIDTH - (2 * MARGIN):
            break
        else:
            maxlength = 0
            fontsize = fontsize - 1
    y = (
        HEIGHT
        - (MARGIN if fontsize == FONTSIZE else ((WIDTH - maxlength) / 2))
        + fontsize / 2
    )
    for n, line in enumerate(reversed(lines)):
        width, height, font = getFont(line, fontsize, n)
        x = (WIDTH / 2) - (width / 2)
        y = y - height - (fontsize / 2)
        draw.text((x, y), line, TEXT, font)
    crown = "^"
    width, height, font = getFont(crown, 77)
    x = (WIDTH / 2) - (width / 2)
    y = (y / 2) - (height / 2) - 5
    draw.text((x, y), crown, TEXT, font)
    img.save(args.output)


if __name__ == "__main__":
    args = parse_arguments()
    create_image(args)
