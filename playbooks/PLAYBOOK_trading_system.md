# Trading System Build Playbook

> From strategy idea to live trading — safety gates at every step.

Built from running dual-exchange automated trading systems (bithumb + bitget) with Claude Code + SuperClaude.

**Warning**: Trading involves real financial risk. This playbook helps structure your development process — it does not guarantee profits.

---

## Overview

5 phases with mandatory safety gates. No phase can be skipped.

```
STRATEGY DESIGN → BACKTEST → PAPER TRADING → LIVE DEPLOY → MONITORING
```

---

## Phase 1: STRATEGY DESIGN

### 1.1 Strategy Hypothesis

Define entry/exit rules as testable hypotheses before writing any code.

Template:
```
HYPOTHESIS: [market condition] → [action] → [expected outcome]
ENTRY: When [indicator] crosses [threshold], open [direction] position
EXIT: When [indicator] reaches [level] OR [time limit] OR [stop loss]
RISK: Max [X]% of portfolio per trade, max [Y]% daily drawdown
```

3-AI Review:
| AI | Focus |
|----|-------|
| Claude | Logic consistency, edge cases |
| GPT | Risk model, position sizing math |
| Gemini | Market context, regime awareness |

- **GATE**: Hypothesis documented before any code
- **PITFALL**: "Coding first, strategy later" — guaranteed losses
- **OUTPUT**: Strategy spec with entry/exit/risk rules

### 1.2 Risk Parameters

Non-negotiable risk parameters (hard-coded, not configurable at runtime):

| Parameter | Description | Example |
|-----------|-------------|---------|
| Max position size | Per-trade limit | 5% of portfolio |
| Max daily loss | Daily stop | -3% → halt all trading |
| Max drawdown | Absolute stop | -15% → kill switch |
| Budget controller | Per-exchange limits | $1000/day per exchange |

- **GATE**: Risk parameters defined and non-negotiable
- **PITFALL**: "I'll add risk management later" — always too late
- **OUTPUT**: Risk parameter document

---

## Phase 2: BACKTEST

### 2.1 Data Pipeline

Data quality checks:
- [ ] No gaps in time series
- [ ] Outliers identified and handled
- [ ] Survivorship bias accounted for
- [ ] Multiple time periods tested

- **PITFALL**: Overfitting to historical patterns
- **OUTPUT**: Clean dataset with validation report

### 2.2 Backtest Execution

Use walk-forward validation (not just in-sample):

```
[Train Period 1] → [Test 1] → [Train Period 2] → [Test 2] → ...
```

Realistic execution assumptions:
| Factor | Assumption |
|--------|-----------|
| Slippage | 0.1-0.3% per trade |
| Fees | Exchange fee schedule |
| Latency | 100-500ms execution delay |
| Fill rate | Partial fills on large orders |

- **GATE**: Sharpe ratio > 1.0 AND max drawdown < 20%
- **OUTPUT**: Backtest report with equity curve

---

## Phase 3: PAPER TRADING

### 3.1 Paper Trading Setup

Requirements:
- Live market data (real prices, real order book)
- Simulated execution (no real money)
- Match backtest parameters exactly
- Minimum duration: 2 weeks

- **GATE**: Paper results within 20% of backtest expectations
- **PITFALL**: "Paper trading is boring, let's go live" — expensive mistake
- **OUTPUT**: Paper trading log

### 3.2 Deviation Analysis

Compare paper vs backtest:

| Metric | Backtest | Paper | Deviation |
|--------|----------|-------|-----------|
| Win rate | | | |
| Avg profit | | | |
| Max drawdown | | | |
| Sharpe ratio | | | |

If deviation > 20%, investigate before proceeding.

- **GATE**: Deviation explained and acceptable
- **OUTPUT**: Gap analysis document

---

## Phase 4: LIVE DEPLOYMENT

### 4.1 Safety Infrastructure

Before any real money flows:

```
[ ] Kill switch — manual button that halts all trading
[ ] Auto kill switch — triggers on drawdown threshold
[ ] Budget limits — daily and weekly caps
[ ] Alert pipeline — Discord/Telegram/email on every trade
[ ] Heartbeat monitor — alert if system goes silent
[ ] Manual override — always available, always works
```

- **GATE**: All safety systems tested with fake triggers
- **PITFALL**: "The system will handle it" — always have manual override
- **OUTPUT**: Safety checklist signed off

### 4.2 Gradual Scale-Up

Never go from 0% to 100%:

| Week | Position Size | Condition to Advance |
|------|--------------|---------------------|
| Week 1 | 10% of target | No system errors |
| Week 2 | 25% of target | Performance within expectations |
| Week 3 | 50% of target | Stable operations |
| Week 4+ | 100% of target | All metrics green |

- **GATE**: Each scale-up requires review of previous period
- **OUTPUT**: Scale-up log with performance data

---

## Phase 5: MONITORING & EVOLUTION

### 5.1 Operational Monitoring

Dashboard essentials (key metrics only):
- Current positions and P&L
- Daily/weekly performance
- System health (uptime, latency, error count)
- Risk utilization (how close to limits)

Alert thresholds:
| Alert | Trigger | Action |
|-------|---------|--------|
| Warning | -1% daily | Review positions |
| Critical | -2% daily | Reduce exposure |
| Emergency | -3% daily | Kill switch |
| System | No heartbeat 5min | Investigate immediately |

### 5.2 Strategy Evolution

When to pause: drawdown exceeds threshold
When to modify: market regime change detected
When to retire: sustained underperformance over 4+ weeks

- **GATE**: No live strategy change without paper validation first
- Use 3-AI review for any strategy modification
- **OUTPUT**: Evolution decision log

---

## Real Example: OpenClaw Trading System

Dual-exchange system (bithumb + bitget):

| Component | Implementation |
|-----------|---------------|
| Strategy | Momentum + sentiment filter (Fear&Greed, funding rate) |
| Safety | BudgetController with daily limits, emotional state tracking |
| Evolution | strategy_experimenter.py with UTC-scheduled experiments |
| Guards | auto_rules_guard.py in execution pipeline |
| Service | passionate_trader_service.sh (both exchanges) |
| Monitoring | Discord alerts + dashboard |
