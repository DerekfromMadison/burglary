# Gap Analysis — Economics / Numbers Lens

**Lens:** unit economics, channel CAC, contribution margin, P&L pencilability.
**Date:** 2026-04-27
**Subject:** v5 deliverable + 14 marketing sub-docs.
**Verdict in one line:** $50k Y1 produces a $20k learning, not a viable business — unless the founder treats months 1–3 as Phase 0 and reserves $30k for whichever channel proves itself.

---

## 1. The unit-economics table (the actual math)

Landed COGS = **$1.85** (per `12_beachhead_sku.md`, conservative ceiling $2.20).

| Channel | AOV | Channel deductions | COGS | **Contribution / order** | Gross margin |
|---|---:|---:|---:|---:|---:|
| DTC Shopify single | $12.00 | $0.50 processing + $0.80 ship subsidy | $1.85 | **$8.85** | 74% |
| DTC Shopify w/ free ship absorbed | $12.00 | $0.50 + $4.50 (USPS Ground 4oz) | $1.85 | **$5.15** | 43% |
| Amazon FBA single ($12) | $12.00 | $0.96 referral (8% Beauty) + $3.22 FBA | $1.85 | **$5.97** | 50% |
| Amazon FBA 2-pack ($24) | $24.00 | $1.92 + $4.50 FBA | $3.70 | **$13.88** | 58% |

Now CAC by channel from the v5 plan, **honest read**:

| Channel | Customers (90d) | Direct $ | Founder hours @ $50/hr | Loaded CAC |
|---|---:|---:|---:|---:|
| Friends DM (week 1–2) | 15 | $0 | 8 hrs = $400 | **$27** |
| IRL studio sampling | 12 | $4,000 | 60 hrs = $3,000 | **$583** (see §2) |
| TikTok organic + creator gifting | 25 | $3,200 + $300 PR | 80 hrs = $4,000 | **$300** (loaded) / **$140** cash-only |
| Reddit + LinkedIn community | 8 | $0 | 40 hrs = $2,000 | **$250** loaded / **$0** cash |
| Amazon (Vine + listing + PPC) | 15 | $1,500 | 20 hrs = $1,000 | **$167** loaded / **$100** cash |
| Paid Meta/TikTok 12-cell test | 25 | $5,000 | — | **$200** (if it works) |
| **Total** | **100** | **$14,000 cash** | **$10,400 founder time** | **Cash-only blended ~$140** |

The plan's "<$50 blended CAC" claim **only holds if founder hours are valued at zero AND every channel hits its midpoint**. With cash spend of $14k for 100 customers, blended cash CAC = **$140** — 2.8× the v5 headline. The plan inherits the `21_speed_to_100.md` table (line 62) honestly: it states $48 blended, but it gets there by reporting friends/Reddit/IRL/organic at $0–$80 while expensing the same channels at $4k–$5k in the allocation table. Both numbers cannot be true.

**Contribution-margin math on 100 customers:**
- 100 orders × $12 AOV (single SKU per `12_beachhead_sku.md` §1) = **$1,200 gross revenue**
- Blended contribution at ~50% (mix of DTC + Amazon) = **~$600 contribution dollars**
- 90-day spend per v5 = **$20,000**
- **90-day contribution margin: −$19,400.**

Even at the v5's optimistic $50 blended CAC × 100 = $5,000, that's still *below* the $20k allocation — meaning $15k is going to inventory, tooling, and overhead, not customer acquisition. The plan is not CAC-bound; it is **fixed-cost-bound**.

---

## 2. Where the math doesn't pencil — top 3 gaps with corrections

### Gap 1: IRL "$2.50–4 per engaged prospect" ≠ cost per customer

`20_inperson_playbook.md` §3 quotes "~$2.50–4.00 per engaged prospect." `04_deliverable_v5.md` echoes this. But the realistic conversion ladder from `20_inperson_playbook.md` §4 is:

- 400–800 sampled → 120–240 QR scans → **6–18 first orders.**

So actual CPA = $4,000 IRL budget ÷ 12 first orders = **$333/customer**, not $4. Even if you generously assume the "$2.50 per engaged prospect" only counts QR scans, with 240 scans = $600 in marginal sample cost and 18 buyers, that's $33/customer in *marginal* cost — but the $4,000 budget includes founder schlep, shelf-talker fixturing, sniffer replenishment, and venue-hopping. The **fully-loaded IRL CAC is $250–$400/customer**, not $40–80. The v5 channel-allocation row "$4,000 / IRL sampling — highest ROI per dollar" is asserted, not demonstrated.

**Correction:** budget IRL at $4k *expecting* 12–20 first orders. Don't claim "highest ROI per dollar." Claim "highest *signal* per dollar" — the plan's real value is the 7/10 customer-interview JTBD pattern (per `21_speed_to_100.md` §4), not unit-economics efficiency.

### Gap 2: Amazon revenue assumed inside 90 days; Brand Registry timeline says no

`19_amazon_playbook.md` §1 explicitly states: **"Brand Registry blocks day-1 launch... 1–2 weeks with trademark in hand, 9–12 months from scratch."** The v5 plan files trademark Week 1. USPTO TEAS Plus current first-action wait is **8–10 months** (cosmetic class 003). Without a registered trademark, Brand Registry routes through the alternative IP-pending path which:

- requires a pending TM application (OK, founder has one)
- typically lands in 60–90 days *after* application filing
- **gates A+ Content, Vine, Sponsored Brands video, Brand Tailored Promotions** — i.e., everything that justifies the $14 vs. $4 Poy-Sian gap (per `19_amazon_playbook.md` §5).

The 90-day plan slots 25–35 Amazon customers in weeks 8–12 (`04_deliverable_v5.md` line 45). Realistic outcome: Brand Registry approval lands **week 10–14** (Day 70–98); Vine reviews don't post until day 90+; meaningful organic rank takes 90–180 days more (`19_amazon_playbook.md` §7 targets BSR top 50 at day 90, top 20 at day 180).

**Correction:** model **0–8 Amazon customers** in the 90-day window, not 25–35. The Amazon channel is a Y1 month-4–9 story, not a Q1 story. Reallocate the assumed Amazon volume to either (a) DTC (force-multiply IRL/TikTok funnel) or (b) defer 50% of the Amazon $1,500 spend to month 4.

### Gap 3: Paid ads gate requires $4,800 minimum that is double-budgeted

`18_paid_ads_playbook.md` §3 specifies a 12-cell test at $5,000 / 21 days, kill threshold $400/cell at $60 CPA. That's the floor — **before** the §3 "double-down on top 2 cells with another $3K each over 14 days" ($6k more). Total to pick a winner: **$11,000**, not $5,000. Plus pre-launch infra: Polar Analytics ($400/mo, only kicks in once spend clears $5k/mo), Klaviyo ($45–$150/mo), Meta CAPI setup time.

The v5 channel allocation table line 60 lists "Meta + TikTok paid: $5,000" for first 90 days. That's the floor for the *first round* of testing. The actual scaling decision requires another $6k (months 4–6 if winner emerges) — and the v5 table only allocates $14k for "Meta + TikTok paid" across months 4–12. So the test is half-funded for 90 days **and** the scale-up bucket is only a third of what `18_paid_ads_playbook.md` §6 implies (MER 3.0 × $14k = $42k revenue, requiring $14k spend across 9 months, ~$1,500/mo — well below the $5k/mo Polar threshold).

**Correction:** either (a) shrink to a 6-cell test ($2,500 to find a winner, accept higher noise) or (b) hold the entire paid line until month 4 and explicitly mark months 1–3 as zero-paid. The v5 plan's Week 8 paid trigger is realistic only if all four gates pass — but if they don't, the $5k stays unspent, which means the $20k 90-day spend is actually $15k, which means inventory + IRL + tooling consume the entire budget and there is no test capital.

---

## 3. The realistic 90-day P&L (honest version)

| Line | v5 stated | Honest restatement | Why |
|---|---:|---:|---|
| Revenue (100 × $12 AOV) | $1,200 | **$960** | 80% conversion to single-SKU at $12; 20% bundle attach impossible without 2-pack SKU live |
| Inventory consumed (100 units COGS) | $185 | $185 | Same |
| Channel fees (Amazon ref + FBA on 8 units) | — | $40 | Only 8 Amazon orders realistic |
| Shipping subsidy (DTC 92 orders × $0.80) | — | $74 | Founder eats USPS Ground |
| **Variable contribution** | **~$1,000** | **~$660** | |
| Marketing spend (per v5 table) | $20,000 | **$17,500** | Paid line ~50% spent because gates partially fail |
| OEM inventory production | $3,200 | $3,200 | Same |
| Tooling (Helium 10, Polar, Klaviyo, Shopify) | $400 | $1,200 | 90 days of Shopify $39 + Klaviyo $45 + Helium $79 + Polar tier 0 + domain |
| Founder time @ $50/hr × 600 hrs | $0 | **$30,000** | Honest cost of solo schlep |
| **Cash burn (no founder cost)** | $20,000 | **$21,200** | |
| **Loaded burn (founder time real)** | $20,000 | **$51,200** | |
| **90-day contribution margin (cash)** | −$19,000 | **−$20,540** | |
| **Cumulative spend / customer** | $200 | **$212 cash / $512 loaded** | |

The CFO model in `A_cfo.md` §2.5 said breakeven = **5,357 orders / year** at $14/order contribution. The v5 plan delivers ~100 orders / 90 days = ~400 orders / year on linear extrapolation. **The 90-day plan delivers 7–8% of what's needed for cash breakeven.** That's not failure — that's by design (`A_cfo.md` calls Y1 bootstrap "validated but starving"), but the v5 deliverable doesn't say "starving"; it says "<$50 blended CAC, 100 customers, <$20k spend."

---

## 4. The break-even cohort (when does this become contribution-positive?)

Using the honest contribution per order ($6.60 blended, after FBA + DTC mix; 50% margin on $12 AOV minus shipping subsidy minus packaging/processing):

- **Fixed cash cost / 90 days:** $17,500 marketing + $1,200 tooling + $3,200 inventory = **$21,900**
- **Customers needed to cover fixed cost at $6.60 contribution/order:** $21,900 / $6.60 = **3,318 first-purchase customers** (or 1,659 customers averaging 2 purchases).
- **Customers needed if AOV lifts to $24 (2-pack live):** $21,900 / $13.88 = **1,578 customers** (still 16× the 90-day target).

The v5 plan hits 100 customers. To become contribution-positive *on cash spend alone*, the brand needs 1,500–3,300 customers — which at the $50 blended CAC v5 quotes implies **$75k–$165k of additional acquisition spend**, i.e., the entire remaining $30k of the Y1 budget plus a Series-Pre-Seed.

The break-even cohort is **not 100, not 500, but ~1,600 customers** if the 2-pack SKU is live and 25% reorder, per `A_cfo.md` §2.5. The 90-day plan is a Phase 0 measurement instrument, not a profitable launch.

---

## 5. The financial kill-switch (what spend pace / CAC says STOP)

Codified into 4 numeric triggers:

1. **Cash CAC > $100 by Day 45.** If the plan has spent $9k+ to acquire <90 customers, the math collapses. Action: pause IRL sampling and creator paid; reroute remaining budget to the single highest-converting channel.
2. **Inventory sell-through < 20% by Day 60.** That's < 300 units sold of 1,500. Action: halt the second OEM order trigger (per `12_beachhead_sku.md` §3 reorder at 400 units cover); the ICP is wrong, not the supply.
3. **Sean Ellis "very disappointed" < 30% on N≥30 responses by Day 75** (per `21_speed_to_100.md` §4 + `04_deliverable_v5.md` PMF gate). Action: stop all paid spend regardless of CAC; pivot positioning before any further acquisition.
4. **30-day repeat purchase rate < 8% by Day 60.** The aromatherapy-replenishment thesis is dead. Action: shift remaining Y1 budget from acquisition to retention experiments (refill, bundle, ritual card) — the brand is a novelty and CAC will never amortize.

Hard stop on combined trigger: if any 2 of the 4 fire, the founder should not spend the second-90-day $25k. Burn the lesson, not the budget.

The v5 plan and `06_risks_and_kill_switches.md` reference some of these but **do not pre-commit specific dollar pacing** — the cash CAC trigger ($100) and inventory trigger (20% sell-through) are not in the v5 deliverable and need to be added.

---

## 6. Verdict — viable business or $20k learning?

**$50k Y1 buys a $20k learning.** The v5 plan, executed honestly:

- delivers **100 customers** at **$140 cash CAC / $400+ loaded CAC** (not $50)
- generates **~$1,200 revenue** against **$20,000 marketing spend** = **−$18,800 contribution in 90 days**
- exits Q1 with a **single validated channel** (whichever IRL studio / TikTok creator / Reddit thread popped), **15–25 reviews on Amazon** (Vine slow), and **a Sean Ellis number** that determines whether spending the *second* $25k is rational
- **Y1 trajectory if all gates clear:** ~400 customers, ~$5k revenue, −$45k contribution. This matches `A_cfo.md` Scenario A: "EBITDA: ~$9K. Roughly breakeven, no founder salary covered" — but only at the higher 1,430-customer Y1 figure that Scenario A assumes from $50k of acquisition spend at $35 blended CAC. **The v5 plan's 100-in-90-days pace is too slow to hit that Scenario A endpoint by month 12.**
- **Y1 trajectory if 2 gates fail:** ~150 customers, ~$2k revenue, −$40k contribution, and the founder has a $5–10k inventory write-off and an FDA-language audit bill ($2k per `21_speed_to_100.md` §6) to show for it.

**The honest reframe:** Don't sell the $50k Y1 budget as "100 paying customers at <$50 CAC." Sell it as **"$20k of structured Phase 0, designed to surface which 1 of 6 channels has product-market signal, with a hard kill-switch at Day 60 if Sean Ellis < 30%."** That's true. That's defensible. It's not a viable business in 90 days. It's the *cheapest legal way* to find out if there's a viable business in 18 months.

The CFO model (`A_cfo.md` §3) reaches the same conclusion: "Bootstrap produces a real-but-small business (~$130K Y1, founder-supported); seed produces a fundable trajectory." The v5 deliverable accidentally implies the bootstrap path delivers the $130k-Y1 outcome from the 90-day plan; it does not. The 90-day plan delivers the *signal* that the $130k-Y1 outcome is achievable in months 4–12 if the founder has another $25–30k to deploy.

---

## 5-line summary

- **Filename:** `/home/diabasis/codeman-cases/burglary/cases/thai-inhaler/_logs/gap_economics.md`
- **Top math gap:** v5's "<$50 blended CAC" requires founder hours valued at $0; cash-only CAC is **~$140 / customer** for the 90-day cohort.
- **Hidden timing gap:** Amazon Brand Registry won't approve until Day 70–98 (TEAS Plus pending route), so the 25–35 Amazon customers slotted in weeks 8–12 are likely **0–8** customers in reality; reallocate or defer the $1,500 Amazon spend.
- **Break-even cohort is ~1,600 customers, not 100** (`A_cfo.md` §2.5 confirms: ~5,357 orders / year for cash breakeven at $14 contribution; bootstrap path is "validated but starving" by design).
- **Verdict:** $50k Y1 produces a $20k structured learning + Sean Ellis decision-grade signal; it does NOT produce a contribution-positive business in 90 days. The v5 deliverable should reframe the headline from "100 customers at <$50 CAC" to "Phase 0 measurement at <$140 cash CAC, with a hard kill-switch at Day 60 / Sean Ellis < 30%."
