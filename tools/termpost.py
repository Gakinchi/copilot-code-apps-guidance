"""Post-process the terminal screenshots of one post folder: trim the empty area below the last prompt and
draw focus boxes on the key lines (step 5: Local Play URL, step 6: relative asset paths, step 7: push result).
Usage: python tools/termpost.py images/<post-id>"""
import sys, os, glob
from PIL import Image
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from trimterm import trim
from annotate import annotate

LINE = 23  # px per terminal line at this font size
CH = 11.85  # px per character (monospace)
X0 = 12    # x of the first column
NAMES = {"vue": "My Vue App", "svelte": "My Svelte App", "solid": "My Solid App", "preact": "My Preact App",
         "react": "My React App", "angular": "My Angular App"}

def redactions_for(step, im, fw):
    """Blur rectangles for environment id, tenant id and app URL (Dennis, 2026-10-23: keep the e-mail)."""
    w, h = im.size
    if step == 4 and fw:   # pa app init -n "<name>" -e <guid>   on the prompt line (y ~ 84..106), after the prompt
        col = len(f'pa app init -n "{NAMES[fw]}" -e ')
        x = 323 + col * CH
        return [{"blur": [int(x) + 2, 82, int(x + 36 * CH) + 8, 108]}]
    if step == 5:   # Local Play URL: guid at column 19 + 34 on the first URL line
        rows = rows_where(im, lambda px, y, w: sum(1 for x in range(1000, w - 20, 2) if min(px[x, y]) > 200) > 25)
        spans = group(rows, gap=LINE)
        if spans:
            y0 = spans[0][0]; x = X0 + 53 * CH + 6   # the arrow glyph is about one and a half cells wide
            return [{"blur": [int(x), y0 - 12, int(x + 36 * CH) + 14, y0 + 14]}]
    if step == 7:   # everything after "You can play your app at " on the green lines
        rows = rows_where(im, lambda px, y, w: sum(1 for x in range(8, 600, 2) if px[x, y][1] > 150 and px[x, y][0] < 130 and px[x, y][2] < 130) > 20)
        spans = group(rows, gap=LINE)
        if spans:
            y0, y1 = spans[0][0], spans[-1][1]; x = X0 + 51 * CH
            return [{"blur": [int(x) - 2, y0 - 6, w - 10, y0 + 17]}, {"blur": [8, y0 + 17, w - 10, y1 + 6]}]
    return []

def rows_where(im, pred, y0=110):
    px = im.load(); w, h = im.size; out = []
    for y in range(y0, h):
        if pred(px, y, w): out.append(y)
    return out

def group(rows, gap=6):
    if not rows: return []
    spans = [[rows[0], rows[0]]]
    for y in rows[1:]:
        if y - spans[-1][1] <= gap: spans[-1][1] = y
        else: spans.append([y, y])
    return spans

def boxes_for(step, im):
    w, h = im.size
    if step == 5:   # rows with white text reaching far right: the long Local Play URL
        rows = rows_where(im, lambda px, y, w: sum(1 for x in range(1000, w - 20, 2) if min(px[x, y]) > 200) > 25)
        spans = group(rows, gap=LINE)
        if spans: y0 = spans[0][0]; return [{"box": [8, y0 - 16, w - 8, y0 + 2 * LINE + 6]}]   # the URL always wraps to two lines
    if step == 6:   # the two lines just above the final prompt
        rows = rows_where(im, lambda px, y, w: sum(1 for x in range(8, 120) if abs(px[x, y][0]-243) < 12 and abs(px[x, y][1]-174) < 14 and abs(px[x, y][2]-53) < 20) > 25)
        spans = group(rows, gap=4)
        if spans:
            top = spans[-1][0]   # top of the final prompt
            # the actual text lines (white pixels) in the three lines above the prompt; skips blank lines
            text = rows_where(im, lambda px, y, w: sum(1 for x in range(8, 700, 2) if min(px[x, y]) > 170 and max(px[x, y]) - min(px[x, y]) < 40) > 8, y0=top - 5 * LINE - 8)
            lines = [sp for sp in group(text, gap=4) if sp[1] < top - 2 and sp[1] - sp[0] > 6]
            # keep the cluster of consecutive lines closest to the prompt (a blank line ends the cluster)
            cluster = []
            for sp in reversed(lines):
                if cluster and cluster[0][0] - sp[0] > LINE + 6: break
                cluster.insert(0, sp)
                if len(cluster) == 2: break   # at most the script and link lines
            if cluster: return [{"box": [8, cluster[0][0] - 14, w - 8, cluster[-1][1] + 10]}]
    if step == 7:   # green success text
        rows = rows_where(im, lambda px, y, w: sum(1 for x in range(8, 600, 2) if px[x, y][1] > 150 and px[x, y][0] < 130 and px[x, y][2] < 130) > 20)
        spans = group(rows, gap=LINE)
        if spans: y0, y1 = spans[0][0], spans[-1][1]; return [{"box": [8, y0 - 6, w - 8, y1 + 6]}]
    return []

def process(folder, fw=None):
    for src in sorted(glob.glob(os.path.join(folder, "term-?.png"))):
        trim(src)
        step = int(os.path.basename(src)[5])
        im = Image.open(src).convert("RGB")
        boxes = redactions_for(step, im, fw) + boxes_for(step, im)
        dst = src.replace(".png", "-annotert.png")
        if boxes: annotate(src, dst, boxes); print(f"{os.path.basename(src)}: trimmet {im.size}, {len([b for b in boxes if 'blur' in b])} sladd, {len([b for b in boxes if 'box' in b])} boks")
        else:
            if os.path.exists(dst): os.remove(dst)
            print(f"{os.path.basename(src)}: trimmet {im.size}")

if __name__ == "__main__":
    process(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None)
