#!/usr/bin/env bash
# Record with ScreenToGif: dark terminal, 16pt+ font, 100x30 window
# Target: 20-25 seconds, loop-friendly

clear
sleep 1

# User prompt
echo -e "\033[1;32m❯\033[0m use ship fast mode. MVP: login form, dashboard, API endpoint"
sleep 2

# Activation
echo ""
echo -e "\033[1;36m🚀 SHIP FAST MODE ACTIVE\033[0m"
echo "   Scope locked: 3 features"
echo ""
echo "┌────────────────┬────────┐"
echo "│ Feature        │ Status │"
echo "├────────────────┼────────┤"
echo "│ Login form     │ ⏳     │"
echo "│ Dashboard      │ ⏳     │"
echo "│ API endpoint   │ ⏳     │"
echo "└────────────────┴────────┘"
sleep 2

# Scope creep attempt
echo ""
echo -e "\033[1;32m❯\033[0m Should we also add user registration and 2FA?"
sleep 2

# SCOPE BLOCKED — the money shot
echo ""
echo -e "\033[1;31m❌ SCOPE BLOCKED\033[0m"
echo ""
echo "   • User registration → Not in MVP. Backlog v0.2."
echo "   • 2FA              → Not in MVP. Backlog v0.2."
echo ""
echo -e "   \033[1;33mShip the 3 features first.\033[0m"
echo "   Add these after real users request them."
sleep 3

# Completion
echo ""
echo "┌────────────────┬────────┐"
echo "│ Login form     │ ✅     │"
echo "│ Dashboard      │ ✅     │"
echo "│ API endpoint   │ ✅     │"
echo "└────────────────┴────────┘"
sleep 1.5

# Ship checklist
echo ""
echo -e "\033[1;32m📋 Ship Checklist\033[0m"
echo "   ✅ Core feature works"
echo "   ✅ User can complete primary workflow"
echo "   ✅ No data loss scenarios"
echo "   ✅ Error messages clear"
echo -e "   \033[1;32m→ READY TO SHIP\033[0m"
sleep 2

# Tagline
echo ""
echo -e "\033[1;37m   Build what ships. Block everything else.\033[0m"
sleep 4
