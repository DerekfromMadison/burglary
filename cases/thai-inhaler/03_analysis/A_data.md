# Round A — Data Analyst Viewpoint

Case: thai-inhaler. My job is to keep the other nine viewpoints honest about numbers. Every other agent will produce confident assertions ("the US aromatherapy market is $X billion," "TikTok #yadom is exploding," "Erewhon shelf turn for niche aromatherapy is Y"). Most of those numbers are either (a) directly derivable from public dashboards for under $200, (b) buyable via syndicated reports the founder will not pay for, or (c) genuinely unobservable until the brand ships product. Knowing which bucket each claim falls into is the entire value of this viewpoint.

---

## 1. What this viewpoint sees

The data-honesty problem in this case has three layers.

**Layer 1: the headline market-size numbers are theater.** The US aromatherapy market is variously reported at $1.6B (older Statista snapshots), $2.25B (Spherical Insights 2033 forward-cast back-calculated), $3.14B (Precedence Research, 2025), and global $8.11B (Coherent Market Insights, 2026), with CAGR estimates between 7% and 12%. These reports use different category boundaries (essential oils only? diffusers? candles? carrier products? topical balms?), different channel coverage (retail-tracked SPINS data vs. modeled DTC vs. global rolled into US extrapolations), and different methodologies (top-down GDP-share vs. bottom-up brand audit vs. survey-extrapolated). The honest answer is: the US aromatherapy market is somewhere between $1.5B and $3B depending on definition; CAGR is somewhere between 6% and 10%. Anyone citing a single figure to two decimals is performing certainty they don't have.

For this case, that doesn't actually matter much. A $1.5B market and a $3B market both support a sub-$5M indie brand. The TAM debate is a distraction. What matters is the addressable subsegment (aromatherapy-curious wellness consumer who buys inhalers / portable formats vs. diffuser-and-oil core users), and that subsegment is not in any syndicated report. It has to be measured, not cited.

**Layer 2: the comparable-brand revenue numbers are gettable but never publicly clean.** Poy-Sian is the obvious benchmark. Its US Amazon ASINs (B01FLJN7I6 6-pack, B01B6FY9HC 3-pack, B00MDDYTAO, B01CWXPG5G single, B00WCV8V8I cotton variant) have BSRs that move daily and revenue estimates that vary 3–5x between Helium 10 and Jungle Scout. Vicks Inhaler and Olbas Inhaler are the western incumbents. Saje, Plant Therapy, Vitruvi are the funded indie aromatherapy comp set; their revenue is partly visible via Crunchbase / press / SimilarWeb DTC traffic but margins and channel mix are opaque. Indie wellness Y1 revenue medians come from aggregated decks (Beauty Independent, BeautyMatter, RetailDive) and founder-podcast disclosures; they are anecdotal-aggregated, not statistical.

**Layer 3: the behavioral numbers — willingness-to-pay, retention, frequency-of-use, gifting rate — are unobservable without primary research.** No syndicated report tells you whether a US wellness consumer will pay $14 for a Thai-positioned inhaler when Poy-Sian sells 6-packs for $11 on Amazon. No data-broker has a panel for "people who repurchased an aromatherapy inhaler within 90 days." These are the highest-decision-quality numbers and the only way to get them is to spend money getting them.

The viewpoint's structural risk: the other nine agents will write confidently about (1) and (2) and hand-wave through (3). The downstream synthesis will inherit that confidence asymmetry unless this document explicitly de-rates it.

---

## 2. The 12–15 load-bearing claims and how to test each

| # | Claim (the form it will appear in elsewhere) | Likely cited source | Cheapest valid test | Estimated cost (time + $) | Decision-quality of the test |
|---|---|---|---|---|---|
| 1 | "US aromatherapy market is $X billion, growing Y% CAGR" | Statista, Grand View, Precedence, Coherent | Cross-check 3 syndicated summaries via free press releases; do NOT buy the full report. Bracket as "$1.5B–$3B, 6–10% CAGR." Treat as TAM context only. | $0, 1 hour | LOW for go/no-go. Useful only as floor: "category is large enough." |
| 2 | "US nasal-inhaler subcategory (the actual addressable sub-segment) is $Z million" | Nowhere — no syndicated report carves this | Bottom-up: count the top 30 inhaler ASINs on Amazon US, estimate revenue with Helium 10 + Jungle Scout, multiply for off-Amazon (assume Amazon is 40–60% of category for niche personal care). | Helium 10 trial $39 or Jungle Scout $49/mo, 3–4 hours | MEDIUM-HIGH. This is the actual addressable market and the founder needs the number, not the headline TAM. |
| 3 | "Poy-Sian does $A,000–$B,000/month on Amazon US across all ASINs" | Helium 10 / Jungle Scout estimates | Pull all Poy-Sian ASINs by brand search; sum estimated monthly revenue; sanity-check vs. BSR-to-units conversion table. Track 4 weeks for variance. | Helium 10 trial, 2 hours | HIGH. This is the most informative single number in the case — it is a working ya-dom brand operating in the exact channel, with no marketing spend, no US team, and minimal listing optimization. |
| 4 | "Vicks Inhaler and Olbas Inhaler combined Amazon revenue is $C,000–$D,000/month" | Helium 10 / Jungle Scout | Same method as #3 for the western incumbent ASINs (B000PIJFGC Olbas, the various Vicks SKUs). Establishes price-point ceiling and category awareness baseline. | Same trial, 1 hour | HIGH. Defines the "if everyone in this category bought my product instead" upper bound. |
| 5 | "Target willingness-to-pay is $X for a single Thai herbal inhaler" | Founder hopes; no public source | Fake-PDP test: build 2–3 single-product landing pages at different price points ($9.99, $14.99, $19.99 single; $32 / $42 / $52 3-pack), drive ~2,000 Meta clicks each via lookalike of Saje / aromatherapy buyers, measure add-to-cart rate and email capture. No inventory required. | $400–$600 ad spend, $20 Carrd / Shopify trial, 4 days | HIGH. This is THE pricing test. It costs less than buying a Statista report and tells you something Statista can't. |
| 6 | "TikTok #yadom is growing X% per month" | Founder eyeballing TikTok | TokAuditor or Pentos free tier OR manual: log #yadom, #thaiherbs, #thaiinhaler, #nasalinhaler, #aromatherapy view counts weekly for 3 weeks; compute slope. Cross-check with Google Trends 5-year curve for "ya dom" and "thai inhaler" search terms. | $0–$30, 30 min/week × 3 | MEDIUM. Trend velocity is real signal but TikTok view-count growth is not the same as purchase-intent growth. Treat as "is the category warming?" indicator, not "demand exists." |
| 7 | "Erewhon shelf turn for a niche aromatherapy SKU is N units/store/week" | Buyer-decks; never published | Cannot be measured cheaply. Workaround: ask 3–5 indie wellness brands currently shelved at Erewhon (LinkedIn DM founders) what their turn rate was in months 1–6. Sample size will be small but informative. | $0, 4–6 hours of outreach | LOW-MEDIUM. Founders will give ranges, not numbers, and self-report is biased upward. But it is the only path without buying SPINS data ($5K+). |
| 8 | "Indie wellness brand Y1 revenue median is $X" | Beauty Independent / BeautyMatter aggregates; founder podcasts | Read 10 founder-interview podcast episodes (Beauty Independent's podcast, How I Built This wellness episodes), build a manual sample of 20 disclosed Y1 revenues, take median. | $0, 6 hours | LOW-MEDIUM. Survivorship-biased sample (only successful enough to be interviewed), but better than no benchmark. Bracket explicitly. |
| 9 | "Retention / repurchase rate for sensory-product CPG is R% at 90 days" | Brand-internal data; almost never disclosed | Two paths: (a) ask the same indie founders from #7 their 90-day repeat rate; (b) for a closer proxy, run a 60-person paid product-test panel via Respondent.io or PickFu — ship them an inhaler-class product (Poy-Sian works as proxy), survey at 30 and 60 days for "still using? bought another?" | $300–$800 panel, 3 weeks | MEDIUM. Panel data is N=60 not N=600, but it is empirical signal where alternatives are zero. |
| 10 | "Target customer segment size: 25–55 wellness-buying women is Z million" | ACS / Statista / Mintel | US Census ACS 25–54 women = ~57M. Of those, "wellness buyers" estimated at 35–45% based on multiple Mintel/NPD summaries — call it 20–25M. This is gettable cheaply. | $0, 1 hour | MEDIUM. Number is real; what matters more is the percentage of those who'd ever consider an inhaler format, which is unobservable without #5. |
| 11 | "CAC for aromatherapy DTC on Meta is $X" | Founder podcasts; ad-platform benchmarks | Test it. Run #5's fake-PDP test through to email capture, compute cost-per-email; benchmark against indie-CPG range ($8–$25 cost per qualified lead, $35–$80 first-purchase CAC for sub-$30 AOV products in 2025). | Included in #5 spend | HIGH for early signal. Benchmark numbers are wide; only a real test produces a real number. |
| 12 | "Amazon break-even for a $14 inhaler at Y units/month requires Z reviews / Z BSR / Z PPC ACoS" | Helium 10 calculator | Helium 10's profitability calculator + a manual unit-economics sheet. Fees ~15% referral + $3.30 FBA pick-pack for sub-1lb item + COGS + PPC. Solve for break-even units. | Trial $39, 2 hours | HIGH. This is deterministic given inputs; the only uncertainty is COGS and PPC ACoS. |
| 13 | "Whole Foods / Sprouts / Erewhon margin and slotting cost for a new aromatherapy SKU" | Buyer-decks / RangeMe / specialty distributor sheets | Free RangeMe brand profile + 2 specialty distributor convos (KeHE, UNFI rep). Slotting at Erewhon is famously close to free for aligned brands; Whole Foods regional buy-in via local forager is also low-cost. Sprouts requires more demo investment. | $0, 3–4 hours of calls | MEDIUM. Numbers are directional and vary by buyer / region. |
| 14 | "Search volume for 'ya dom,' 'thai inhaler,' 'nasal inhaler,' 'aromatherapy' is X / month and trending Y%" | Google Trends + Keyword Planner / Ahrefs / SEMrush free | Google Trends (free) for trend slope. Ahrefs / SEMrush free trials for absolute monthly search volume. Expected: "aromatherapy" 100K+/mo flat; "nasal inhaler" 20–40K/mo flat; "thai inhaler" sub-2K/mo growing; "ya dom" sub-1K/mo growing. | $0, 1 hour | HIGH for the demand-curve question. Tells you whether SEO-driven discovery is viable (probably not for "ya dom"; possibly for "nasal inhaler"). |
| 15 | "Gifting rate / non-self-purchase share is X% of category" | Brand internal; rarely shared | Ask 200 people in a 2-question Pollfish or PickFu poll: "Do you buy aromatherapy products for yourself, as a gift, or both?" PickFu N=50 is $50; Pollfish targeted N=200 is ~$300. | $50–$300, 1 day | MEDIUM. Self-report on past behavior, but useful for channel decisions (gift positioning vs. self-care positioning changes packaging, retail location, ads). |

Two more worth flagging even though I'm at 15:

| # | Claim | Test | Cost |
|---|---|---|---|
| 16 | "Asian-American + Thai-American population overlap with wellness buyers is N" | ACS Asian-American 22M; Thai-American ~330K; cheap to estimate as a beachhead segment. | $0, 30 min |
| 17 | "FDA warning-letter rate for inhalable / aromatic herbal products in last 36 months" | FDA warning-letter database is fully public and searchable. Frequency and triggering claim language is the actual risk-quantification. | $0, 2 hours |

---

## 3. The first $1,000 of measurement (and 2 weeks)

If the founder hands me $1,000 and 2 weeks before they commit to a launch direction, the allocation is:

**Week 1**

- **$39 — Helium 10 single-month trial.** Pull Poy-Sian, Vicks, Olbas, and the top 30 nasal-inhaler ASINs. Compute (a) US Amazon nasal-inhaler subcategory revenue, (b) Poy-Sian's specific monthly revenue, (c) BSR distribution in the category. Time: 4 hours. This single deliverable kills or confirms the "is the category big enough on Amazon alone" question. (Claims #2, #3, #4, #12.)

- **$0 — Google Trends, Keyword Planner, free Ahrefs trial.** Slope for "ya dom," "thai inhaler," "nasal inhaler," "aromatherapy," "anxiety inhaler," "focus inhaler," "stress inhaler." Two hours. (Claim #14.) Combined with TikTok hashtag manual logging — set a recurring 30-min Friday log of #yadom, #thaiherbs, #thaiinhaler, #nasalinhaler, #aromatherapy, #nervoussystem, #sensoryreset view counts. Three weekly data points = directional slope.

- **$50–$100 — SparkToro single search.** Audience research on "people who follow aromatherapy" or "buyers of essential oils" — what other brands, podcasts, hashtags, websites do they engage with. Cheapest path to a creator/influencer shortlist that isn't "founder's gut." (Indirect support for claims #6, #15.)

- **$0 — 5 LinkedIn / Instagram DMs to indie wellness founders shelved at Erewhon / Whole Foods.** Ask: launch budget, Y1 revenue, current monthly revenue, repeat-purchase rate, biggest surprise. (Claims #7, #8, #9.) Survivorship-biased and small-N but real signal where there is otherwise zero.

- **$0 — FDA warning-letter database scrub** for "inhaler," "aromatherapy," "essential oil," "nasal," "respiratory," "herbal" in last 36 months. Tabulate triggering language. (Claim #17.) This input goes to the Risk/Compliance viewpoint but the data analyst is the one who actually pulls it.

Running total: ~$140. Remaining: $860.

**Week 2**

- **$500–$650 — Fake-PDP Meta-ads pricing test.** Three Carrd or Shopify-as-storefront-only landing pages at $9.99, $14.99, $19.99 single inhaler price. One unified Meta campaign with 3 ad-set variants targeting lookalike of Saje + Plant Therapy + aromatherapy interest. Goal: 1,500–2,500 clicks, measure add-to-cart and email-capture rate per price point. Email sequence captures "would you pay $X for this" follow-up. (Claims #5, #11.) This is the highest-decision-quality test in the entire $1,000 budget. It is also the test most founders skip.

- **$50 — PickFu N=50 poll** on packaging concept and gifting. Two questions: (a) "Which of these 3 packaging directions appeals most?" (cultural-Thai vs. minimalist-modern vs. functional-clinical), (b) "Would you buy this for yourself, as a gift, or both?" (Claim #15.) Bonus: insert one open-ended "what would make you skeptical of this product?" — qualitative gold for the cultural-authenticity strategy.

- **$50–$150 — order Poy-Sian + Vicks + Olbas 3-packs for hands-on benchmarking.** Use them. Show them to 10 friends in your target demo. Note reaction, perceived quality, sensory differentiation. This is the cheapest competitor teardown and the founder probably hasn't done it.

- **$0 — synthesize.** Build a one-page dashboard with the 15 claims, the measured value, the confidence band, and the action implication. This is the deliverable the founder actually needs out of the $1,000.

**Total: ~$840–$990.** Buffer for paid TokAuditor week or one extra $50 PickFu poll.

**What this $1,000 does not buy:** SPINS retail-tracked data ($5K+), Mintel reports ($3K+), a Statista enterprise account, Nielsen panel access, custom NPD survey work. The honest framing is: $1,000 buys Amazon-data-driven category sizing, behavioral pricing signal, qualitative founder benchmarks, and trend-velocity directional reads. It does not buy retail-channel sizing or longitudinal retention. Those questions stay open until the brand actually ships and tracks itself.

---

## 4. What you cannot tell from this viewpoint

Three categories of epistemic humility are mandatory once the data is back.

**4a. Numbers do not interpret themselves.** If Poy-Sian does $80K/month on Amazon US with zero marketing, that can be read as (a) "the demand is there, an unoptimized listing is leaving money on the table, an actual brand will multiply this" OR (b) "Poy-Sian has saturated the addressable demand of curious-westerners-and-Thai-diaspora and an actual brand will fight for the same 8,000 monthly buyers." Same data, opposite implications. The data analyst can flag the ambiguity but cannot resolve it; that's the strategist's job.

**4b. Behavior data lags identity data.** A fake-PDP test measures click-and-cart behavior of a lookalike audience that does not yet know whether the brand is a Thai-American founder building authentic carrier or a white-owned brand performing Thainess. The cultural-authenticity discourse (PR viewpoint's domain) only manifests once the brand has a face, an Instagram, a press hit. The pricing data from Week 2 is real but it is conditioned on a founder identity not yet visible to the test audience. Re-test with founder reveal before believing the WTP number for a launched brand.

**4c. The variance band is wider than the model.** Helium 10 and Jungle Scout disagree by 2–5x on monthly revenue for low-BSR products. PickFu N=50 has confidence intervals of ±15 percentage points. Single-week TikTok hashtag growth is mostly noise; even three-week growth conflates organic trend with a single viral video. The honest deliverable says "$X ± a factor of 2," not "$X." Founders, downstream agents, and synthesis documents will round those bands down to point estimates by default; the data analyst's standing job is to put the bands back in.

**4d. The cheapest tests are biased toward channels they can measure.** Meta-ad fake-PDP tests reward products that work on Meta. They will systematically underweight brands whose actual go-to-market is creator-seeded TikTok, retail-driven discovery, or in-person sampling at yoga studios. If the founder's strategic answer is "I'll launch via 200 acupuncturists hand-selling at clinics," none of the $1,000 measures any of that. The data analyst should explicitly note: "the measurement plan reflects measurable channels; product-channel fit for this brand may be elsewhere, in which case different tests apply."

**4e. Benchmarks from successful indie brands are survivorship-biased and almost always tell a more optimistic story than the median launched brand. The data analyst should always pair "median Y1 revenue of disclosed indie wellness brands is $X" with "the denominator excludes brands that quietly died." For any benchmark drawn from podcasts, founder interviews, or BeautyMatter coverage, assume the true median is 30–50% lower.**

---

## Closing note for the synthesis round

The single most underweighted claim in this case will be #5 (willingness-to-pay) because it is the hardest to measure cheaply and the most consequential. If the synthesis document picks one number to interrogate hard, that's the one. Cost-per-acquisition (#11) and Amazon-subcategory revenue (#2, #3) are second and third. Everything else is supporting evidence.

If the founder skips the $500 fake-PDP test to "save money," they are saving the wrong $500. The Helium 10 trial and a fake-PDP test are the two pieces of measurement that change the launch decision; everything else informs it.
