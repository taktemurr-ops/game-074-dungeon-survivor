import 'package:flutter/material.dart';

import '../app/arcade_stage.dart';
import '../app/game_api.dart';
import '../core/game_rules.dart';
import 'arena_engine.dart';
import 'arena_view.dart';
import 'rules.dart';

final gameConfig = GameConfig(
  gameId: 'game-074-dungeon-survivor',
  title: const ['Zindan Hayatta Kalanı', 'Dungeon Survivor', 'Verlies-Überlebender', 'Superviviente de Mazmorra', 'Survivant du Donjon'],
  tagline: const ['Kılıcını kuşan, zindanın derinliklerinden sağ çık!', 'Draw your sword and survive the depths!', 'Überlebe das Verlies!', '¡Sobrevive a la mazmorra!', 'Survivez au donjon !'],
  seedColor: const Color(0xFF6D597A),
  icon: Icons.castle,
  rules: DungeonRules(),
  buildPlay: (ctx) => ArcadeStage(
    ctx: ctx,
    create: () => ArenaSim((ctx.generated as GeneratedLevel<ArenaLevel>).puzzle),
    paint: paintArena,
    sound: arenaSound,
    boosterIcon: Icons.auto_fix_high,
    boosterLabel: (l) => l == 'tr' ? 'Büyü patlaması' : 'Spell burst',
    howTo: const ['Ekranın herhangi bir yerine basılı tutup parmağını kaydır: sanal joystick ile hareket et. Saldırı otomatik.', 'Hold anywhere and slide your finger: a virtual joystick moves you. Attacks are automatic.', 'Irgendwo halten und ziehen: virtueller Joystick. Angriffe automatisch.', 'Mantén pulsado y desliza: joystick virtual. Ataque automático.', 'Maintenez et glissez : joystick virtuel. Attaque automatique.'],
  ),
  tutorial: const [
    TutorialStep(Icons.open_with, ['Ekranın herhangi bir yerine basılı tutup parmağını kaydır: sanal joystick ile hareket et. Saldırı otomatik.', 'Hold anywhere and slide your finger: a virtual joystick moves you. Attacks are automatic.', 'Irgendwo halten und ziehen: virtueller Joystick. Angriffe automatisch.', 'Mantén pulsado y desliza: joystick virtual. Ataque automático.', 'Maintenez et glissez : joystick virtuel. Attaque automatique.']),
    TutorialStep(Icons.swap_horiz, ['Kırmızı çizgi hücum yönünü gösterir: kenara çekil.', 'A red line shows a charge: step aside.', 'Rote Linie: Ansturm, ausweichen.', 'Línea roja: embestida.', 'Ligne rouge : charge.']),
    TutorialStep(Icons.auto_fix_high, ['Büyü patlaması etraftaki düşmanları temizler.', 'Spell burst clears nearby enemies.', 'Zauber räumt die Umgebung.', 'El hechizo limpia alrededor.', 'Le sort nettoie autour.']),
  ],
);
