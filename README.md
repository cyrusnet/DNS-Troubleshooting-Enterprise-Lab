# 🌐 Enterprise DNS Resolution Failure & Troubleshooting Scenario

## 📌 Scenario Background
A client in an enterprise environment reported an inability to access the internal intranet portal (`portal.local`). The host machine showed active network interface link state, but browser requests resulted in name resolution errors. This repository documents the systematic Help Desk diagnostic workflow used to isolate, verify, and resolve the issue.

---

## 🛠️ Step-by-Step Diagnostic Workflow

### Step 1: Internal DNS Resolution Failure
- **Objective:** Attempt default host resolution for the target domain (`portal.local`).
- **Observed Behavior:** The local DNS server failed to respond within the expected threshold, returning request timeout errors.
- **Initial Assessment:** Indicates potential service disruption on the primary domain controller or local DNS resolver.

### Step 2: Path & Connectivity Verification via Public Resolver
- **Objective:** Determine if the issue is restricted to internal DNS or affects external WAN connectivity.
- **Action:** Query a public DNS resolver directly for an external host.
- **Outcome:** The public query returned valid IP addresses, proving physical link integrity and network gateway operation.

### Step 3: Reverse Lookup & PTR Record Verification
- **Objective:** Validate reverse lookup zone mapping for infrastructure devices.
- **Action:** Execute a reverse query against the target IP address.
- **Outcome:** Successfully mapped the address to its hostname, confirming reverse zone configuration accuracy.

### Step 4: Resolver Cache Flush & Record Invalidation
- **Objective:** Eliminate stale or corrupted hostname entries stored in the Windows DNS client resolver cache.
- **Action:** Purged the local cache to force fresh DNS resolution requests across the network.
- **Result:** Local cache cleared successfully, restoring normal query behavior once internal DNS service recovered.

---

## 🎯 Key Methodological Takeaways
1. **Fault Isolation:** Distinguishing between internal local name resolution failures and general network interface issues by testing alternative resolvers.
2. **Reverse Zone Auditing:** Utilizing PTR records to confirm valid host-to-IP relationships during troubleshooting.
3. **Cache Management:** Invalidating local resolver cache as an essential first step when IP re-assignments occur.

=================================================================
=================================================================

# 🌐 سناریوی عیب‌یابی و رفع خطای عدم دسترسی به سامانه داخلی در شبکه سازمانی

## 📌 شرح سناریو
یکی از کاربران در شبکه سازمانی گزارش داد که امکان باز کردن پورتال داخلی شرکت را ندارد. کارت شبکه سیستم متصل بود، اما مرورگر خطای عدم ترجمه آدرس صادر می‌کرد. این مستند نشان‌دهنده جریان کاری گام‌به‌گام هلپ‌دست برای ایزوله‌سازی، تست و رفع مشکل است.

---

## 🛠️ مراحل گام‌به‌گام عیب‌یابی

### مرحله ۱: بررسی عدم پاسخ‌گویی DNS داخلی
- **هدف:** تست اولیه ترجمه آدرس سامانه داخلی.
- **مشاهده:** سرور دی‌ان‌اس اصلی شبکه داخلی در زمان مقرر پاسخ نداد و خطای تایم‌اوت صادر شد.
- **تحلیل اولیه:** احتمال قطعی سرویس دی‌ان‌اس روی دامین کنترلر یا عدم دسترسی به دی‌ان‌اس محلی.

### مرحله ۲: بررسی اتصال شبکه و دور زدن دی‌ان‌اس داخلی
- **هدف:** تشخیص اینکه آیا مشکل فقط محدود به دی‌ان‌اس داخلی است یا کل اینترنت/شبکه قطعه.
- **اقدام:** استعلام مستقیم یک دامنه خارجی از یک دی‌ان‌اس سرور عمومی.
- **نتیجه:** دریافت موفقیت‌آمیز آی‌پی ثابت کرد که کابل شبکه، سوئیچ و گیت‌وی سالم هستند و فقط دی‌ان‌اس داخلی مشکل دارد.

### مرحله ۳: تست جستجوی معکوس و صحت رکورد PTR
- **هدف:** ارزیابی صحت نگاشت آی‌پی به نام در زون معکوس شبکه.
- **اقدام:** ارسال کوئری معکوس برای آی‌پی هدف.
- **نتیجه:** نام سرور با موفقیت بازیابی شد که نشان‌دهنده سلامت رکوردهای PTR در شبکه است.

### مرحله ۴: پاک‌سازی کش سیستم کلاینت
- **هدف:** حذف داده‌های قدیمی یا خراب‌شده از حافظه موقت دی‌ان‌اس ویندوز.
- **اقدام:** پاک‌سازی کامل کش کلاینت برای اجبار سیستم به دریافت آدرس‌های جدید.
- **نتیجه:** کش سیستم با موفقیت خالی شد و با رفع مشکل سرور داخلی، دسترسی کاربر کاملاً برقرار گردید.

---

## 🎯 نکات کلیدی روش‌شناسی هلپ‌دست
۱. **ایزوله‌سازی خطا:** تفکیک خطای دی‌ان‌اس داخلی از قطعی کلی شبکه با تست دی‌ان‌اس‌های عمومی.
۲. **ممیزی زون معکوس:** استفاده از رکوردهای PTR برای اطمینان از صحت ارتباط آی‌پی و نام سرورها.
۳. **مدیریت کش:** باطل کردن کش محلی کلاینت به عنوان اولین قدم ضروری در صورت تغییر آی‌پی سرورها.
