"""Draw Snagit-style callouts on a screenshot (anti-aliased, soft shadow).

Usage:
  python tools/annotate.py IN.png OUT.png '[{"box":[x0,y0,x1,y1],"n":1,"at":"tl"}, {"box":[...]}]'

Each item: box = pixel rectangle; n = step number (omit for a plain focus box);
at = where the number badge sits: tl, tr, bl, br (default tl).
{"blur":[x0,y0,x1,y1]} blurs that region (Snagit-style redaction) before callouts are drawn.
"""
import sys, json
from PIL import Image, ImageDraw, ImageFont, ImageFilter

RED = (252, 67, 67, 255)
WHITE = (255, 255, 255, 255)
SS = 4  # supersampling factor for anti-aliasing

def font(size):
    for name in ("segoeuib.ttf", "arialbd.ttf", "DejaVuSans-Bold.ttf"):
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            pass
    return ImageFont.load_default()

def annotate(src, dst, items):
    base = Image.open(src).convert("RGBA")
    w, h = base.size
    for it in items:
        if "blur" in it:
            x0, y0, x1, y1 = it["blur"]
            region = base.crop((x0, y0, x1, y1)).filter(ImageFilter.GaussianBlur(radius=max(6, (y1 - y0) / 3)))
            base.paste(region, (x0, y0))
    items = [it for it in items if "box" in it]
    scale = max(1.0, w / 1000)
    stroke = round(3 * scale * SS)
    r = round(15 * scale * SS)
    radius = round(3 * scale * SS)
    f = font(round(21 * scale * SS))
    W, H = w * SS, h * SS

    shapes = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    d = ImageDraw.Draw(shapes)
    for it in items:
        x0, y0, x1, y1 = [v * SS for v in it["box"]]
        d.rounded_rectangle([x0, y0, x1, y1], radius=radius, outline=RED, width=stroke)
        if "n" in it:
            at = it.get("at", "tl")
            cx = x0 if at in ("tl", "bl") else x1
            cy = y0 if at in ("tl", "tr") else y1
            cx = min(max(cx, r + 1), W - r - 1)
            cy = min(max(cy, r + 1), H - r - 1)
            d.ellipse([cx - r, cy - r, cx + r, cy + r], fill=RED)
            t = str(it["n"])
            bb = d.textbbox((0, 0), t, font=f)
            d.text((cx - (bb[2] - bb[0]) / 2 - bb[0], cy - (bb[3] - bb[1]) / 2 - bb[1]), t, font=f, fill=WHITE)

    # soft drop shadow from the shapes' alpha, offset slightly down-right
    alpha = shapes.split()[3]
    shadow = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    shadow.putalpha(alpha.point(lambda a: int(a * 0.55)))
    shadow = shadow.filter(ImageFilter.GaussianBlur(radius=2.5 * scale * SS))
    off = round(1.5 * scale * SS)
    layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    layer.alpha_composite(shadow, (off, off))
    layer.alpha_composite(shapes)
    layer = layer.resize((w, h), Image.LANCZOS)

    out = Image.alpha_composite(base, layer).convert("RGB")
    out.save(dst)
    return dst

if __name__ == "__main__":
    src, dst, spec = sys.argv[1], sys.argv[2], sys.argv[3]
    items = json.loads(open(spec).read() if spec.endswith(".json") else spec)
    print(annotate(src, dst, items))
