# ========================================================
# Enterprise DNS Diagnostics Script
# Author: kourosh (cyrusnet)
# ========================================================

# Step 1: Test Default Internal DNS
Write-Host "--- Step 1: Testing Default DNS ---" -ForegroundColor Cyan
nslookup google.com

# Step 2: Bypass Internal DNS using Google Public DNS
Write-Host "`n--- Step 2: Bypassing Internal DNS (Querying 8.8.8.8) ---" -ForegroundColor Cyan
nslookup google.com 8.8.8.8

# Step 3: Reverse DNS Lookup (PTR Query)
Write-Host "`n--- Step 3: Testing Reverse DNS Lookup ---" -ForegroundColor Cyan
nslookup 8.8.8.8 8.8.8.8

# Step 4: Flush Local Windows DNS Cache
Write-Host "`n--- Step 4: Flushing Local DNS Cache ---" -ForegroundColor Cyan
ipconfig /flushdns
