# Architecture

## Overview
- **Virtual Battery** presented to Cerbo/DVCC so Quattros see one bank.
- **Pack Switching** via LOGO! (or Modbus relay) to:
  - Pre-charge → Main Close → Hold
  - Sequential top-off near CVL
  - Round-robin discharge to equalize Ah

## Data Paths
- Pack telemetry (SOC/V/I/alarms) → MQTT/D-Bus → Node-RED
- Node-RED → Modbus-TCP → LOGO! coils (precharge/main)
- LOGO! → Modbus-TCP → Node-RED feedback (MAIN_FB_i)

## Control
- **Near-CVL:** connect exactly one pack, finish to tail current.
- **Bulk:** multiple packs can be connected; DVCC caps current.
- **Safety:** Orion BMS enable line in series; BMS can drop coil supply unilaterally.
