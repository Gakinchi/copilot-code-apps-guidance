# Company editions

The guidance in this repository is deliberately generic. An organisation that adopts it creates its own **edition**: a private repository that pulls this repository in as a git submodule and adds the organisation's own pages on top (environment names, environment groups, policy values, approved data sources, contacts, internal troubleshooting). Updating the framework means moving the submodule; the organisation's pages stay.

No organisation-specific content ever lands in this repository.

## Layout of an edition

```text
<org>-copilot-code-apps/
  framework/                 git submodule -> this repository (pinned to a tag)
  docs/
    index.md                 the organisation's "start here", linking into framework pages
    vaart-oppsett.md         environments per zone, groups, admins, champions, channel
    vaare-regler.md          the filled-in sonematrise and copilot-policy, with dates
    vaare-datakilder.md      approved connectors per zone and their owners
    feilsoking-hos-oss.md    what the framework's troubleshooting page does not cover
    endringslogg/            the weekly change notes
  templates/                 copies of framework/templates/*.md, filled in
  prompts/                   copies of framework/prompts/*, with brackets replaced
  mkdocs.yml
  requirements.txt
```

## mkdocs.yml for an edition

MkDocs builds from one `docs_dir`, so the edition mounts the framework pages with a symlink or a copy step before build, and keeps its own nav:

```yaml
site_name: "<Org>: GitHub Copilot og Power Apps Code Apps"
docs_dir: docs
nav:
  - Start her: index.md
  - Vårt oppsett: vaart-oppsett.md
  - Våre regler: vaare-regler.md
  - Våre datakilder: vaare-datakilder.md
  - Feilsøking hos oss: feilsoking-hos-oss.md
  - Rammeverket: framework/   # mounted copy of framework/docs, see build step
theme:
  name: material
  language: nb
plugins:
  - search
  - tags
```

Build step (PowerShell, CI or local):

```powershell
git submodule update --init
Remove-Item docs/framework -Recurse -Force -ErrorAction SilentlyContinue
Copy-Item framework/docs docs/framework -Recurse
python -m mkdocs build --strict
```

Pin the submodule to a tagged release of the framework and move it deliberately, after reading the framework's changelog and re-running the quickstart.

## Rules for an edition

- Private repository in the organisation's GitHub. Same branch protection as an app repo.
- Every edition page carries `verifisert:` and `kilde:` like the framework pages.
- Environment IDs, tenant IDs and app URLs may appear in the edition (it is private), but not in screenshots that could leave it.
- Link into framework pages instead of copying their text, so updates flow.
- Deviations from a framework recommendation are recorded as an ADR in the edition, linking to the framework page deviated from.

Status 2026-10-23: pattern described, not yet exercised with a real organisation (milestone 4 and 5 in the plan).
