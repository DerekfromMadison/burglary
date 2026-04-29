# Wave-1: Lifecycle Retention — Email / SMS / Referral Flows

**Case**: thai-inhaler
**Lens**: retention infrastructure (the v5 gap)
**Date**: 2026-04-27
**Status**: NEW sub-doc; codifies the email/SMS/referral architecture missing from v5.

The v5 deliverable acquired ~100 customers across 90 days and then... had no flow. Welcome popup + cart-abandon = the entire retention spec. `gap_channels §5` flagged this as the largest single retention crater; `gap_journey §5` flagged the time-based SMS cadence (Day 3 / 10 / 21) as misaligned with how a 60-day-depleting nasal stick actually consumes. v6 commits to **10 specific flows**, depletion-anchored where possible, with referral baked into the welcome flow + the IRL keychain QR + the "send to a friend" envelope from `12_beachhead_sku_v2.md`.

Tooling: **Klaviyo** for email (free tier covers <250 contacts; $45/mo at 500 contacts), **Postscript** for SMS ($25/mo Starter), **ReferralCandy or Friendbuy** for referral mechanic ($49/mo Starter). 90-day tooling budget: ~$1,200 (per `21_speed_to_100_v2.md` §6).

All copy is verb-object cosmetic-safe (per `04_details/04_fda_compliance_v2.md`). No body-system claims. No "calms anxiety," "supports nervous system," "regulates stress." Object of every verb is the moment, the scent, the ritual, or the product — never the body.

---

## Flow 1: Welcome series (5-email Klaviyo, fires on first-purchase trigger)

The single most under-built flow in v5. v6 ships a real onboarding journey.

| # | Day | Subject | Content |
|---|---|---|---|
| 1 | Day 0 (purchase confirm) | "your tube is on the way (and so is the sticker)" | Order confirmation + 60-second supplier-journey video (founder-narrative, transparency-first per `14_differentiation_v2.md`) + ETA. Mentions the unboxing kit explicitly: "look for the 3pm sticker — that's the part Vicks doesn't ship." |
| 2 | Day 1 | "the ritual card, in case yours got bent" | Downloadable PDF of the illustrated ritual card (twist → inhale once each nostril → name the next minute out loud). $5-off code on second purchase ($5_NEXT). Plain. |
| 3 | Day 3 (cue email) | "where did you put the sticker?" | Asks the customer to reply with a photo of where she stuck the 3pm sticker (laptop bezel, water bottle, planner). Free-text reply — no link, no offer. UGC harvest. Codifies the habit cue. |
| 4 | Day 7 | "what does it smell like to you" | Open-text invitation to describe the scent in her own words. Becomes future creator content + product copy. (Apothékary's "what did you sip on" prompt; works.) |
| 5 | Day 14 | "the friend tube" | Reminds her of the second tube + send-to-a-friend envelope. Activates the referral loop with the give-$5 / get-$5 code (FRIEND5). One sentence: "the second tube was meant to leave your house." |

**Trigger**: first-purchase event. **KPI**: open rate ≥35% (above CPG benchmark 25–30%), click-through ≥4%, reply rate (Day 3) ≥5%.

---

## Flow 2: Post-purchase SMS sequence (Postscript, fires on first-purchase trigger)

Online-acquired-only. IRL-acquired customers get a different sequence (see Flow 6).

| # | Day | Message | Notes |
|---|---|---|---|
| 1 | Day 1 | "hey [name], your tube ships today. tracking: [link]. — [founder]" | Plain, founder-voice. |
| 2 | Day 7 | "how's the first inhale?" | Free-text reply, no link, no offer. The emotional check-in. |
| 3 | Day 14 | "send a photo of where you keep it. tag @[brand] on insta." | Photo-of-in-context-use, harvested for UGC. |
| 4 | Day 45 (depletion-anchored) | "most people are halfway through by now. refill at $12 → [link]. ships before you run out." | First money-asking SMS. Honest depletion language. |
| 5 | Day 60 | "the second tube was meant to leave your house. send it free with code FRIEND5 → [link]" | Activates dormant gift mechanic from `12_beachhead_sku_v2.md`. |
| 6 | Day 75 (conditional, only fires if 30-day repeat <12%) | "we're sold out of single tubes for the next 10 days. reserve a 2-pack now to skip the wait → [link]" | Manufactured scarcity churn-save. Only deployed if behind retention target (per `gap_journey §5`). |

**Trigger**: first-purchase event + opt-in. **KPI**: Day 7 reply rate ≥10%, Day 45 click-through ≥18%, Day 60 referral activation ≥6%.

The depletion-anchored shift (Day 45 not Day 21) is the load-bearing change. v5's Day-21 subscribe-and-save pitch fired before habit had a chance to form, reading as "the brand wants the wallet locked before the product earns it" (per `gap_journey §1 stage 5`). v6 anchors the first money-ask to actual product depletion (a tube lasts 4–8 weeks of daily use).

---

## Flow 3: Referral mechanic (give-$5 / get-$5)

ReferralCandy or Friendbuy. Code structure: give-$5-off / get-$5-off. Deployed via:

1. Welcome Email #5 (Day 14) — primary digital activation point.
2. Welcome SMS #5 (Day 60) — secondary activation when gift mechanic feels organic.
3. The "send to a friend" envelope physical card in the unboxing kit (per `12_beachhead_sku_v2.md`) — primary IRL activation.
4. The IRL keychain mini's QR landing page — converts the 20%-off code to a give-$5/get-$5 referral-code at the same moment.

**Why the referral mechanic is non-optional**: a sensory product whose value prop literally includes "let a friend smell this" has the highest natural referral coefficient in CPG (per `gap_channels §3`). Magic Mind's referral loop drove 18% of Y1 revenue. v5 left this on the table.

**KPI**: referral activation rate (% of first-time customers who send at least one referral) ≥15% by Day 90; conversion rate on referrals (% of referrals that become customers) ≥20% (high because the trust transfer is pre-built).

---

## Flow 4: Subscribe & Save attach trigger

NOT a Day-21 push (that was v5's mistake). Fires at **Day 21 post-second-purchase** (i.e., once a customer has made a repeat order, the framing of "automate your refill" lands honestly). Email + SMS combined.

**Email subject**: "you came back. want us to show up automatically?"
**SMS**: "your second tube means you've found your moment. subscribe and we'll ship every 8 weeks at $11.40 (5% off — Amazon's minimum)."

The 5% discount is the Amazon minimum for Subscribe & Save; the math doesn't need a deeper discount because the customer has already proven repeat intent. **DO NOT** offer 15% Subscribe & Save until repeat-rate cohort data shows otherwise — heavy discounting on S&S compresses margin without lifting attach rate at the early-cohort scale.

**KPI**: S&S attach rate among second-time buyers ≥12% by Day 90 (vs. v5's "8% by Day 90" which assumed S&S was sold to first-time buyers, conflating intent with habit).

---

## Flow 5: VIP / repeat-customer segment

Customers who have made 2+ orders within 90 days. Auto-segmented in Klaviyo via order-count condition.

**Drop into segment triggers**:
- Early-access SKU drop email when SKU 2 (2-pack) ships.
- Private Discord invite (when founder builds a community asset — month 4–6).
- Hand-written postcard on order #3 (founder labor, ~10 min/customer; small but consistent).

**KPI**: of customers who hit VIP segment by Day 90, ≥40% repeat again within 60 days (cohort-LTV multiplier).

---

## Flow 6: IRL-acquired post-trial SMS (3-message sequence)

For customers acquired via studio sampling — different cadence than online-acquired Flow 2 because they've handled the product physically before purchasing.

| # | Day | Message |
|---|---|---|
| 1 | Hour 4 (post-scan) | "thanks for trying [brand] at [studio name]. your 20%-off code: TRY20. expires in 14 days. → [link]" |
| 2 | Day 5 (post-scan, no purchase) | "still thinking? here's the 60-second founder video → [link]. or send a question, no pressure." |
| 3 | Day 13 (last-call, no purchase) | "code TRY20 expires tomorrow. ships in 2 days if you grab it tonight → [link]" |

If purchase occurs at any point, customer drops out of Flow 6 and into Flows 2/4/5.

**KPI**: scan-to-purchase conversion 4–8% (per `gap_journey §1 stage 3`), with the one-field landing page (phone number only) lifting from v5's four-field crater.

---

## Flow 7: Win-back at Day 90 + Day 180

Customers who have not purchased again by Day 90 enter Flow 7. Two emails, no SMS (don't burn the SMS opt-in on a churned segment).

| # | Day | Subject | Content |
|---|---|---|---|
| 1 | Day 90 | "we miss your inhale" | $5 credit + reminder of the 3pm sticker cue. "where's it living now?" — invites a reply, no purchase pressure. |
| 2 | Day 180 | "if/when [SKU 2 name] ships, you'll be among the first to know" | Soft re-engagement. Re-stitches the brand into her email memory. |

**KPI**: Day-90 win-back open rate ≥30%; resurrection rate (% who repurchase in next 30 days) ≥4%.

---

## Flow 8: Quiz funnel (list-build + segmentation)

Octane AI / Typeform → Klaviyo segmentation. Quiz: "what's your 1-second reset moment?" → 5 multiple-choice questions that segment by use-occasion (post-class lobby / between-meetings / pre-bedtime / commute / post-pump). Result page recommends the SKU (always the same single SKU at launch — quiz is a list-build engine, not a SKU-selector) and personalizes the welcome flow.

**Where it lives**: site homepage hero + Pinterest pins linking back + IG bio link. **KPI**: quiz completion rate ≥45%; email-capture rate ≥60% of completions.

The quiz funnel is the highest-conversion email-list-build mechanic for wellness brands in 2026 (per `gap_channels §5`). v5 had no list-build engine besides the 20% IRL popup.

---

## Flow 9: Review-request (separate from Amazon Request-a-Review)

Shopify-side automated email at Day 14 + photo-review reward.

**Subject**: "would you mind a quick review?"
**Content**: Plain ask. Photo-review (with the 3pm sticker visible in the photo) earns a $5 credit on next order; text-only review earns nothing extra (the photo is the asset).

**KPI**: review-request response rate ≥6%; photo-review rate ≥1.5%.

---

## Flow 10: Birthday / anniversary trigger

Small but consistent revenue lift. Captures birthday at email-collect (optional field). Fires:

**Email + SMS combined, 1 week before birthday**: "your bright minute, on us. code BIRTHDAY10 for 10% off → [link]"

**KPI**: birthday-segment redemption rate ≥8%.

---

## Flow architecture (summary)

| Flow | Channel | Trigger | Primary KPI |
|---|---|---|---|
| 1. Welcome series | Email (5x) | First-purchase | Open ≥35%, Day-3 reply ≥5% |
| 2. Post-purchase SMS | SMS (6x, depletion-anchored) | First-purchase + opt-in | Day-45 click ≥18% |
| 3. Referral | Email + SMS + IRL card | Multi-point activation | ≥15% activation by Day 90 |
| 4. S&S attach | Email + SMS | Second-purchase + 21d | ≥12% attach |
| 5. VIP segment | Email + postcard | 2+ orders in 90d | ≥40% repeat within 60d |
| 6. IRL post-trial | SMS (3x) | QR scan, no purchase | Scan-to-purchase 4–8% |
| 7. Win-back | Email (2x) | No purchase by Day 90 | Resurrection ≥4% |
| 8. Quiz funnel | Site + Pinterest + IG | Visitor quiz completion | Email-capture ≥60% of completions |
| 9. Review-request | Email | 14d post-delivery | Response ≥6% |
| 10. Birthday | Email + SMS | Customer birthday | Redemption ≥8% |

---

## What v6 deliberately does NOT include in retention

These were on the gap-channels longlist but defer past 90 days:

- **Hotel amenity / mini-bar partnerships** — Y2 channel, on roadmap with month-12 gating trigger.
- **Corporate gifting / B2B sales** — Y2; cheap to launch as a one-pager landing page in month 6, no Q1 work.
- **Spa / clinic / acupuncturist wholesale** — month 6+ once the 1 retail door scout (per `21_speed_to_100_v2.md` Day 75–90) lands.
- **Affiliate networks (ShareASale / Skimlinks / LTK)** — month 4+ as a prerequisite for PR conversion.
- **Livestream commerce (TikTok Shop Live, IG Live)** — month 6+; founder-hosted "scent test" lives are a Y2 format.
- **WhatsApp / Geneva / private-group channels** — month 4+ once the founder LinkedIn series has 1k+ followers.

---

## One thing this week

**Set up Klaviyo (free tier) and Postscript ($25/mo Starter), then ship Welcome Email #1 + Post-purchase SMS #1 as live flows by end of week 2.** The unboxing kit can ship without these, but the 100 customers who will buy in the first 90 days will all leak retention if Flow 1 and Flow 2 aren't live by their first-purchase moment. Klaviyo + Postscript setup is a 4–6 hour evening for a non-technical founder; the templates above are copy-paste ready.

---

## 5-line summary

- **Filename**: `/home/diabasis/codeman-cases/burglary/cases/thai-inhaler/04_details/25_lifecycle_retention.md`
- **The 10 flows**: Welcome (Email 5x) / Post-purchase SMS (6x, depletion-anchored Day 45) / Referral (give-$5/get-$5, multi-point) / S&S Attach (Day-21-after-second-purchase, NOT Day-21-after-first) / VIP segment / IRL post-trial SMS (3x) / Win-back (Day 90 + Day 180) / Quiz funnel / Review-request / Birthday.
- **The load-bearing change**: SMS cadence is depletion-anchored (Day 45 refill, Day 60 gift, Day 75 scarcity-only-if-behind), not time-anchored (v5's Day 3 / 10 / 21).
- **The referral mechanic**: give-$5 / get-$5, baked into Welcome Email #5, Welcome SMS #5, the "send to a friend" envelope, AND the IRL keychain QR. ≥15% activation target by Day 90.
- **One-thing-this-week**: Klaviyo (free tier) + Postscript ($25/mo) live by end of week 2, with Welcome Email #1 and Post-purchase SMS #1 firing on first-purchase event.
