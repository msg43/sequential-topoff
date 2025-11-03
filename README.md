# Automated Sequential Top-Off for Six 48V Packs
**Platform:** Victron Cerbo GX (Venus OS Large) + Node-RED + Siemens LOGO! (optional) + Orion BMS (per pack)

This repository is a production-ready starter kit to **prevent SOC drift** across multiple 48V LiFePO₄ packs being charged/discharged by a **pair of Victron Quattros**. It uses:
- a **Virtual Battery** that DVCC sees as *one* bank,
- **sequential top-off** near CVL to let each pack's BMS balance cleanly, and
- optional **round-robin discharge** to equalize delivered Ah across packs.

It is designed to be:
- **Low-code** (Node-RED flow + LOGO! executor), and
- **Hardware-safe** (BMS “Enable” hardwired in series with contactor coils, pre-charge enforced).

> If you don't want a PLC, swap LOGO! for a Modbus-TCP relay block; the flow is the same.

---

## Quick Start
1. **Hardware**
   - Six packs → common DC bus with **equal-length/gauge** leads and **Class‑T fuses** per pack.
   - Per pack: **pre-charge resistor + relay**, **main contactor**, **Orion BMS**.
   - Hardwire Orion **Charge/Discharge Enable (or Charger Safety)** in series with coil supply (hard veto).
   - 24 V DIN PSU for coils; flyback diodes on every coil.
2. **Cerbo GX**
   - Run **Venus OS Large** and enable **Node‑RED** + **MQTT** (local broker).
   - Enable **DVCC** and set the **battery monitor** to your virtual/aggregate battery.
3. **Virtual battery**
   - Use *either* **dbus-aggregate-batteries** *or* **dbus-mqtt-battery** (or Node‑RED Virtual Battery) so DVCC sees **one** battery.
4. **Node‑RED**
   - Import `node-red/flow.json`.
   - Edit the `global_config` function node (MQTT base, VE.Bus paths, CVL, ΔV threshold, timers).
   - Update `config/modbus_map.yaml` to your LOGO! Modbus addresses/IP.
   - Deploy; test pre-charge → main sequence per pack.
5. **LOGO! (optional, recommended)**
   - Implement the simple FBD in `plc/README_LOGO.md` (pre-charge timing + interlocks + feedback).

See **docs/** for wiring, architecture, Victron settings, and commissioning steps. Use **TASKS.md** for a ready-made work plan for a contractor.

---

## Repository Layout
- `node-red/flow.json` — importable flow (scheduler, pre-charge FSM, sequential top-off, placeholders for telemetry topics)
- `config/modbus_map.yaml` — Modbus mapping to LOGO! coils/inputs/registers
- `plc/README_LOGO.md` — how to build the LOGO! FBD executor
- `safety/checklist.md` — commissioning & fault drills
- `docs/architecture.md` — conceptual → detailed system design
- `docs/victron_setup.md` — Cerbo/DVCC/MQTT/virtual battery setup
- `docs/wiring.md` — DC bus, pre-charge, contactors, fuses
- `docs/commissioning.md` — step-by-step bring-up procedure
- `TASKS.md` — issue breakdown & milestone plan for a hired dev
- `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `LICENSE` (MIT), `.github/*` templates

---

## Publish Instructions (one-liners)
### Using GitHub CLI
```bash
gh repo create sequential-topoff --private --source . --remote origin --push
```
### Or classic git
```bash
git init
git add .
git commit -m "Initial commit: sequential top-off for 6x48V packs"
git branch -M main
git remote add origin git@github.com:YOUR_USERNAME/sequential-topoff.git
git push -u origin main
```

---

## License
MIT — do what you want; attribution appreciated.
