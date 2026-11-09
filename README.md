# AuraISP
ISP Management Software


<img width="2160" height="2700" alt="01-platform" src="https://github.com/user-attachments/assets/437a8d52-f06d-4ec9-98a7-a1dac7293d85" />
<img width="2160" height="2700" alt="02-billing" src="https://github.com/user-attachments/assets/fe704900-02a9-4eec-be68-8ab66664eae6" />
<img width="2160" height="2700" alt="04-apps" src="https://github.com/user-attachments/assets/afb37ed5-cba0-4a7f-93ba-fcd5a0a921de" />
<img width="2160" height="2700" alt="03-network" src="https://github.com/user-attachments/assets/5f342ebe-b3c8-4763-90bd-a77fea86e53d" />

#How to Download
First, download the .zip file and extract it. Then follow the instructions below.

# AuraISP — ISP Billing, Network Control & CRM Platform

AuraISP is a complete, self-hosted platform for internet service providers. It covers customer self-service, billing and
online payments, bandwidth and IP management on MikroTik routers, strict usage enforcement, parental controls, support with
live chat, remote diagnostics, multi-channel notifications, CRM, PDF reports and backups. It ships as one codebase for:

| Deliverable | Folder | Who uses it |
|---|---|---|
| **API server** (Node.js + Express 5; MySQL/MariaDB, PostgreSQL or SQLite) | `server/` | — |
| **Browser installer** | `server/installer/` | Install on any server from the browser |
| **Web app**: public website, customer portal, admin/staff console (React + Vite, Aura theme) | `web/` | Everyone |
| **Desktop app** (Electron; Windows, macOS, Linux) | `desktop/` | Admins & staff only |
| **Mobile app** (Capacitor; Android & iOS) | `mobile/` | Customers only |
| **Docs** | `docs/` | Operators & developers |

## Install on your server (browser)
1. Upload **AuraISP_Installer.zip** to your server and extract it.
2. Start `server/app.cjs` (cPanel "Setup Node.js App", PM2, or `node app.cjs`).
3. Open **https://your-domain/install/**.

The wizard asks you to choose **MySQL/MariaDB, PostgreSQL or SQLite** and recommends the best one for your server.
Step by step: [docs/INSTALL.md](docs/INSTALL.md) · Which database? [docs/DATABASES.md](docs/DATABASES.md)

## Develop locally
```bash
cd web && npm install && npm run build
```
```bash
cd server && npm install && npm start
```
The first start opens the installer at http://localhost:4000/install/ (the token is printed in the console).
`npm run seed:demo` adds demo data (never on production). For frontend hot reload, run `npm run dev` in `web/`.

## Feature map

| Area | Highlights |
|---|---|
| Accounts | Admin, role-based staff (permission matrix + per-role dashboards), customers, profile pictures |
| Security | Argon2id passwords, TOTP 2FA + backup codes, email/SMS verification, refresh-token rotation with theft detection, lockout, cluster-wide rate limits, CSP/HSTS, audit log, AES-256-GCM secrets at rest, least-privilege TLS database connections |
| Billing | Recurring invoices, proration, tax, discounts, **View / Print / PDF beside every bill**, cash/bank collection, **admin-defined subscription stop rules with manual override**, auto-restore on payment |
| Payments | bKash Tokenized Checkout, SSLCommerz, Stripe Checkout — all verified server-to-server, amount-checked, idempotent |
| Network | Per-customer speed limits (hard cap, no burst), **speed watchdog and monthly data-cap enforcement**, live bandwidth, traffic analytics, site rules, parental controls — MikroTik RouterOS v7 driver + simulator |
| ISP core | IP management (Real / Dedicated / Shared CGNAT pools), core capacity with auto-detection, router discovery & import, TLS certificate pinning |
| Support & CRM | Tickets, consent-based remote support, device tests, FAQ chatbot **with hand-off to a human agent (live chat inbox, convert to lead/ticket)**, lead pipeline, campaigns, sales analytics |
| Notifications | Email, SMS, WhatsApp, Web Push, FCM, in-app realtime; templates, reminder rules, broadcasts |
| Operations | **Field jobs** (installation/repair work orders, technician "My jobs", board + schedule, checklists, directions), **Inventory** (routers/ONUs/cable stock, serials, issue/return to customers and technicians, low-stock), **Zones & areas**, **Network map** (customers & POPs on OpenStreetMap) |
| Finance & compliance | **Expenses & profit/loss** (categories, receipts, P&L by month/zone, CSV), **KYC documents** (NID/photo/agreement, private storage, verification queue), **Session & IP log** for BTRC ("who had IP X at time T", CSV) |
| Communication | Email designs (Modern, Bold, Minimal, Promo, Dark) with live preview; broadcasts and campaigns to customers, staff, **CRM leads or any email address**; invoice and receipt **PDFs attached** to billing emails |
| Reports & backups | Branded PDF reports (customer, accounts, sales, overall); database, UI + database or full-system backups with encryption and restore |
| Scale | Built-in multi-core load balancer, multi-server support (database-coordinated sessions, rate limits, realtime and a leader-elected scheduler), Nginx and Docker load-balancer configs |
| Platform | Modules on/off, white-label branding, light/dark Aura theme, website editor, signed self-updates with rollback |

## Documentation
* [Install from the browser](docs/INSTALL.md)
* [Choosing a database](docs/DATABASES.md): MySQL/MariaDB vs PostgreSQL vs SQLite, with hardening
* [Load balancing](docs/LOAD_BALANCING.md): multi-core and multi-server, with benchmarks
* [Live chat, enforcement, billing rules, bills, apps](docs/FEATURES_V2.md)
* [User guide](docs/USER_GUIDE.md): how to use each module
* [Hosting & deployment](docs/DEPLOYMENT.md) · [Configuration](docs/CONFIGURATION.md)
* [ISP core](docs/ISP_CORE.md) · [Backups & PDF reports](docs/BACKUP_REPORTS.md) · [Updates](docs/UPDATES.md)
* [Security](docs/SECURITY.md) · [Developer guide](docs/DEVELOPER.md) · [Desktop & mobile apps](docs/DESKTOP_MOBILE.md)

## Tests
```bash
cd server && npm run test:all
```
That runs 108 tests on MySQL/MariaDB, PostgreSQL and SQLite.
Also available: `test/smoke.mjs` (end-to-end), `test/load.mjs` (load test) and `test/cluster.mjs` (multi-worker checks).

## Credits
Developed by **S.K.M. AL RAFI**, Software Engineer | Cybersecurity Analyst | IT Consultant.
Phone / WhatsApp: +880 1717-151255 · Email: alrafitonoy@gmail.com

## License
Proprietary — © your company. Replace with your chosen license before publishing.
