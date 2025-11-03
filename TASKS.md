# TASKS & MILESTONES

## M0 — Repo bootstrap (done)
- [x] Node-RED flow skeleton with scheduler + pre-charge FSM + sequential top-off
- [x] LOGO! FBD executor spec
- [x] Modbus map YAML
- [x] Docs: architecture, wiring, commissioning, Victron setup
- [x] GitHub templates

## M1 — Environment & IO bring-up (est. 1–2 days)
- [ ] Enable MQTT and Node-RED on Cerbo; confirm local broker up
- [ ] Install `node-red-contrib-modbus`
- [ ] Configure LOGO! IP/UnitID; confirm Modbus reads/writes to merkers
- [ ] Wire pre-charge relays and main contactors through drivers

## M2 — Telemetry integration (est. 1 day)
- [ ] Point MQTT nodes to real pack SOC/V/I topics (from BMS/SmartShunts)
- [ ] Add bus voltage input (VE.Bus voltage topic or Victron node)
- [ ] Validate debounced streams; add `rbe` nodes where needed

## M3 — FSM polish & safety (est. 1–2 days)
- [ ] Tune `prechargeMsMin/Max` and `dvThresh` (ΔV gate) per hardware
- [ ] Add MAIN_FB aux-contact confirmation path
- [ ] Add BMS alarm inputs; auto-open on any pack fault
- [ ] Implement lockout on repeated pre-charge failure

## M4 — Sequential top-off (est. 1 day)
- [ ] Detect near‑CVL; connect exactly one pack; finish at tail current
- [ ] Advance to next pack; log times and tail thresholds
- [ ] Manual override buttons in Dashboard

## M5 — Round-robin discharge (est. 1 day)
- [ ] Keep per‑pack current within C‑comfort; equalize Ah delivered
- [ ] Hysteresis to avoid chatter during load ramps

## M6 — Virtual battery & DVCC validation (est. 0.5 day)
- [ ] Install `dbus-aggregate-batteries` or `dbus-mqtt-battery`
- [ ] Confirm Cerbo “Battery monitor” = virtual battery; DVCC on
- [ ] Observe Quattros tracking limits correctly

## M7 — Docs & handover (est. 0.5 day)
- [ ] Update wiring photos and exact MQTT topics
- [ ] Export Node‑RED flow with deployed config
- [ ] Final README links & Dashboard screenshots
