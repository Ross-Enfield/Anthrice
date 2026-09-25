# READTHIS.md

For anyone about to modify anything here, for any reason — human or
agent, passing through or settled in. `README.md` is for people trying
to understand this repo; this file is for people about to change it.
Binding instructions for Claude sessions are in `CLAUDE.md`; what
follows is convention, and why.

It is `READTHIS.md` rather than the tooling-recognised `AGENTS.md`
because its audience is wider than agents. That was a deliberate choice,
not an oversight — no need to re-litigate it.

## Root files are addressed mail

Claude Code assigns each conversation a six-character session ID. Root
files matching `_<id>_.*` belong to that thread:

| File | Author | Direction |
| --- | --- | --- |
| `_<id>_.txt` | repo owner | inbound — instructions to that thread |
| `_<id>_.md` | that thread | outbound — its own notes and record |

This is what lets such a file say "you" and mean exactly one addressee.
A thread that can't work out its own session ID can't find its mail, so
`CLAUDE.md` states the convention outright rather than leaving it to be
inferred.

Known IDs: `5m0rwj` (active), `lvurds` (dormant).

## `etcetc/` is a junk drawer

Always a miscellany: things live there because they don't belong
anywhere else, not because they belong together. Placement there implies
nothing about importance, maturity or relatedness, and no structure
should be inferred from it. When something in `etcetc/` earns a real
home, it gets one.

## `<TMZ>worms/` — write-once thread output

Each sessionthread writes its output into a folder of its own:

    <TMZ>worms/in<CCYYMM>/_<id>_/<DDHHMMSS>.<ext>

**WORM: write once, read many.** Nothing here is modified after it is
written. To revise, write a new file; the old one stays put. The
timestamp in the basename is what stops successive versions colliding,
so it serves as the versioning mechanism — there is no other.

Path and basename divide one instant between them, each component
appearing exactly once: the top level fixes the timezone, `in<CCYYMM>`
the year and month, the basename the day, hour, minute and second within
them. The timezone is the *supervising human's*, so that filenames line
up with when a person experienced the events. It is a psychological
convenience, not a technical one.

"Conception" is deliberately loose — prompt time, planning time or the
moment of writing all serve. The timestamp identifies a file; it doesn't
measure anything. Use whatever accurate-enough time is already to hand
rather than fetching a fresh one for its own sake.

The repo owner creates the `<TMZ>worms/` and `in<CCYYMM>/` levels, there
being only one or two a month. A thread creates its own `_<id>_/` folder
inside an existing month, if it wants or needs one; not every thread
will.

Extensions are free — these are outputs, not prose by default. Where the
content *is* prose, the authorship convention above still holds.

Contrast the root `_<id>_.*` files, which are correspondence and are
freely rewritten by whoever owns them. Root mail mutates; worms don't.

## Extensions track who answers for the rendering

The owner writes `.txt`; Claude writes `.md`. Plain text has no syntax
to violate, which makes it the right format for whoever isn't going to
proofread rendered output. Markdown's structure is worth having, but
someone must be answerable when it breaks — that's Claude.

Corollary: the extension signals authorship, not ownership. The owner
wrote `_5m0rwj_.txt`; session `5m0rwj` owns it.

## Backtick session filenames in Markdown

Written bare, `_lvurds_.md` parses as emphasis: the underscores are
eaten and it renders as *lvurds*. Always wrap these names in backticks
inside `.md` files. It is precisely the class of error that `.txt`
makes impossible.

## Attribution

Claude's commits carry a `Co-Authored-By:` line and a `Claude-Session:`
trailer naming the thread. The owner's hand-made commits carry neither.
Since threads may commit under the owner's git identity, that trailer is
the only reliable way to tell "the owner did this" from "a thread did
this" — so don't drop it.

## Branches and merges

The owner is branch-averse because merge-averse: developers merge when
project managers err. Work goes straight to `main`. When `main` has
moved underneath you, rebase rather than merge.

A quiet misspelling of "merge" with two Rs is a tacit claim that someone
erred upstream.

## Freshness

Local git state is evidence about your last fetch, not about the remote.
"Nothing there" always means "nothing there, *or* nothing fetched yet",
and the two must be told apart before either is reported as fact. Fetch
before you conclude, and again before you push.

## Redundancy

Cross-references and statements of scope should repeat freely — any file
here may be read in isolation, so each should say who it binds and where
its neighbours are. Normative content should not repeat: duplicated
rules drift, and then there are two answers and no tiebreaker. One home
per rule, with `CLAUDE.md` declaring precedence.
