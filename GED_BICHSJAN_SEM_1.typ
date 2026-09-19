// ============================================================
//  GED – Grundlagen der Elektro- und Digitaltechnik
//  Zusammenfassung Vorlesung 1: Kraft, Ladung, Energie
// ============================================================

// ---------- Farben ----------
#let akzent = rgb("#0064a6")
#let merke-farbe = rgb("#e69500")
#let warn-farbe = rgb("#c0392b")

// ---------- Seite & Text ----------
#set document(title: "GED – Vorlesung 1")
#set page(
  paper: "a4",
  margin: (x: 1cm, top: 1cm, bottom: 1.2cm),
  columns: 2,
  footer: context [
    #set text(size: 6pt, fill: gray)
    GED HS26 · Vorlesung 1 · Kraft, Ladung, Energie
    #h(1fr)
    #counter(page).display("1 / 1", both: true)
  ],
)
#set columns(gutter: 12pt)
#set text(font: "Libertinus Serif", size: 8pt, lang: "de")
#set par(justify: true, leading: 0.4em, spacing: 0.55em)
#set list(spacing: 0.4em, indent: 2pt)
#set enum(spacing: 0.4em, indent: 2pt)
#show math.equation.where(block: true): set block(spacing: 0.4em)

// ---------- Überschriften ----------
#show heading.where(level: 1): it => block(
  width: 100%,
  fill: akzent,
  inset: (x: 4pt, y: 2.5pt),
  radius: 2pt,
  above: 8pt,
  below: 4pt,
  text(fill: white, weight: "bold", size: 9pt, it.body),
)
#show heading.where(level: 2): it => block(
  above: 6pt,
  below: 3pt,
  text(fill: akzent, weight: "bold", size: 8pt, it.body),
)

// ---------- Hilfsfunktionen ----------
// Orange Box: wichtige Regel
#let merke(body) = block(
  width: 100%,
  fill: merke-farbe.lighten(85%),
  stroke: (left: 2pt + merke-farbe),
  inset: 4pt,
  body,
)

// Rote Box: typische Falle
#let achtung(body) = block(
  width: 100%,
  fill: warn-farbe.lighten(88%),
  stroke: (left: 2pt + warn-farbe),
  inset: 4pt,
  [*Achtung:* #body],
)

// Kleine graue Legende unter Formeln
#let legende(body) = text(size: 7pt, fill: luma(80), body)

// Kompakte Tabelle
#let tab(..args) = table(
  inset: 3pt,
  stroke: 0.3pt + gray,
  align: center + horizon,
  fill: (_, y) => if y == 0 { akzent.lighten(80%) },
  ..args,
)

// ---------- Titel ----------
#place(top + center, scope: "parent", float: true)[
  #block(width: 100%, inset: (bottom: 4pt), stroke: (bottom: 1pt + akzent))[
    #text(size: 13pt, weight: "bold", fill: akzent)[GED – Vorlesung 1: Kraft, Ladung, Energie]
    #h(1fr)
    #text(size: 7pt, fill: gray)[Grundlagen der Elektro- und Digitaltechnik · HS 2026]
  ]
]

// ============================================================
//  KRAFT & BEWEGUNG
// ============================================================

= Kraft (2. Newtonsches Gesetz)

Eine Kraft verändert die Geschwindigkeit eines Objekts: + ⇒ Wird beschleunigt, - ⇒ wird gebremst, oder die Richtung ändert sich. 

$ arrow(F) = m arrow(a) quad arrow.r.double quad F = m a, quad a = F / m, quad m = F / a $

#legende[$F$: Kraft [N] #h(6pt) $m$: Masse [kg] #h(6pt) $a$: Beschleunigung [m/s²]]
$ ["N"] = ["kg" dot "m" / "s"^2] $

= Konstante Beschleunigung

#merke[Konstante Kraft ⇒ konstante Beschleunigung. *Nur dann* gelten die folgenden Formeln.]

$ v(t) = v_0 + a (t - t_0) #h(2em) "(linear)" $
$ s(t) = s_0 + v_0 (t - t_0) + a / 2 (t - t_0)^2 #h(1em) "(quadratisch)" $

#legende[$t_0$: Startzeit (Abmachung: $t_0 = 0$) #h(6pt) $s_0 = s(t_0)$ #h(6pt) $v_0 = v(t_0)$]

*Spezialfall* $a = 0$: #h(4pt) $v(t) = v_0$, #h(4pt) $s(t) = v_0 t$

== Start aus der Ruhe ($v_0 = s_0 = t_0 = 0$)
Zeile = Grösse, die *nicht gegeben* ist. Spalte = *gesuchte* Grösse.

#tab(
  columns: (auto, 1fr, 1fr, 1fr, 1fr),
  table.header([fehlt], [$t$], [$s$], [$v$], [$a$]),
  [$t$], [–], [$s = v^2 / (2a)$], [$v = sqrt(2 a s)$], [$a = v^2 / (2s)$],
  [$s$], [$t = v / a$], [–], [$v = a t$], [$a = v / t$],
  [$v$], [$t = sqrt((2s) / a)$], [$s = (a t^2) / 2$], [–], [$a = (2s) / t^2$],
  [$a$], [$t = (2s) / v$], [$s = (v t) / 2$], [$v = (2s) / t$], [–],
)

== Abbremsen auf Stillstand
Die Tabelle gilt symmetrisch, wenn man von $v_0$ auf $0$ bremst:
$ s_"Brems" = v_0^2 / (2 |a|) #h(2em) s_"Brems" prop v_0^2 $
Doppelte Geschwindigkeit ⇒ vierfacher Bremsweg.

== Einheiten
Immer in SI rechnen: #h(4pt) $x "km/h" = x / 3.6 "m/s"$ #h(8pt) (z.B. $90 "km/h" = 25 "m/s"$)

= Schwerkraft & Wurf

Nahe der Erdoberfläche (< 20 km) erfährt jeder Körper unabhängig von seiner Masse dieselbe Beschleunigung (ohne Luftwiderstand):
$ arrow(a) = vec(0, 0, -g), #h(2em) g = 9.81 "m/s"^2 $

$ arrow(v)(t) = vec(v_(x,0), v_(y,0), v_(z,0) - g t) #h(1.5em)
  arrow(s)(t) = vec(s_(x,0) + v_(x,0) t, s_(y,0) + v_(y,0) t, s_(z,0) + v_(z,0) t - g t^2 / 2) $

#merke[Horizontale und vertikale Bewegung sind *unabhängig*. Horizontal: konstante Geschwindigkeit. Vertikal: konstant beschleunigt.]

== Freier Fall aus Höhe $h$
$ v = sqrt(2 g h) $

== Schiefer Wurf (Winkel $phi$, gleiche Abwurf- und Aufprallhöhe)
$ v_(0,x) = v_0 cos phi #h(2em) v_(0,z) = v_0 sin phi $
$ t_"max" = v_(0,z) / g #h(1.5em) h_"max" = v_(0,z)^2 / (2g) #h(1.5em) R = 2 v_(0,x) t_"max" $
Am höchsten Punkt ist $v_z = 0$, $v_x$ bleibt erhalten. Aufstieg und Abstieg dauern gleich lang.

// ============================================================
//  KRÄFTE
// ============================================================

= Federkraft

$ F_s = -k (x - L) #h(2em) |F_s| = k |x - L| $

#legende[$k$: Federkonstante [N/m = kg/s²] #h(6pt) $L$: Ruhelänge [m] #h(6pt) $x$: aktuelle Länge [m] #h(6pt) $x - L$: Auslenkung]

Die Federkraft ist *proportional* zur Auslenkung und ihr *entgegengerichtet*. Vektoriell: $arrow(F)_s = -k(|arrow(x)| - L) arrow(x) / (|arrow(x)|)$

#achtung[Die Kraft hängt von der Auslenkung ab ⇒ die Beschleunigung ist *nicht konstant* ⇒ die Bewegungsformeln oben gelten nicht. Stattdessen die Energieerhaltung verwenden.]

= Gravitationskraft

$ |F_12| = gamma (m_1 m_2) / r_12^2 #h(2em) gamma = 6.67 dot 10^(-11) ("N m"^2) / "kg"^2 $

Massen ziehen sich *immer* an. $F prop m_1 m_2$ und $F prop 1 \/ r^2$.

= Elektrische Ladung

Elektrische Ladungen sind die Ursache aller elektrischen Phänomene. Es gibt *positive* und *negative* Ladung: Gleiche stossen sich ab, ungleiche ziehen sich an. Die Gesamtladung bleibt in allen Prozessen *exakt erhalten*.

$ ["C"] = ["A s"] #h(2em) e = 1.602 dot 10^(-19) "C" $
Elektron: $-e$ #h(8pt) Proton: $+e$ #h(8pt) $N$ Elektronen: $Q = -N e$

== Ladungsaustausch
Wechseln $N$ Elektronen von A nach B:
$ Delta Q_A = +N e #h(1.5em) Delta Q_B = -N e #h(1.5em) Delta Q_"ges" = 0 $
A wird positiver, B negativer. Die Summe bleibt gleich.

= Coulombkraft

$ |F_12| = 1 / (4 pi epsilon_0) (|q_1 q_2|) / r_12^2 = k_e (|q_1 q_2|) / r_12^2 $

#legende[$epsilon_0 = 8.854 dot 10^(-12) "C"^2 \/ ("J m")$ (Folie: 8.859) #h(6pt) $k_e = 1 \/ (4 pi epsilon_0) approx 8.99 dot 10^9 "N m"^2 \/ "C"^2$]

Vektoriell: $arrow(F)_12 = -1 / (4 pi epsilon_0) (q_1 q_2) / (|arrow(r)_12|^2) arrow(n)_12$, #h(3pt) $arrow(n)_12$: Einheitsvektor von $q_2$ zu $q_1$. Gleiche Struktur wie die Gravitation.

#merke[*Mehrere Ladungen:* Resultierende Kraft = Vektorsumme aller Einzelkräfte (Superposition). In 1D: Skizze zeichnen, Beträge einzeln berechnen, Richtung aus der Skizze ablesen, mit Vorzeichen addieren.]

== $1\/r^2$-Abhängigkeit (Gravitation und Coulomb)
$ F(2r) = F(r) / 4 #h(2em) F(3r) = F(r) / 9 #h(2em) F dot r^2 = "konst." $

#achtung[„Nimmt ab, wenn $r$ zunimmt“ heisst noch nicht $F prop 1\/r$. Bei $1\/r$ wäre $F dot r$ konstant.]

// ============================================================
//  ENERGIE
// ============================================================

= Energie

Energie ist wie eine Währung: Sie kann von einer Form in eine andere umgewandelt werden, die Gesamtmenge bleibt gleich.
$ ["J"] = ["N m"] = ["kg" dot "m"^2 / "s"^2] = ["W s"] = ["V C"] $

#tab(
  columns: (auto, auto, 1fr),
  align: (left + horizon, center + horizon, left + horizon),
  table.header([*Form*], [*Formel*], [*Grössen*]),
  [Lageenergie], [$E_"pot" = m g h$], [$m$ [kg], $g = 9.81 "m/s"^2$, $h$ [m]],
  [Kinetische E.], [$E_"kin" = (m v^2) / 2$], [$m$ [kg], $v$ [m/s]],
  [Federenergie], [$E_s = k (x - L)^2 / 2$], [$k$ [N/m], $L$, $x$ [m]],
  [Elektr. pot. E.], [$E_"pot,el" = q U$], [$q$ [C], $U$ [V]],
  [Wärme], [$E_"therm"$], [z.B. durch Reibung, Bremsen],
)

#achtung[$E_"pot"$ ist eigentlich eine *Differenz*: $E_"pot" = m g (h_2 - h_1)$. Das Nullniveau $h = 0$ ist frei wählbar.]

= Mechanische Arbeit

Arbeit ist *mechanisch übertragene* Energie, keine gespeicherte Energieform. Sie zeigt sich als Änderung von $E_"kin"$ oder $E_"pot"$.
$ W = F dot s #h(2em) (arrow(F) parallel arrow(s)) #h(2em) W = Delta E $

Wirkt die Kraft in Bewegungsrichtung, ist $W > 0$ (Energie wird zugeführt). Wirkt sie entgegen, ist $W < 0$ (Energie wird entzogen).

*Bsp:* Block 5 m gegen eine Reibung von 20 N ziehen: $W = 20 "N" dot 5 "m" = 100 "J"$

= Spannung

Spannung ist *Energie pro Ladung*. Ladungen „fallen“ eine Spannung hinunter wie Wasser eine Höhendifferenz und geben dabei Energie ab.
$ U = E / q #h(2em) E_"pot,el" = q U #h(2em) ["V"] = ["J" / "C"] $
$ 1 "eV" = 1.602 dot 10^(-19) "J" $
#legende[1 eV: Energie, die eine Elementarladung beim Durchlaufen von 1 V aufnimmt.]

= Energieerhaltung

#merke[*Energieerhaltungssatz:* Bei physikalischen Prozessen bleibt die Gesamtenergie von System und Umgebung *immer* erhalten. Die *Systemgrenze* ist wichtig, denn Energie kann ins System hinein oder hinaus fliessen.]

== Vorgehen
+ System, Anfangs- und Endzustand festlegen (Skizze).
+ Pro Zustand alle Energieformen aufschreiben, z.B. als Tabelle.
+ $E_"Anfang" = E_"Ende"$ setzen und nach der Unbekannten auflösen.

== Standard-Umwandlungen
#tab(
  columns: (auto, 1fr, 1fr),
  table.header([*Umwandlung*], [*Ansatz*], [*Ergebnis*]),
  [Lage → Bewegung], [$m g h = (m v^2) / 2$], [$v = sqrt(2 g h)$],
  [Feder → Bewegung], [$k (x - L)^2 / 2 = (m v^2) / 2$], [$v = |x - L| sqrt(k / m)$],
  [Spannung → Bew.], [$q U = (m v^2) / 2$], [$v = sqrt((2 q U) / m)$],
  [Bewegung → Wärme], [$F s = (m v^2) / 2$], [$s = (m v^2) / (2 F)$],
)

== Feder-Schwinger (reibungsfrei)
Die Geschwindigkeit ist *maximal bei $x = L$*: Dort sind Kraft und Beschleunigung null, und die ganze Federenergie ist zu kinetischer Energie geworden. Die Masse schwingt symmetrisch zwischen $L - |x - L|$ und $L + |x - L|$.

*Bsp:* $k = 100 "N/m"$, $m = 0.1 "kg"$, Auslenkung $0.1 "m"$ \
#h(1em) ⇒ #h(3pt) $v_"max" = 0.1 dot sqrt(1000) approx 3.16 "m/s"$ \
*Bsp:* Blumentopf fällt 7 m #h(3pt) ⇒ #h(3pt) $v = sqrt(2 dot 9.81 dot 7) approx 11.7 "m/s"$

// ============================================================
//  NACHSCHLAGEN
// ============================================================

= Konstanten & Vorsätze

#grid(
  columns: (1fr, 1fr),
  column-gutter: 6pt,
  tab(
    columns: (auto, 1fr),
    table.header([*Konstante*], [*Wert*]),
    [$g$], [$9.81 "m/s"^2$],
    [$gamma$], [$6.67 dot 10^(-11) "N m"^2 \/ "kg"^2$],
    [$e$], [$1.602 dot 10^(-19) "C"$],
    [$epsilon_0$], [$8.854 dot 10^(-12) "C"^2 \/ ("J m")$],
    [$k_e$], [$8.99 dot 10^9 "N m"^2 \/ "C"^2$],
    [$m_e$], [$9.109 dot 10^(-31) "kg"$],
    [$m_p$], [$1.673 dot 10^(-27) "kg"$],
  ),
  tab(
    columns: (auto, auto, auto, auto),
    table.header([*Vors.*], [*Wert*], [*Vors.*], [*Wert*]),
    [G], [$10^9$], [m], [$10^(-3)$],
    [M], [$10^6$], [µ], [$10^(-6)$],
    [k], [$10^3$], [n], [$10^(-9)$],
    [c], [$10^(-2)$], [p], [$10^(-12)$],
    [], [], [f], [$10^(-15)$],
  ),
)
