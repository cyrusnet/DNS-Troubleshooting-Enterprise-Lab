# 🌐 Enterprise DNS Diagnostics & Troubleshooting Lab

## 📌 Project Overview
This repository documents a practical, step-by-step DNS troubleshooting workflow executed via Command Prompt and PowerShell. The scenario covers identifying internal DNS failures, bypassing unresponsive local resolvers using public DNS, auditing reverse PTR records, and clearing local DNS cache.

---

## 🛠️ Diagnostic Steps & Commands

### Step 1: Check Default Internal DNS Resolution
- **Command:** `nslookup google.com`
- **Purpose:** Test if the local network's primary DNS server is responding.
- **Symptom:** Timeout error (Request timed out after 2 seconds).

### Step 2: Bypass Internal DNS & Test External Connectivity
- **Command:** `nslookup google.com 8.8.8.8`
- **Purpose:** Query Google Public DNS directly to bypass the failing local DNS and verify WAN/Internet access.
- **Result:** Successfully returned IPv4 and IPv6 addresses.

### Step 3: Reverse DNS Lookup Audit (PTR Record)
- **Command:** `nslookup 8.8.8.8 8.8.8.8`
- **Purpose:** Verify reverse DNS mapping from IP address to hostname (`dns.google`).

### Step 4: Purge Local Resolver Cache
- **Command:** `ipconfig /flushdns`
- **Purpose:** Clear outdated or corrupted DNS cache entries on the host machine.

---

=================================================================
 راهنمای فارسی سناریو 


# 🌐 آزمایشگاه عیب‌یابی کاربردی DNS در شبکه سازمانی

## 📌 شرح پروژه
این پروژه مراحل عملی عیب‌یابی مشکل DNS در شبکه را نشان می‌دهد. تمامی دستورات ساده، استاندارد و قابل اجرا در CMD و پاورشل هستند.

## 🛠️ مراحل عیب‌یابی و دستورات

۱. **تست دی‌ان‌اس داخلی:**
   - دستور: `nslookup google.com`
   - هدف: بررسی پاسخ‌گویی سرور دی‌ان‌اس محلی شبکه.

۲. **دور زدن (Bypass) دی‌ان‌اس داخلی:**
   - دستور: `nslookup google.com 8.8.8.8`
   - هدف: پرسش مستقیم از دی‌ان‌اس عمومی گوگل برای اطمینان از وصل بودن اینترنت و سلامت کارت شبکه.

۳. **تست رکورد معکوس (PTR):**
   - دستور: `nslookup 8.8.8.8 8.8.8.8`
   - هدف: تبدیل آی‌پی به نام برای بررسی صحت زون معکوس.

۴. **پاک‌سازی کش سیستم:**
   - دستور: `ipconfig /flushdns`
   - هدف: خالی کردن حافظه موقت دی‌ان‌اس ویندوز.
