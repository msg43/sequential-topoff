# LOGO! FBD Executor

Implements per-pack sequence: `OPEN → PRECHARGE (Tmin..Tmax & ΔV OK) → MAIN_CLOSED → OPEN`.

Inputs (Modbus → Merkers):
- PRECHARGE_i, MAIN_i

Outputs:
- Pre-charge relay coil i
- Main contactor coil i
- MAIN_FB_i (aux contact → DI → Modbus Discrete Input)

Interlocks:
- BMS_ENABLE_i hardwired in series with coil supply
- COIL_24V_OK optional DI
- If MAIN_FB_i mismatches request → force OPEN and flag

Timers:
- T_PC_MIN (e.g., 0.8 s)
- T_PC_MAX (e.g., 3.0 s)

ΔV check can be performed on Cerbo (recommended) and passed as permission.
