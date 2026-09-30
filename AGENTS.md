# Project guidance

- Use English for development discussion, code, and documentation. Write player-facing text in Spanish.
- For underspecified features or decisions about gameplay, product behavior, or architecture, use the `grill-with-docs` skill before implementation. Ask the full set of currently answerable decisions, recommend a direction, and wait for agreement. Answer factual questions and carry out fully specified small changes directly.
- Read [CONTEXT.md](CONTEXT.md) when a task touches game concepts. Treat unresolved mechanics as open decisions, not requirements.
- For creating or revising game art, sprites, tilesets, or visual assets, follow [docs/art-direction.md](docs/art-direction.md), including its Sloffee character lock and asset approval workflow.
- Favor correct, understandable changes with a small surface area. Add abstractions or optimize performance when the benefit is meaningful; explain the trade-off. Keep the mobile play experience responsive.
- Follow the existing Godot scene/GDScript and Convex TypeScript conventions. Verify changed behavior with the relevant tools available, and report what you could not verify.
- Keep project guidance lean: put domain terms in `CONTEXT.md`, human orientation in `README.md`, and only consequential, non-obvious, hard-to-reverse decisions in ADRs. Avoid repeating facts easily found in code or configuration.
