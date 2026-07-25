---
name: teach
description: Teach the user a new skill or concept through a persistent, stateful learning workspace. Use when the user explicitly asks to learn or be taught a topic over multiple sessions.
---

# Teach in a persistent workspace

Treat the current directory as one teaching workspace for one mission.

## Read and maintain workspace state

- `MISSION.md`: the concrete reason for learning and observable success criteria. Read `references/mission-format.md` before creating or changing it.
- `RESOURCES.md`: curated high-trust knowledge sources and communities. Read `references/resources-format.md` before editing it.
- `GLOSSARY.md`: terminology the user has demonstrated they understand. Read `references/glossary-format.md` before editing it.
- `learning-records/*.md`: decision-grade evidence of learning and prior knowledge. Read `references/learning-record-format.md` before adding one.
- `lessons/*.html`: sequential, self-contained lessons.
- `reference/*.html`: printable quick-reference documents.
- `assets/*`: reusable lesson styles, widgets, simulations, and diagram helpers.
- `NOTES.md`: teaching preferences and working notes.

Read existing state before teaching. Create directories lazily.

## Ground the mission

If `MISSION.md` is absent or vague, interview the user about the real-world outcome before teaching. Keep one mission per workspace. Confirm before changing an existing mission and record a meaningful mission shift.

Estimate the user's zone of proximal development from their learning records, demonstrated knowledge, and mission. Challenge them just beyond what they can already do.

## Acquire trustworthy knowledge

Do not rely solely on parametric knowledge. Research high-quality primary sources, recognized experts, or peer-reviewed work and maintain annotated entries in `RESOURCES.md`. Cite claims in lessons. Surface gaps when trustworthy material is unavailable.

Use communities for practical wisdom when useful, while respecting a preference not to join them.

## Create lessons

Create one short, focused HTML lesson at a time in `lessons/`, numbered `0001-slug.html`, `0002-slug.html`, and so on.

Each lesson must:

- Deliver one tangible win tied to the mission.
- Fit the user's current level and working-memory limits.
- Teach only the knowledge required for the target skill.
- Include effortful practice with a tight feedback loop.
- Link relevant lessons and reference documents.
- Recommend and cite a high-trust primary source.
- Invite follow-up questions.

Use retrieval practice, spacing, and interleaving where they improve long-term retention. For multiple-choice quizzes, keep answer length and formatting balanced so they do not reveal the answer.

Make lessons clean, readable, printable, and visually consistent. Inspect `assets/` first and reuse components. Create a shared stylesheet before duplicating presentation code.

## Record actual learning

Write a learning record only when the user demonstrates non-trivial understanding, states meaningful prior knowledge, corrects a misconception, or changes the mission. Do not record mere coverage or session logs.

Create or revise glossary entries only after the user can use the term correctly. Prefer concise, canonical definitions and consistent terminology.

Confirm changes that alter the mission. Other workspace updates may proceed as part of an explicitly requested teaching session.
