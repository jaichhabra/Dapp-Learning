# Project context

A record of how this site was built and what is left to do, so work can continue in a new session.

## What this is

The OneSkill Capital website (oneskillcapital.com), part of the OneSkill group:

| Tab | Goes to | Notes |
|---|---|---|
| Education | oneskilledu.com | Courses, Certifications, Offline institutions, Become a training partner, Career counselling |
| Research | `/research/` | Reports, Reversal, Swing, Intraday, Multibaggers (baskets), India & USA ETFs, Buy/Sell/Hold |
| Screener & Tools | `/tools/` | Sectors, Patterns, Stock filters, Charts |
| Blog | `/blog/` | Finance news: India, US, Global |
| OneAce.ai | `/oneace/` | Financial AI chatbot preview, hands questions to oneace.ai |
| Invest | `/invest/` | Coming soon, with a waitlist form |
| Taxation | `/taxation/` | Callback form, no KYC |

## Decisions made

- **Stack:** Next.js 15 (App Router) as a static export, hosted on GitHub Pages. The site is meant to be linked from another website, so everything lives in this repo.
- **Research and KYC:** Buy/Sell/Hold calls are shown locked. The flow is choose a plan, pay, then KYC. Payment and KYC are placeholders, to be integrated later (`src/components/Subscribe.tsx`).
- **Data:** design and placeholders only for now. All research, market data and articles come from `src/data/samples.ts` and are labelled "Sample data" on screen.
- **Forms:** GitHub Pages cannot run server code, so the Taxation and Invest forms post to an endpoint set at build time (`TAX_FORM_ENDPOINT`, `WAITLIST_ENDPOINT` repository variables). A free Google Apps Script backend that writes to a Google Sheet and emails a notification is in `backend/google-apps-script/Code.gs`. Without an endpoint, the forms validate input and tell the visitor nothing was saved.

## Design

- **Brand:** colours were sampled pixel by pixel from screenshots of oneskilledu.com: navy hero card (`#182C63` to `#13204F`, glow `#23397C`), brand blue `#2874FC`, buttons `#3564DA`, hero button `#4276F2`, highlight `#6094F1`, page `#F7F9FB`. Full table in `src/app/globals.css`.
- **Type:** Plus Jakarta Sans for headings, Inter for text. These are the closest match to oneskilledu.com; swap them if the real brand fonts are known.
- **Home page idea:** OneSkill's logo line is "Beating Inflation", so the hero sentence is a calculator. Each number in it can be changed, and the result is also shown in today's money after inflation.
- **Design process:** direction came from the taste-skill ("The product performs"), ui-ux-pro-max (layout and type) and impeccable's quality rules, all installed in the Dapp-Learning repo under `.claude/skills/`.
- **Dark mode** is supported throughout.

## Current state

- `main` deploys to GitHub Pages through `.github/workflows/pages.yml` on every push. The first deploy succeeded.
- Live URL: https://jaichhabra.github.io/oneskill-capital/
- All 34 pages build, and every page was tested at desktop (1440 px) and phone (390 px) width with no errors or sideways scrolling.

## To do

1. **Regulatory details** in `src/config/site.ts` (`REG`): SEBI RA number, broker name, AP number, AMFI ARN, IRDAI licence, support email and phone. They show with a dashed underline until filled.
2. **Logo:** replace `Mark` in `src/components/Icons.tsx` with the OneSkill tree logo.
3. **Forms:** deploy the Apps Script backend and set the two repository variables.
4. **Plan prices:** `PLANS` in `src/data/samples.ts` shows "₹—".
5. **Real data:** replace the exports in `src/data/samples.ts` with the research and market-data feeds.
6. **Payment and KYC:** wire the gateway and KYC provider into `src/components/Subscribe.tsx`.
7. **Custom domain (optional):** set the `CUSTOM_DOMAIN` repository variable and point DNS at GitHub Pages.

## Related work

- **Design skills collection:** the Dapp-Learning repo, branch `claude/design-skills-github-ohz6dp`, holds a `claude-design-skills/` folder (10 skill repos linked as submodules, a README and an install script) and 32 design skills installed in `.claude/skills/`.
- **Single-page drafts:** an earlier one-page version of the Capital homepage was built and published as a Claude artifact before the Next.js site. This repo supersedes it.
