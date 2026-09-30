# Art direction — v1.1

This guide applies to new game art, including characters, terrain, environments, props, UI illustration, animation, and promotional images. It is based on **Sloffee Master v2.0**. Its rendering language guides the whole game, while its character model applies specifically to Sloffee. These are current production rules, not a permanent commitment to one aesthetic.

## Game-wide visual language

- Aim for warm, calm, friendly hand-inked 2D cartoon illustration with a gentle nostalgic quality. Take the visual lead from clean animation character sheets and production art, not painted storybooks or concept art. Draw from early hand-drawn animation through rounded construction, expressive silhouettes, organic ink, and slightly imperfect acting without copying extreme rubber-hose anatomy.
- Use visible dark coffee-brown contour lines with subtle variation in weight. Major forms should be clearly drawn and enclosed. Favor smooth, controlled, slightly organic contours over rigid geometry or rough sketch lines. Use selective interior linework; painted texture must not replace drawing structure.
- Build assets from clear local-color shapes first. Preserve large quiet areas of flat or nearly flat color; add only a small number of deliberate secondary shapes. Keep edges crisp and illustrated, with slight hand-drawn irregularity rather than fuzzy, feathered, dry-brushed, or eroded boundaries.
- Use restrained cel-like 2D shading: usually one warm shadow family and, where useful, one small highlight family. Keep shading graphic and subordinate to the drawing rather than modeling volume with broad gradients, airbrushing, watercolor washes, realistic material lighting, or painterly value noise.
- Represent material texture with sparse, intentional cartoon marks. Grass may use simplified tufts and leaves; earth a few patches, pebbles, and dots; sand a small number of flowing lines or grain clusters; water broad tonal shapes and simple ripples. Leave the dominant base color visible instead of filling every surface with equally weighted texture.
- Keep colors warm, muted, and natural. Use the Sloffee/brand colors below as anchors; introduce coordinated environment colors where needed for material distinctions. Give each terrain material one dominant local color, a darker supporting tone, and a few accents rather than many subtly varying hues. Avoid neon, cold digital blues, harsh pure white, and pure black where a warm alternative works.
- Use Sloffee Master v2.0 as the rendering-language benchmark for non-character assets too: share its contour quality, simplified shape construction, restrained shading, warm palette relationships, clean finish, and controlled level of detail, without copying Sloffee's anatomy or facial treatment.
- Keep any optional paper texture mainly in presentation sheets, menus, or backgrounds; do not use grain or brush texture as the primary rendering method for game assets.
- Create art at the resolution and viewing size required by its use. Check silhouettes, major color regions, material identity, and clean edges at actual in-game mobile size, without relying on tiny texture.
- Default to clean illustrated, non-pixel art throughout the game; use pixel art, 3D, photorealism, watercolor/gouache rendering, or another divergent style only when an asset brief explicitly records an approved exception.

### Style drift to avoid

Unless an asset brief explicitly approves a different treatment, avoid watercolor or gouache concept art, painterly children's-book rendering, heavily textured digital painting, soft airbrushed game art, realistic material studies, texture-filled terrain, fuzzy brush edges, forms defined mostly by shading instead of contour, and excessive environmental micro-detail. When choosing between a painted interpretation and a clean cartoon interpretation, choose the clean cartoon one. Clear contour does **not** mean harsh comic-book outlines: keep the line warm and moderately soft.

## Sloffee — character lock

Sloffee is an anthropomorphic sloth and the calm, slightly sleepy emotional center of the game: **“Slow down, sip up.”** Prioritize recognition and consistency over novelty. He is warm and friendly, never hyperactive, aggressive, or chaotic.

| Feature | Canonical direction |
| --- | --- |
| Construction | Soft, rounded, slightly chubby silhouette; large rounded head approximately 42% of total height and compact oval body approximately 58% in the neutral standing model. Long relaxed arms, short simple legs, small rounded hands and feet, cream belly, and a small top fur tuft. Treat the proportions as a visual target, not a measurement imposed on every pose. |
| Face | Cream facial area with integrated darker brown sloth eye markings. Medium-large symmetrical eyes, simple dark pupils, small centered dark oval nose, and small expressive mouth. Neutral eyes are **half-open** with a subtle peaceful smile: relaxed, not bored, sad, or intoxicated. |
| Acting | Relaxed shoulders, soft weighted poses, comfortable slouch when seated, and a recognizable rounded silhouette when standing. Slow breathing through the chest and upper belly, occasional slow blinks, tiny head movements, and subtle weight shifts; preserve the character model across frames. |
| Clothing | No permanent clothing. Clothing is allowed only as a specifically requested temporary skin or cosmetic, not as part of the base model. |
| Props | Keep props separate from anatomy. The canonical coffee mug is warm cream ceramic with a small muted green leaf symbol. |

### Expression guide

| Expression | Eyes and mouth |
| --- | --- |
| Neutral / idle | Half-open relaxed eyes; small peaceful smile. |
| Happy | Slightly more open eyes; warmer smile. |
| Sleepy | Eyes fully closed. |
| Sad | Drooping eyes and downward mouth; no smile. |
| Curious | Thoughtful expression, slight head tilt, one raised eyebrow; optional monocle as a prop. |
| Surprised | Fully open eyes; small O-shaped mouth. |
| Coffee mode | Noticeably more awake and enthusiastic, while remaining calm. |

Keep the same head shape, facial markings, eye structure, nose position, mouth scale, tuft, fur colors, arm length, and short legs in front, three-quarter, side, and back views, and across illustrations, sprites, stickers, and merchandise. Avoid anime or chibi reinterpretations, oversized anime eyes, realistic sloth anatomy, extreme rubber-hose deformation, and exaggerated neutral grins. A new pose, expression, prop, or setting does not authorize a character redesign.

### Color anchors

| Use | Color |
| --- | --- |
| Primary fur | `#6B4B35` warm medium coffee brown |
| Cream fur | `#E9D9C8` soft warm cream |
| Details and outlines | `#4B3425` deep coffee brown |
| Brand green | `#738A6E` muted botanical green |
| Warm latte accent | `#D6B79A` |
| Background paper tone | `#F5ECE2` |

Treat these as exact base colors for Sloffee and brand elements, with subtle tonal shading around them. Environments and terrain may introduce coordinated colors rather than forcing every surface into these six swatches, but each new color should serve a clear local-color shape instead of creating painterly hue noise.

## Reference and approval

The written Sloffee Master v2.0 direction governs the character until a revised reference is approved. The current login illustration (`game/scenes/auth/login/assets/sloffee_with_cup.png`) is also an interim reference for clean contours, simplified forms, and controlled shading; its backdrop and lighting are not canonical character colors. The current animation strip (`game/assets/sloffee/idle_deep_breath.png`) is an implementation reference, not a reason to override the character lock.

First approve a neutral, transparent, editable Sloffee model sheet showing the base character and useful views/expressions; then approve one representative environment or terrain sample at in-game scale. Once approved, use the model sheet **together with** this guide as the visual reference. If the two conflict, resolve the difference explicitly rather than silently changing Sloffee. The existing flattened PNG may need substantial repainting or recreation to meet this standard; an automatically traced image is not assumed to be an editable master.

## Asset creation and delivery

1. **Brief:** Record the asset's purpose, where and how large it appears on a mobile screen, required views/states/frames, background transparency, palette extensions, and any approved style exception. For tilesets, also define tile grid, terrain adjacency and transitions, and Godot atlas needs before drawing the full set.
2. **Sample:** Make one representative asset or small set. Review it beside Sloffee and the approved references at actual in-game size; check that expressions, silhouettes, edges, and terrain types remain legible.
3. **Produce:** Keep an editable source where practical (for example, layered artwork, vector paths, or a procedural source), and export appropriately sized game-ready images with consistent framing. Keep frame alignment and transparent edges clean for animations and tilesets. Prompts and seeds may be kept as provenance, but a prompt plus a flattened PNG is not an editable master for final character art or reusable tilesets. Such images may be used as working assets pending an editable master.
4. **Approve:** Compare final exports with the approved sample, inspect them in Godot on the intended mobile layout, and retain source-to-export provenance so later changes are possible.

### External image-generation handoff

When a requested asset needs illustration beyond what can be drawn convincingly with local tools, provide a self-contained prompt for the user's external image-generation tool rather than substituting a simplified vector drawing. State which existing image to upload as a reference, the intended output, the relevant style and character constraints from this guide, and the details to avoid. For terrain prompts, explicitly request visible coffee-brown contours, flat local-color areas, restrained cel-like shading, sparse symbolic marks, smooth controlled edges, low visual noise, and large quiet areas; say not to render the material as a watercolor or painterly texture swatch. Start with nearly flat grass, earth, sand, and water, adding detail only after the basic look matches Sloffee. Ask the user to bring the result back for visual review before treating it as an approved reference or game asset. Review drawing structure, detail density, palette, mobile legibility, backgrounds/alpha, and any tile seams or animation-frame alignment; iterate the prompt as needed.

Generated images are exploration or working assets until approved. A prompt and flattened image preserve intent but do not replace an editable master for final Sloffee art or a reusable tileset. Image generation alone does not guarantee transparency, exact tile geometry, seamless edges, or consistent frames; verify these separately before Godot integration.

## Evolution and existing art

Apply this guide to new work now. Existing assets are not automatically invalid: revise them as they are revisited. When the pixel-style café background (`game/assets/bg.png`) next receives substantial work, convert it to the illustrated direction instead of treating pixel art as a permanent exception.

Change this guide deliberately when the art direction evolves: increment its version, note what changed and why, identify affected reference art and assets, and decide which existing assets need updating. Record intentional one-off exceptions in the relevant asset brief. A change of direction does not require an immediate game-wide redraw.

### Revision notes

- **v1.1:** Clarified that Sloffee's clean animation-style rendering applies to terrain and other assets; replaced painterly/texture-friendly language with contour, local-color, controlled shading, and sparse-detail guidance. No existing game assets were changed.
