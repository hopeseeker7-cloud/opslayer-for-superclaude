# Korean Dev Preset

**Purpose**: Korean language development environment optimization for Claude Code with SuperClaude.

**Part of**: OpsLayer for SuperClaude (independent add-on)

## When to Use

- Developing products targeting Korean users
- Working with Korean public APIs (data.go.kr)
- Planning launches to Korean developer communities
- Writing Korean documentation or copy

## Response Language Rule

When this preset is active:
- Code comments: English (international standard)
- Variable/function names: English
- Documentation: Korean
- Commit messages: Korean or English (follow existing repo convention)
- User-facing copy: Korean
- Error messages for end users: Korean

## Korean Public API Quick Reference

Frequently used Korean public data APIs:

| Category | API | Portal |
|----------|-----|--------|
| Real estate | Real transaction prices | data.go.kr |
| Business | Company registry | data.go.kr |
| Legal | Law search (법제처) | law.go.kr/openApi |
| Weather | Korea Meteorological | data.go.kr |
| Transit | Real-time bus/subway | data.go.kr |
| Demographics | Census data | kosis.kr |
| Finance | Stock market | data.krx.co.kr |
| Patents | KIPRIS search | kipris.or.kr |

Common patterns:
- Most Korean public APIs return XML by default — always request `type=json` parameter
- API keys are free but require registration at each portal
- Rate limits are typically 1,000 calls/day for free tier
- Error responses are often in Korean — handle encoding (UTF-8)

## Korean Community Launch Channels

For product launches targeting Korean developers:

| Channel | Audience | Tone | Best For |
|---------|----------|------|----------|
| **GeekNews** (news.hada.io) | Korean tech professionals | Analytical, technical | Developer tools, open source |
| **Velog** (velog.io) | Korean developers | Tutorial-style | How-to posts, project showcases |
| **Disquiet** (disquiet.io) | Korean makers/founders | Product-focused | MVPs, product launches |
| **Korean Reddit** (r/hanguk) | General Korean | Casual | Consumer products |
| **Naver Cafe** (various) | Niche communities | Community-specific | Domain-specific products |

## Korean SEO Checklist

- [ ] Title tag: under 30 characters (Korean displays wider)
- [ ] Meta description: under 80 characters
- [ ] Naver Search Advisor registration
- [ ] Sitemap submitted to Naver and Google
- [ ] Korean language `<html lang="ko">`
- [ ] Open Graph tags with Korean text
- [ ] Naver blog/cafe backlinks (Korean SEO weight)

## Korean Business Context

- Korean sole proprietor (간이사업자): overseas income under 80M KRW/year
- Payment integration: PortOne (구 아임포트) for Korean cards, Toss Payments
- App distribution: Google Play + ONE Store (Korean app store)
- Communication: KakaoTalk is default, not email/Slack

## Encoding & Formatting

- Always use UTF-8
- Korean date format: YYYY년 MM월 DD일 or YYYY-MM-DD
- Korean currency: ₩ (원) or KRW
- Phone format: 010-XXXX-XXXX
- Address: Korean postal code (5 digits) + 도로명 주소
