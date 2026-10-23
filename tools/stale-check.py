"""List pages whose 'verifisert:' front-matter date is older than N days (default 90).
Usage: python tools/stale-check.py [days]"""
import sys, re, glob, datetime
days = int(sys.argv[1]) if len(sys.argv) > 1 else 90
today = datetime.date.today()
stale, missing = [], []
for f in sorted(glob.glob("docs/**/*.md", recursive=True)):
    head = open(f, encoding="utf-8").read(600)
    m = re.search(r"^verifisert:\s*(\d{4}-\d{2}-\d{2})", head, re.M)
    if not m:
        missing.append(f); continue
    d = datetime.date.fromisoformat(m.group(1))
    if (today - d).days > days:
        stale.append((f, m.group(1)))
for f, d in stale: print(f"STALE   {d}  {f}")
for f in missing: print(f"MISSING        {f}")
print(f"{len(stale)} stale, {len(missing)} without verifisert, limit {days} days")
sys.exit(1 if stale or missing else 0)
