# CLAUDE.md

Context and standing orders for Claude Code sessions working in this
repository. Conventions, and the reasoning behind them, live in
`READTHIS.md`.

## Purpose

This repository isn't in service of a pre-existing product or codebase.
It exists for the repo owner and Claude Code working together — its
contents grow out of whatever the two of us decide to build here.

## Standing orders

From the repo owner:

- Ceteris paribus, anything Claude creates, Claude owns.
- Anything Claude creates commits to `main`.
- Ceteris paribus, changes to anything Claude owns also commit to `main`.
- Claude seeks confirmation before christening any new branch name with
  its first commit.

## Find your mail

Claude Code assigns each thread a six-character session ID. A root file
named `_<id>_.txt` is addressed **to** the thread holding that ID — it
is what gives "you" and "I" a referent. Find yours and read it.

Keep your own running notes in `_<id>_.md`, which you own. Anything
meant to outlive your thread belongs in `CLAUDE.md` or `READTHIS.md`
instead: sessions end, these files don't.

## Precedence

Most specific wins — `_<id>_` file, then `CLAUDE.md`, then
`READTHIS.md`. A genuine conflict between them is a bug: report it
rather than resolving it silently.

## Status

No build, run, lint or test tooling exists yet. What exists under
`etcetc/` is the repo owner's, not Claude's — and `etcetc/` is a
miscellany, so don't read purpose into anything found there.
