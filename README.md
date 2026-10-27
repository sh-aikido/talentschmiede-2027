# HORSCH Talentschmiede Lauf 2 // Boarding Pass

Interaktive Web-App & 3D-gedrucktes Artefakt zur Bewerbung von Samuel Haas (Industriekaufmann, 2. LJ) für die HORSCH Talentschmiede Lauf 2 (2026/2027).

**Live URL:** [https://sh-aikido.github.io/talentschmiede-2027/](https://sh-aikido.github.io/talentschmiede-2027/)

---

### Konzept & Artefakt
- **Physischer Boarding Pass:** 3D-gedruckte Ticket-Karte (110 × 54 × 3 mm) mit Aussparung (25 × 25 mm) für den QR-Code, Abriss-Nut bei X = 78 mm und Notches. Der gedruckte QR zeigt fest auf die Live-URL oben, die URL darf sich deshalb nie ändern.
- **Gate-Durchsage:** Eine Ansagerin ruft Passagier Haas am Gate auf und reicht in dritter Person weiter, was er ausrichten lässt (`audio_durchsage.mp3`, Edge-Neural-Stimme mit Flughafen-Gong, ~35 Sek.).
- **Seite:** Gate-Anzeige mit Fallblatt-Ziffern, Player, Mitschrift und Abriss-Coupon. „Boarding bestätigen“ setzt einen BOARDED-Stempel und schickt eine Push-Meldung über ntfy.sh (Header nur ASCII, sonst blockt der Browser die Anfrage).
- **Design:** Entwurf B aus der Runde vom 27.10.2026 (Codex), Handy zuerst, ab 760 px quer wie die gedruckte Karte.

---

### 3D-Druck Dateien
- **`boarding_pass_talentschmiede.stl`**: Fertig geslicter, wasserdichter 3D-Körper (110 × 54 × 3 mm). Direkt importierbar in Bambu Studio, PrusaSlicer, Cura etc.
- **`qr_inlay_plate.stl`**: Passgenaue Inlay-Kachel (24.8 × 24.8 × 0.6 mm) für den QR-Code.
- **`boarding_pass.scad`**: Parametrisches CAD-Mastermodell (OpenSCAD).
- **Empfohlene Druckeinstellungen:** Schichthöhe 0.12–0.16 mm, Matte Black PLA/PETG, Infill 30% Gyroid. Bei Z = 3.0 mm optional Farbwechsel auf Weiß/Rot für erhabene Beschriftung.
