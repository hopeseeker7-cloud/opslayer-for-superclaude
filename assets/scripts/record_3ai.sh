#!/usr/bin/env bash
# Record with ScreenToGif: dark terminal, 16pt+ font, 100x30 window
# Target: 20-25 seconds, loop-friendly

clear
sleep 1

# User prompt
echo -e "\033[1;32m❯\033[0m use 3ai orchestration mode to evaluate this product idea"
sleep 2

# Role assignment
echo ""
echo -e "\033[1;36m🎯 3-AI Orchestration — Role Assignment\033[0m"
echo ""
echo "┌──────────┬──────────────┬─────────────────────┐"
echo "│ AI       │ Role         │ Focus               │"
echo "├──────────┼──────────────┼─────────────────────┤"
echo "│ Claude   │ Implementer  │ Build complexity     │"
echo "│ GPT      │ Auditor      │ Structure & risk     │"
echo "│ Gemini   │ UX Reviewer  │ Market & usability   │"
echo "└──────────┴──────────────┴─────────────────────┘"
sleep 3

# Fan-out
echo ""
echo -e "\033[1;33m⚡ Dispatching to 3 AIs in parallel...\033[0m"
sleep 1
echo "  → Claude: analyzing build complexity..."
sleep 0.5
echo "  → GPT (Codex CLI): auditing structure..."
sleep 0.5
echo "  → Gemini CLI: reviewing UX angle..."
sleep 2

# Convergence
echo ""
echo -e "\033[1;36m📊 Convergence Results\033[0m"
echo ""
echo "┌─────────┬─────────┬──────────────────────────────────┐"
echo "│ AI      │ Verdict │ Key Insight                      │"
echo "├─────────┼─────────┼──────────────────────────────────┤"
echo "│ Claude  │ ✅ GO   │ 2-3 day build, existing assets   │"
echo "│ GPT     │ ✅ GO   │ Low risk, high asset reuse       │"
echo "│ Gemini  │ ⚠️ WAIT │ Market validation needed         │"
echo "└─────────┴─────────┴──────────────────────────────────┘"
sleep 2

# Synthesis
echo ""
echo -e "\033[1;32m🧩 Synthesis: 2:1 consensus → GO\033[0m"
echo "   Risk item: Gemini's market validation note added to backlog"
sleep 3

# Tagline
echo ""
echo -e "\033[1;37m   3 AIs. 1 decision. Parallel.\033[0m"
sleep 4
