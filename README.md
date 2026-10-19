# DNS-Troubleshooting-Enterprise-Lab
practical enterprise DNS troubleshooting workflow and command-line diagnostics lab.
# 🌐 Enterprise DNS Diagnostics & Troubleshooting Lab

## 📌 Project Overview
This repository documents practical DNS troubleshooting methodology, diagnostic workflows, and protocol analysis executed via Windows Command Prompt (CMD). The scenarios simulate real-world Enterprise Help Desk environments addressing local internal DNS failures, timeout errors, name resolution, and DNS resolver cache flushes.

---

## 🛠️ Lab Tasks & Diagnostic Scenarios

### Scenario 1: Initial Query Failure & Internal DNS Timeout Analysis
- **Objective:** Verify internet name resolution for `google.com`.
- **Symptom:** Primary internal DNS server (`192.168.1.10`) failed to respond, resulting in request timeout errors.
- **Root Cause:** Misconfigured or unreachable local gateway/proxy DNS resolver.

```cmd
C:\Users\kourosh>nslookup google.com
DNS request timed out.
    timeout was 2 seconds.
Server:  UnKnown
Address:  192.168.1.10

*** Request to UnKnown timed-out
Scenario 2: Direct Resolver Bypass (Forward DNS Lookup)
Objective: Bypass non-responsive internal DNS and query Public Google DNS (8.8.8.8) directly.

Resolution: Successfully retrieved authoritative IPv4 and IPv6 records for google.com.

DOS
C:\Users\kourosh>nslookup google.com 8.8.8.8
Server:  dns.google
Address:  8.8.8.8

Non-authoritative answer:
Name:    google.com
Addresses:  2001:4860:4802:32::78
          216.239.38.120
Scenario 3: Reverse DNS Lookup Verification (PTR Record)
Objective: Resolve hostnames from IP addresses to verify PTR record integrity.

Execution: Sent reverse query to 8.8.8.8.

DOS
C:\Users\kourosh>nslookup 8.8.8.8 8.8.8.8
Server:  dns.google
Address:  8.8.8.8

Name:    dns.google
Address:  8.8.8.8
Scenario 4: Local Resolver Cache Purge
Objective: Clear stale or corrupted entries from the local Windows DNS Client Cache.

Command Executed: ipconfig /flushdns

DOS
C:\Users\kourosh>ipconfig /flushdns

Windows IP Configuration

Successfully flushed the DNS Resolver Cache.
🎯 Key Takeaways & Help Desk Methodology
Isolating DNS Failure: When nslookup fails by default, explicitly specifying a public server (e.g., 8.8.8.8) determines whether the issue lies in local infrastructure or network connectivity.

PTR Mapping: Reverse lookups confirm valid host associations during network audits and log analyses.

Cache Invalidation: Flushing DNS resolver cache resolves stale host mapping conflicts after IP changes.

=================================================================

🌐 آزمایشگاه تخصصی عیب‌یابی و بررسی ساختار DNS در شبکه سازمانی
📌 نمای کلی پروژه
این ریپازیتوری مستندات روش‌شناسی عملی عیب‌یابی DNS، جریان‌های کاری تشخیصی و تحلیل پروتکل اجرا شده از طریق خط فرمان ویندوز (CMD) را ثبت می‌کند. این سناریوها محیط‌های واقعی هلپ‌دست سازمانی را برای رفع خطاهای قطعی DNS داخلی، خطاهای تایم‌اوت، ترجمه نام و پاک‌سازی کش سیستم شبیه‌سازی می‌کنند.

🛠️ مراحل آزمایش و سناریوهای عیب‌یابی
سناریو ۱: خطای اولیه و تحلیل تایم‌اوت در DNS داخلی
هدف (Objective): بررسی ترجمه نام سایت گوگل (google.com).

نشانه مشکل (Symptom): سرور دی‌ان‌اس اصلی داخلی (192.168.1.10) پاسخ نداد و خطای Request timed out صادر شد.

علت ریشه‌ای (Root Cause): عدم دسترسی، قطعی یا تنظیمات اشتباه در گیت‌وی/پروکسی دی‌ان‌اس محلی.

سناریو ۲: دور زدن DNS داخلی و تست مستقیم (Forward Lookup)
هدف (Objective): دور زدن دی‌ان‌اس داخلی ناپایدار و پرسش مستقیم از دی‌ان‌اس عمومی گوگل (8.8.8.8).

نتیجه (Resolution): آدرس‌های معتبر IPv4 و IPv6 دامنه گوگل با موفقیت دریافت شد و سلامت اتصال اینترنت اثبات گردید.

سناریو ۳: تست جستجوی معکوس و بررسی رکورد PTR
هدف (Objective): تبدیل آدرس آی‌پی به نام دامنه جهت بررسی سلامت رکوردهای PTR.

روش اجرا (Execution): ارسال کوئری معکوس به سرور 8.8.8.8 و دریافت نام رسمی dns.google.

سناریو ۴: پاک‌سازی حافظه موقت (کش) ویندوز
هدف (Objective): پاک کردن داده‌های قدیمی یا خراب‌شده از حافظه موقت DNS کلاینت ویندوز.

دستور اجرا شده (Command Executed): اجرای دستور ipconfig /flushdns و دریافت پیام تایید پاک‌سازی کامل کش.

🎯 نکات کلیدی و متدولوژی هلپ‌دست
۱. ایزوله‌سازی خطای DNS: وقتی nslookup به‌صورت پیش‌فرض خطا می‌دهد، با مشخص کردن یک سرور عمومی (مثل 8.8.8.8) مشخص می‌کنیم که آیا مشکل از تجهیزات و سرورهای محلی است یا اینترنت به‌طور کلی قطعی دارد.
۲. نگاشت معکوس (PTR): جستجوی معکوس هویت درست سرورها و سیستم‌ها را در ممیزی‌های شبکه و بررسی لاگ‌های امنیتی تایید می‌کند.
۳. باطل‌سازی کش (Cache Invalidation): پاک کردن کش دی‌ان‌اس، تداخل‌های ناشی از تغییر آی‌پی سرورها و باقی‌ماندن آدرس‌های قدیمی در سیستم کاربر را برطرف می‌سازد.
