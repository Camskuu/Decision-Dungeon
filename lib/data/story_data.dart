import '../models/story_choice.dart';
import '../models/story_node.dart';

final Map<String, StoryNode> storyData = {
  'start': const StoryNode(
    id: 'start',
    title: 'The Dungeon Gate',
    description:
        'You step beneath a cracked stone arch and into the dungeon proper. Cold air rushes past you, carrying the smell of dust, ash, and old metal. Three paths open ahead: a whispering hall lined with statues, a torchlit tunnel streaked with claw marks, and a broken bridge suspended over darkness.',
    sceneFrames: [
      'assets/images/scene/start/torch_1.png',
      'assets/images/scene/start/torch_2.png',
      'assets/images/scene/start/torch_3.png',
      'assets/images/scene/start/torch_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Enter the whispering hall',
        nextNodeId: 'whisperHall',
        resultText:
            'You follow the sound of distant voices into the statue-lined corridor.',
      ),
      StoryChoice(
        text: 'Take the torchlit tunnel',
        nextNodeId: 'ghoulPassage',
        resultText:
            'You move toward the orange glow, where the walls are marked by deep scratches.',
      ),
      StoryChoice(
        text: 'Cross toward the broken bridge',
        nextNodeId: 'collapsedBridge',
        resultText:
            'You head toward the edge of the chasm, where loose stones crumble underfoot.',
      ),
    ],
  ),

  'whisperHall': const StoryNode(
    id: 'whisperHall',
    title: 'The Whispering Hall',
    description:
        'Tall statues stand on both sides of the chamber, their faces worn smooth by time. A faint whisper curls through the air, as if the stone itself is speaking. Several of the statues still hold gemstones in their empty eye sockets.',
    sceneFrames: [
      'assets/images/scene/statue/statue_1.png',
      'assets/images/scene/statue/statue_2.png',
      'assets/images/scene/statue/statue_3.png',
      'assets/images/scene/statue/statue_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Inspect the statues carefully',
        nextNodeId: 'forgottenLibrary',
        resultText:
            'One statue turns on a hidden pivot, revealing a concealed passage to an old library.',
      ),
      StoryChoice(
        text: 'Rush through before the whispers grow louder',
        nextNodeId: 'trapGallery',
        healthChange: -1,
        resultText:
            'You push forward, but a hidden dart trap fires from the wall and grazes your shoulder.',
      ),
      StoryChoice(
        text: 'Pry a gemstone from one of the statues',
        nextNodeId: 'chestChamber',
        healthChange: -1,
        resultText:
            'The gem comes free, but the floor trembles and a secret panel slides open beneath you.',
      ),
    ],
  ),

  'ghoulPassage': const StoryNode(
    id: 'ghoulPassage',
    title: 'The Ghoul Passage',
    description:
        'A gaunt creature drags itself from the shadows ahead. Its rib cage is visible beneath pale skin, and its large scythe scrapes sparks along the stone floor. Behind it, the passage splits again into darkness.',
    sceneFrames: [
      'assets/images/scene/ghoul/skeleton_1.png',
      'assets/images/scene/ghoul/skeleton_2.png',
      'assets/images/scene/ghoul/skeleton_3.png',
      'assets/images/scene/ghoul/skeleton_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Fight the ghoul',
        nextNodeId: 'chestChamber',
        healthChange: -1,
        resultText:
            'You defeat the creature, but not before its scythe slashes your arm.',
      ),
      StoryChoice(
        text: 'Use your torch to drive it back',
        nextNodeId: 'altarOfAsh',
        resultText:
            'The ghoul recoils from the flame, giving you just enough room to slip past.',
      ),
      StoryChoice(
        text: 'Squeeze through a crack in the wall',
        nextNodeId: 'forgottenLibrary',
        resultText:
            'You find a narrow hidden route that leads away from the creature and into a quieter chamber.',
      ),
    ],
  ),

  'collapsedBridge': const StoryNode(
    id: 'collapsedBridge',
    title: 'The Collapsed Bridge',
    description:
        'A stone bridge stretches over a deep black chasm, but its center has crumbled away. On the far side, you can see the outline of an iron door. Beneath you, there is only darkness and the sound of distant dripping water.',
    sceneFrames: [
      'assets/images/scene/bridge/bridge_1.png',
      'assets/images/scene/bridge/bridge_2.png',
      'assets/images/scene/bridge/bridge_3.png',
      'assets/images/scene/bridge/bridge_4.png',
      'assets/images/scene/bridge/bridge_5.png',
      'assets/images/scene/bridge/bridge_6.png',
      'assets/images/scene/bridge/bridge_7.png',
      'assets/images/scene/bridge/bridge_8.png',
    ],
    choices: [
      StoryChoice(
        text: 'Cross the remaining stones carefully',
        nextNodeId: 'relicVault',
        resultText:
            'You test each step and manage to cross the ruin of the bridge without falling.',
      ),
      StoryChoice(
        text: 'Leap the broken section',
        nextNodeId: 'trapGallery',
        healthChange: -1,
        resultText:
            'You barely make the jump, slamming hard into the far ledge before dragging yourself up.',
      ),
      StoryChoice(
        text: 'Search the walls for another route',
        nextNodeId: 'forgottenLibrary',
        resultText:
            'You discover faded markings on the wall that point toward a hidden side passage.',
      ),
    ],
  ),

  'forgottenLibrary': const StoryNode(
      id: 'forgottenLibrary',
      title: 'The Forgotten Library',
      description:
          'Dusty shelves line the circular room from floor to ceiling. Most of the books have rotted away, but a few survive in locked cases. At the center stands a reading desk with a journal still open beneath a cracked lantern.',
      sceneFrames: [
        'assets/images/scene/library/book_1.png',
        'assets/images/scene/library/book_2.png',
        'assets/images/scene/library/book_3.png',
      ],
      choices: [
        StoryChoice(
          text: 'Read the journal on the desk',
          nextNodeId: 'altarOfAsh',
          resultText:
              'The journal speaks of a sacred altar and warns that the true danger is not the dungeon, but the relic at its heart.',
        ),
        StoryChoice(
          text: 'Search the cases for valuables',
          nextNodeId: 'chestChamber',
          resultText:
              'Behind the shelves you find a hidden crawlspace that leads to a treasure chamber.',
        ),
        StoryChoice(
          text: 'Force open the sealed door at the back',
          nextNodeId: 'relicVault',
          healthChange: -1,
          resultText:
              'The rusted seal gives way, but a jagged shard of metal cuts your hand as the door swings open.',
        ),
      ],
    ),

  'chestChamber': const StoryNode(
    id: 'chestChamber',
    title: 'The Chest Chamber',
    description:
        'A large iron-bound chest rests in the middle of the room beneath a cone of pale light. Coins are scattered across the floor, but none look recently disturbed. The silence here is so complete it feels deliberate.',
    sceneFrames: [
      'assets/images/scene/chest/chest_1.png',
      'assets/images/scene/chest/chest_2.png',
      'assets/images/scene/chest/chest_3.png',
      'assets/images/scene/chest/chest_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Inspect the chest for traps',
        nextNodeId: 'relicVault',
        resultText:
            'You notice a pressure mechanism beneath the latch and disable it before the trap can spring.',
      ),
      StoryChoice(
        text: 'Open the chest immediately',
        nextNodeId: 'cursedEnding',
        healthChange: -1,
        resultText:
            'The chest opens with a hiss. A wave of dark energy spills out and clings to you like smoke.',
      ),
      StoryChoice(
        text: 'Ignore the chest and follow a draft in the wall',
        nextNodeId: 'neutralEnding',
        resultText:
            'You leave the treasure untouched and follow the faint breeze toward what feels like an exit.',
      ),
    ],
  ),

  'trapGallery': const StoryNode(
    id: 'trapGallery',
    title: 'The Trap Gallery',
    description:
        'The walls here are carved with narrow slits, and the floor is divided into worn square tiles. Rusted blades hang overhead on chains, and several broken bones lie scattered along the edge of the room.',
    sceneFrames: [
      'assets/images/scene/trap/trap_1.png',
      'assets/images/scene/trap/trap_2.png',
      'assets/images/scene/trap/trap_3.png',
      'assets/images/scene/trap/trap_4.png',
      'assets/images/scene/trap/trap_5.png',
      'assets/images/scene/trap/trap_6.png',
    ],
    choices: [
      StoryChoice(
        text: 'Move slowly and watch the floor',
        nextNodeId: 'altarOfAsh',
        healthChange: -1,
        resultText:
            'You avoid the worst of the traps, though one swinging blade clips your side as you pass.',
      ),
      StoryChoice(
        text: 'Search for a hidden control lever',
        nextNodeId: 'relicVault',
        resultText:
            'Behind a loose stone, you find a lever that halts the traps and opens a stone door ahead.',
      ),
      StoryChoice(
        text: 'Sprint through as fast as possible',
        nextNodeId: 'gameOver',
        resultText:
            'You dash forward, but the gallery erupts in blades and darts before you can reach the exit.',
      ),
    ],
  ),

  'altarOfAsh': const StoryNode(
      id: 'altarOfAsh',
      title: 'The Altar of Ash',
      description:
          'A black stone altar rises from the center of the chamber, ringed by pale ash and blue fire that burns without heat. Resting on the altar is an iron key marked with the same symbol you saw carved near the entrance.',
      sceneFrames: [
        'assets/images/scene/altar_flame/flame_1.png',
        'assets/images/scene/altar_flame/flame_2.png',
        'assets/images/scene/altar_flame/flame_3.png',
      ],
      choices: [
        StoryChoice(
          text: 'Take the iron key',
          nextNodeId: 'relicVault',
          resultText:
              'The moment you lift the key, a hidden lock somewhere deeper in the dungeon clicks open.',
        ),
        StoryChoice(
          text: 'Touch the blue flame',
          nextNodeId: 'cursedEnding',
          healthChange: -1,
          resultText:
              'The fire surges up your arm like liquid shadow, leaving your skin cold and numb.',
        ),
        StoryChoice(
          text: 'Read the inscription carved into the altar',
          nextNodeId: 'escapeEnding',
          resultText:
              'As you speak the final words aloud, a hidden stairway opens in the wall, offering a safe way out.',
        ),
      ],
    ),

  'relicVault': const StoryNode(
      id: 'relicVault',
      title: 'The Relic Vault',
      description:
          'At last you enter the heart of the dungeon. On a pedestal of obsidian rests a single jeweled relic, pulsing with a dim inner glow. Around it, the floor is untouched, as though even the dead refused to step closer.',
      sceneFrames: [
        'assets/images/scene/relic_vault/altar_1.png',
        'assets/images/scene/relic_vault/altar_2.png',
        'assets/images/scene/relic_vault/altar_3.png',
        'assets/images/scene/relic_vault/altar_4.png',
      ],
      choices: [
        StoryChoice(
          text: 'Claim the relic as your prize',
          nextNodeId: 'cursedEnding',
          resultText:
              'The relic feels warm in your hands, but a whisper enters your mind the instant you touch it.',
        ),
        StoryChoice(
          text: 'Destroy the relic and flee',
          nextNodeId: 'escapeEnding',
          resultText:
              'You strike the relic against the pedestal. It shatters in a burst of light, and the dungeon begins to collapse behind you.',
        ),
        StoryChoice(
          text: 'Leave it untouched and walk away',
          nextNodeId: 'neutralEnding',
          resultText:
              'You decide some treasures are meant to remain buried and turn toward the path home.',
        ),
      ],
    ),

  'escapeEnding': const StoryNode(
    id: 'escapeEnding',
    title: 'Victory',
    description:
        'You escape the dungeon alive, having resisted its worst temptations and survived its deadliest trials. Whether by wisdom, courage, or sheer luck, you found the only ending that truly feels like a victory.',
    sceneFrames: [
      'assets/images/scene/victory/coin_1.png',
      'assets/images/scene/victory/coin_2.png',
      'assets/images/scene/victory/coin_3.png',
      'assets/images/scene/victory/coin_4.png',
    ],
    choices: [],
    isEnding: true,
  ),

  'cursedEnding': const StoryNode(
    id: 'cursedEnding',
    title: 'Cursed Ending',
    description:
        'You make it out of the dungeon, but you do not leave unchanged. Something ancient and hungry now travels with you, hidden just beneath your skin, waiting for the moment it can take hold.',
    sceneFrames: [
      'assets/images/scene/cursed/skull_1.png',
      'assets/images/scene/cursed/skull_2.png',
      'assets/images/scene/cursed/skull_3.png',
      'assets/images/scene/cursed/skull_4.png',
    ],
    choices: [],
    isEnding: true,
  ),

  'neutralEnding': const StoryNode(
    id: 'neutralEnding',
    title: 'Escape',
    description:
        'You leave the dungeon empty-handed, but with your life intact. No songs will be sung about your treasure, yet there is a quiet wisdom in knowing when to walk away.',
    sceneFrames: [
      'assets/images/scene/escape/flag_1.png',
      'assets/images/scene/escape/flag_2.png',
      'assets/images/scene/escape/flag_3.png',
      'assets/images/scene/escape/flag_4.png',
    ],
    choices: [],
    isEnding: true,
  ),

  'gameOver': const StoryNode(
    id: 'gameOver',
    title: 'Game Over',
    description:
        'Your strength fails in the darkness below. The dungeon closes around you, silent and patient, adding your story to the many it has already swallowed.',
    sceneFrames: [
      'assets/images/scene/game_over/skull_1.png',
      'assets/images/scene/game_over/skull_2.png',
      'assets/images/scene/game_over/skull_3.png',
      'assets/images/scene/game_over/skull_4.png',
    ],
    choices: [],
    isEnding: true,
  ),
};