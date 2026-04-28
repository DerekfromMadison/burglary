# v3 Critique — Security / IP / Trade-Secret Lens

Reviewer viewpoint: outside security and IP consultant for indie CPG. Filing the v3 plan against the threat model an indie founder actually faces in 2026: Amazon hijackers, supplier-side leakage, cross-border contract failure, and a DTC stack that handles PII and card data on day one.

---

## 1. Top concern

**The "named Thai supplier as co-founder" disclosure is a free target package for competitors and counterfeiters.** §5 of `04_deliverable_v3.md` and the day-one launch list in `04_details/03_founder_bifurcation.md` require, before launch: named supplier with photo, producer-pricing disclosure, manufacturing transparency, founder origin essay. Those six elements plus a 2,500-word essay tell Apothékary's sourcing team — or any Alibaba broker — exactly which Thai factory to call, what the FOB price is, what margin to undercut, and which lot codes to spoof. The plan treats this as a marketing asset (credible-carrier playbook) but never costs the security side. Heritage moat and supplier moat are in direct tension; the plan only recognizes the first.

You cannot have "public producer-pricing disclosure" AND a defensible supplier moat. Pick one. v3 picks both, then does not protect either.

---

## 2. Specific findings

**a. No trademark filing in the Phase 0 or Phase 1 critical path.**
Where: `04_details/04_fda_compliance.md` lists "Trademark Class 003: $1.5k" as a year-1 compliance line, but `04_deliverable_v3.md` §1 and §4 fire the brand on Amazon and Shopify in week 1 with no filing prerequisite. Why it matters: USPTO is first-to-file in practice for indie CPG; a public Amazon listing at $14 with creator gifting publishes the mark to 30 micro-creators and the open Amazon catalog before any application exists. Trademark squatters monitor new ASINs in Class 3/5. Without a filed mark, you also cannot enroll in Amazon Brand Registry, Transparency, or Project Zero — which is the only working defense against listing hijacking (Amazon seized 15M counterfeit units in 2025; hijacking costs private-label sellers ~$2.3B/yr). Fix: file the 1(b) intent-to-use application BEFORE the Phase 0 listing goes live. $350 USPTO fee is rounding error vs. the $1.5k legal line. Brand Registry enrollment is a hard prerequisite for Phase 0, not a year-1 compliance item.

**b. Supplier-equity email leaks the wedge before any NDA exists.**
Where: §1 of v3 ("Email a candidate Thai supplier offering 15–25% cap-table equity"). Why: the email by definition discloses the brand concept, the bundle thesis, and the price ladder ($14/$24/$36) to a manufacturer who already supplies competitors (Hong Thai, Poy-Sian, white-label brokers). Thai law recognizes the 2002 Trade Secrets Act and NDAs are enforceable IF specific and reasonable, but Thai courts will not enforce a US judgment — you would have to refile in Thailand. With no NDA, no defined confidential information, no arbitration clause, the wedge is a free idea. Fix: the cold email must be content-neutral ("we are exploring an exclusive supply partnership with cap-table participation, please return signed mutual NDA before we share the deck"). Mutual NDA template in Thai + English, governed by SIAC or Thai Arbitration Institute (not Thai courts, not US courts), seat in Singapore, before any product or pricing detail moves.

**c. DTC Shopify stack and Amazon flow have zero security/PII line.**
Where: §4 ("Shopify"), §5 ("DTC PDP live"), `04_details/04_fda_compliance.md` (compliance budget). Why: as soon as Shopify is live with paid traffic, you are processing PII (email, shipping, possibly SMS opt-in) and card data. Shopify Payments inherits PCI DSS scope but the merchant still owns customer data, breach disclosure obligations under state law (CCPA/CPRA + 19 other state regimes by 2026), and adverse-event records under MoCRA (3yr / 6yr serious). The plan budgets $4k quarterly for affiliate scanning but $0 for privacy policy, terms of service, cookie consent, SMS TCPA compliance, or breach response. A single Klaviyo misconfiguration leaking 30 creator emails is a state-AG complaint waiting to happen. Fix: add $1.5–2.5k year-1 line for privacy/ToS templates (Termly or counsel-reviewed), TCPA-compliant SMS double opt-in, and a Klaviyo/Shopify access audit before week 6.

**d. Counterfeiting risk on Amazon is named once and never mitigated.**
Where: `06_risks_and_kill_switches.md` row 5 lists "Amazon-first concentration … Buy Box loss / suppression" but treats it as a marketing/operational risk, not an IP-security risk. Why: the Phase 0 protocol explicitly publishes a private-label Poy-Sian unit in custom over-sleeve at three price points. That listing teaches every Amazon-watching counterfeiter the price ceiling, the SKU bundle math, and the artwork. With no Brand Registry (see finding a), no Transparency codes, no test-buy program, the first hijacker can list the same Poy-Sian core at $9.99 within 30 days of your Vine rollout. Fix: Phase 0 listing must launch under Brand Registry with serialized Transparency stickers on the over-sleeve. Add $0.5k for Transparency enrollment and weekly Buy Box audit (Helium 10 alert, free tier). Add a "hijacker detected within 14 days" kill-switch alongside the existing Buy Box loss switch.

**e. Cap-table equity to a Thai entity without product-liability and IP-assignment carve-outs.**
Where: `03_founder_bifurcation.md` Row B — "15–25% cap-table to supplier-as-co-founder", $5k legal for cap-table structuring. Why: $5k buys the cap table but does not buy (i) IP assignment of formulation and trade dress to the US entity, (ii) product-liability indemnification flowing supplier→US-co (Hong Thai Lot 000332 is the precedent for why this matters — a contamination event with no indemnity is brand death), (iii) exclusivity teeth that survive supplier sale, (iv) a key-person clause if the named co-founder dies or exits. Fix: bump legal to $10–12k, split between cap-table structuring AND a supply agreement with IP assignment, exclusivity, indemnification, insurance requirement ($2M product-liability minimum named-additional-insured), and Singapore-seat arbitration. Product liability insurance for the US entity ($1.5–2.5k/yr for $1–2M aggregate) belongs in the Phase 0 compliance budget, not "year 1."

---

## 3. What's actually right

- **The verb-object rule and affiliate clawback (`04_details/04_fda_compliance.md`).** Auto-clawback in affiliate TOS plus quarterly AspireIQ/Modash scan is the correct security posture for the highest-probability brand-killer (FTC v. doTERRA pattern). This is the one place the plan treats compliance as a security control, not a checklist.
- **Phase 0 cheap-validation gate before custom inventory.** Smaller capital exposure means smaller IP exposure if the wedge fails — fewer custom molds, less artwork in the wild, less to claw back. The bias toward private-label-first is, accidentally, the right defensive posture.

---

## 4. Verdict

**Conditional NO-GO until five fixes land.** The strategy is sound; the security envelope is missing. Send no supplier email, list no Amazon SKU, and publish no founder essay until: (1) USPTO 1(b) filed and Brand Registry enrolled, (2) mutual NDA + Singapore-seat arbitration template ready before the cold email, (3) DTC privacy/ToS/TCPA stack present, (4) Transparency stickers on Phase 0 over-sleeve, (5) supply agreement budget raised to $10–12k with IP-assignment and indemnification clauses plus $2M product-liability policy named-additional-insured. Total incremental Phase 0 cost: ~$3–5k. Total incremental Year-1 cost: ~$8–10k. Cheap relative to one hijacker week or one contamination event with no indemnity.

The plan currently optimizes for narrative credibility and treats security as a year-1 hygiene item. For a bootstrap indie launching on Amazon in 2026, that ordering is backwards — security gates must close before the credibility moves.

---

Sources:
- [Amazon Listing Hijacking 2026](https://marketaspex.com/what-is-amazon-listing-hijacking-and-how-to-protect-your-listings-in-2026/)
- [Amazon 15M counterfeits 2025](https://www.business-standard.com/companies/news/amazon-targeted-32-000-bad-actors-seized-15-mn-counterfeits-in-2025-126042200540_1.html)
- [Amazon Brand Protection Strategies 2026](https://ecombrainly.com/amazon-brand-protection/)
- [NDAs in Thailand — Benoit & Partners](https://benoit-partners.com/non-disclosure-agreements-thailand/)
- [Cross-Border NDA Enforceability — Hanson Bridgett](https://www.hansonbridgett.com/Publications/articles/220520-3000-international-ndas)
- [Arbitration in Thailand — Reed Smith](https://www.reedsmith.com/articles/arbitration-in-thailand/)
- [Dispute Resolution in Thai Contracts — Tilleke & Gibbins](https://www.tilleke.com/insights/dispute-resolution-provisions-thailand-contracts/)
- [IP Protection for Wellness Brands — Stadler IP](https://www.stadleriplaw.com/blog/ip-protection-for-health-and-wellness-brands)
- [IP Ownership Pitfalls for Start-ups — Mondaq 2025](https://www.mondaq.com/unitedstates/trademark/1750594/ip-frontiers-who-really-owns-your-trademark-ownership-pitfalls-for-start-ups-and-closely-held-businesses)
