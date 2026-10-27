# HORSCH Talentschmiede Lauf 2 // Boarding Pass

Interaktive Web-App & 3D-gedrucktes Artefakt zur Bewerbung von Samuel Haas (Industriekaufmann, 2. LJ) für die HORSCH Talentschmiede Lauf 2 (2026/2027).

**Live URL:** [https://sh-aikido.github.io/talentschmiede-2027/](https://sh-aikido.github.io/talentschmiede-2027/)

---

### Konzept & Artefakt
- **Physischer Boarding Pass:** 3D-gedruckte Ticket-Karte (110 × 54 × 3 mm) mit Aussparung (25 × 25 mm) für den QR-Code, Abriss-Nut bei X = 78 mm und Notches.
- **In-Flight Boardfunk:** Authentischer Tower-Funk („Flight TS-02“), gesprochen von der offiziellen HORSCH-Unternehmensstimme (ElevenLabs, ~21 Sek.).
- **Cockpit-Player:** CRT-Avionik-Interface mit VHF COMM 121.50 MHz, dynamischem Frequenz-Spektrum-Visualizer, Audio-Chimes und Teletype-Transkript.
- **Design:** Dark Aviation Aesthetic inspiriert von PULSE (Dark Ink Tokens, taktile Buttons, voll responsives Layout für Desktop & Smartphone).

---

### 3D-Druck Dateien
- **`boarding_pass_talentschmiede.stl`**: Fertig geslicter, wasserdichter 3D-Körper (110 × 54 × 3 mm). Direkt importierbar in Bambu Studio, PrusaSlicer, Cura etc.
- **`qr_inlay_plate.stl`**: Passgenaue Inlay-Kachel (24.8 × 24.8 × 0.6 mm) für den QR-Code.
- **`boarding_pass.scad`**: Parametrisches CAD-Mastermodell (OpenSCAD).
- **Empfohlene Druckeinstellungen:** Schichthöhe 0.12–0.16 mm, Matte Black PLA/PETG, Infill 30% Gyroid. Bei Z = 3.0 mm optional Farbwechsel auf Weiß/Rot für erhabene Beschriftung.
