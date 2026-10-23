"""Trim the empty area below the last prompt line in a terminal screenshot.
Usage: python tools/trimterm.py IN.png [OUT.png]   (defaults to in-place)
Finds the lowest row that contains the orange 'gchi' prompt segment and crops ~30 px below it."""
import sys
from PIL import Image

def trim(src, dst=None, pad=30):
    im = Image.open(src).convert("RGB"); w, h = im.size; px = im.load()
    last = None
    for y in range(h - 1, 40, -1):
        hits = sum(1 for x in range(8, 120) if abs(px[x, y][0] - 243) < 12 and abs(px[x, y][1] - 174) < 14 and abs(px[x, y][2] - 53) < 20)
        if hits > 25: last = y; break
    if last is None: return src
    im.crop((0, 0, w, min(h, last + pad))).save(dst or src)
    return dst or src

if __name__ == "__main__":
    print(trim(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None))
