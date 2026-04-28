# Analysis Plan — thai-inhaler

## Selected viewpoints (10)
Pulled from `prompts/viewpoints.md`. Each Round-A sub-agent embodies one viewpoint.

1. **CMO / Customer Voice** — segment the US wellness buyer; JTBD around aromatherapy use; willingness-to-pay benchmarks for niche herbal products; category-entry-point analysis.
2. **Customer (target persona)** — first-person walk-through of discovery → trial → habit for a US wellness consumer encountering this brand on TikTok, in Erewhon, on Amazon.
3. **Competitor** — incumbents (Vicks Inhaler, Olbas, Saje, Plant Therapy, Vitruvi, doTERRA, Young Living, Tom's, Ranger Station, Boy Smells-adjacent sensory brands, lemon8 wellness creators). How they counter-move to a Thai-herbal positioning in 30/90/365 days.
4. **PR / Reputation** — cultural-authenticity narrative arc; Bloomberg-headline scenarios both ways; the "appropriation" failure pattern and the "credible carrier" success pattern.
5. **Domain expert** — indie wellness CPG conventions + Thai herbal product context. Unwritten rules; ya dom precedent in non-Thai markets; what generic-CPG frameworks miss.
6. **Risk / Compliance / Legal** — FDA classification matrix for nasal/oral inhalers with herbal ingredients; allowed claim language by classification; state-level variations; trademark considerations.
7. **Skeptic / Devil's advocate** — argue this brand should not be launched at all. Force defense of every assumption: TAM, supply, regulatory, founder fit, channel, timing.
8. **CFO / Financial Analyst** — unit economics for niche DTC + specialty retail wellness; CAC payback at typical conversion rates; pricing-elasticity scenarios; inventory/working-capital implications at indie scale.
9. **Futurist** — 3–5 year wellness category trajectory: functional ingredients, "nervous-system regulation" framing, anti-Big-Pharma sentiment, GLP-1 adjacency, the post-pandemic respiratory category, immigrant-cuisine-style normalization curves.
10. **Data analyst** — for every numerical claim across the other 9, identify what's measurable and propose the cheapest experiment.

## Round structure
- **A** (parallel): 10 viewpoint sub-agents → `cases/thai-inhaler/03_analysis/A_<viewpoint>.md`.
- **B** (main): synthesis → `B_synthesis.md` (convergences, contradictions, gaps, top findings, unresolved questions).
- **C** (1 sub-agent): adversarial red-team on B → `C_red_team.md`.
- **D** (parallel, 5 dives planned): see candidates below → `D_<topic>.md`.
- **E** (main): final synthesis → `E_final.md` — feeds Phase 4.
- **F+** (iteration mode, watchdog-driven): second adversarial pass, viewpoint critiques of E_final, verification per numerical claim, fresh angles.

## Round D — likely deep-dive topics
1. **FDA regulatory pathway** for nasal/oral inhalers with herbal ingredients in the US. Classification matrix (cosmetic vs. OTC drug vs. supplement vs. device vs. unapproved drug). Concrete claim-language do/don't list. Recent enforcement letters as precedent.
2. **Cultural-authenticity strategy** — analogue case studies: kombucha, kimchi, turmeric/golden milk, gua sha, tiger balm, ya dom in Western markets. What worked, what blew up, the sourcing/ownership pattern that travels well, the founder-narrative pattern.
3. **Channel mix economics** — DTC vs. Amazon vs. specialty retail (Whole Foods / Erewhon / Sprouts) vs. TikTok Shop, with break-even math and CAC/LTV at indie-brand scale.
4. **Differentiation map** — visual-narrative map of US aromatherapy / herbal-wellness brands across price × claim-type × cultural rooting × format. Where is the white space, what's defensible vs. trivially copyable.
5. **Creator-economy fit** — which creator archetypes (acupuncturists, "nervous-system" educators, Thai-American influencers, ASMR / sensory creators, biohackers, productivity/focus creators, sleep/anxiety creators) are highest-leverage for a tactile sensory product. Creator-economics back-of-envelope (gifting → seeded → paid → equity).

## Data sources / web research targets
- IBISWorld / Statista / Grand View Research for aromatherapy market size + CAGR (cite cautiously; cross-check)
- SPINS / Nielsen wellness category reports (mostly secondary citations — paywalled)
- FDA guidance docs: cosmetic vs. OTC drug; "structure/function" claims; recent warning letters in aromatherapy/herbal
- Reddit: r/aromatherapy, r/SkincareAddiction, r/herbalism, r/Thailand (consumer voice + practitioner voice)
- TikTok hashtags: #aromatherapy, #thaiherbs, #yadom, #nervoussystem, #sensoryreset (qualitative volumetric)
- Crunchbase / SEC / press for funded competitors (Saje, Vitruvi, Plant Therapy, Ranger Station)
- Substack wellness writers + The Cut + Goop + Air Mail archives for taste-shift signals
- Academic literature on borrowed-cultural-product diffusion in CPG

## Deliverable outline (for Phase 4)
1. Executive Summary
2. Market landscape (size, segments, growth, key players, channel mix)
3. Consumer + JTBD for the target buyer
4. Differentiation hypothesis (the recommended position) — with the case for and the case against
5. Marketing plan: channels, creative pillars, first 90 days
6. Regulatory red-lines (claim language do/don't)
7. Cultural-authenticity strategy
8. Unit-economics summary (channel-level)
9. What we'd test first (cheapest invalidating experiment)
10. Risks & open questions

## Methodology risks to monitor
- **Survivorship bias** in competitor analysis — funded/successful brands dominate visibility. Round D #4 must explicitly include known shutdowns and underperformers.
- **Cultural-blind-spot risk** — Western viewpoints will dominate the Round A pool. The Domain-expert and PR agents must explicitly engage Thai-context literature and the appropriation discourse.
- **Founder-info gap** — assumptions about founder identity / budget / existing assets. Recommendations must remain valid across the assumption envelope or be flagged with the bifurcation point.
- **Regulatory moving target** — FDA enforcement on inhalable herbal products has been uneven. Cite current guidance + warning letters and date the analysis.
- **Trend fatigue** — wellness trends shift fast. The Futurist viewpoint must distinguish secular vs. cyclical drivers.
- **Number hallucination** — the Data analyst viewpoint exists to keep the others honest; every numerical claim in `E_final.md` must trace to a cited source or be labeled estimate.
