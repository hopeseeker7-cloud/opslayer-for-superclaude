#!/usr/bin/env bash
# Record with ScreenToGif: dark terminal, 16pt+ font, 100x30 window
# Target: 20-25 seconds, loop-friendly

clear
sleep 1

# User prompt
echo -e "\033[1;32m❯\033[0m start new project: URL shortener with click tracking"
sleep 2

echo ""
echo -e "\033[1;36m📋 New Project Protocol — 9 Steps\033[0m"
sleep 1

# Steps 1-5 with bold headers (Gemini feedback: bold for mobile)
echo ""
echo -e "\033[1;33m1. IDENTITY\033[0m"
echo "   Web tool — short URLs + click tracking dashboard"
sleep 1

echo -e "\033[1;33m2. ROOT CASE: ShortenRequest\033[0m"
echo "   User submits URL → short URL + redirect working"
sleep 1

echo -e "\033[1;33m3. ONTOLOGY CHAIN\033[0m"
echo "   Evidence → Execution → Finding → Report → State"
sleep 0.8

echo -e "\033[1;33m4. ENTITIES\033[0m"
echo "   Link: url, short_code, click_count"
echo "   Click: link_id, timestamp, referrer"
sleep 1

echo -e "\033[1;33m5. HARD RULES\033[0m"
echo "   ❌ No redirect without valid link"
echo "   ❌ No click count without actual redirect"
sleep 1

# Steps 6-8 compressed
echo ""
echo -e "\033[1;33m6. BATCH:\033[0m [x] bootstrap"
echo -e "\033[1;33m7. ROLES:\033[0m Claude = executor"
echo -e "\033[1;33m8. GATES:\033[0m No external approval needed"
sleep 1.5

# Step 9 — GO
echo ""
echo -e "\033[1;32m9. ✅ GO — Protocol complete. Starting implementation.\033[0m"
sleep 2

# Tagline
echo ""
echo -e "\033[1;37m   9 steps. 2 minutes. Zero rework.\033[0m"
sleep 4
