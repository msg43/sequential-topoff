# Commissioning

1. **Voltage match** packs within 50–100 mV (rested) before first parallel.
2. **Dry-run** pre-charge per pack; tune `prechargeMsMin/Max` until ΔV < 0.3–0.5 V.
3. **Main close**; verify aux-contact feedback.
4. **Bulk charge** with 2–3 packs; approach CVL.
5. **Sequential top-off**: one pack at a time to tail current (2–3% C).
6. **Weekly sync** job: full sweep top-off, shallow discharge to ~90% SOC if desired.
7. **Fault drills**: BMS trip, network loss, pre-charge failure.
