import '../models/story_choice.dart';
import '../models/story_node.dart';

final Map<String, StoryNode> storyData = {
  'start': const StoryNode(
    id: 'start',
    title: 'Room 1',
    description:
        'You step into the dungeon entrance. Cold air rushes past you as torchlight flickers across the stone walls. Three paths lie ahead.',
    sceneFrames: [
      'assets/images/scene/start/torch_1.png',
      'assets/images/scene/start/torch_2.png',
      'assets/images/scene/start/torch_3.png',
      'assets/images/scene/start/torch_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Take the left passage',
        nextNodeId: 'ghoul',
        resultText: 'You move cautiously into the darkness.',
      ),
      StoryChoice(
        text: 'Walk straight toward the torchlight',
        nextNodeId: 'chest',
        resultText: 'You follow the warm glow deeper into the dungeon.',
      ),
      StoryChoice(
        text: 'Inspect the carvings on the wall',
        nextNodeId: 'altar',
        resultText: 'The symbols reveal a hidden chamber nearby.',
      ),
    ],
  ),
  'ghoul': const StoryNode(
    id: 'ghoul',
    title: 'Room 2: The Ghoul',
    description:
        'A gaunt ghoul crawls from the shadows, hissing as it blocks your way. Its claws scrape against the stone floor.',
    sceneFrames: [
      'assets/images/scene/ghoul/skeleton_1.png',
      'assets/images/scene/ghoul/skeleton_2.png',
      'assets/images/scene/ghoul/skeleton_3.png',
      'assets/images/scene/ghoul/skeleton_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Fight the ghoul',
        nextNodeId: 'chest',
        healthChange: -1,
        resultText: 'You defeat the ghoul, but its claws leave a deep wound.',
      ),
      StoryChoice(
        text: 'Sneak around it',
        nextNodeId: 'altar',
        resultText: 'You press yourself against the wall and slip past unseen.',
      ),
      StoryChoice(
        text: 'Run back',
        nextNodeId: 'start',
        healthChange: -1,
        resultText: 'You escape, but stumble and injure yourself.',
      ),
    ],
  ),
  'chest': const StoryNode(
    id: 'chest',
    title: 'Room 3: The Treasure Chest',
    description:
        'You enter a dimly lit chamber. A large treasure chest sits in the center of the room. Somewhere nearby, you hear a faint clicking sound.',
    sceneFrames: [
      'assets/images/scene/chest/chest_1.png',
      'assets/images/scene/chest/chest_2.png',
      'assets/images/scene/chest/chest_3.png',
      'assets/images/scene/chest/chest_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Open the chest immediately',
        nextNodeId: 'cursedEnding',
        healthChange: -1,
        resultText: 'A hidden dart trap fires as the lid opens.',
      ),
      StoryChoice(
        text: 'Inspect the chest for traps',
        nextNodeId: 'escapeEnding',
        resultText: 'You discover and disable the trap, then claim the treasure safely.',
      ),
      StoryChoice(
        text: 'Leave the chest alone',
        nextNodeId: 'neutralEnding',
        resultText: 'You decide that survival is worth more than gold.',
      ),
    ],
  ),
  'altar': const StoryNode(
    id: 'altar',
    title: 'Room 4: The Ancient Altar',
    description:
        'An ancient altar glows with a strange blue light. Resting on it is a small iron key surrounded by runes.',
    sceneFrames: [
      'assets/images/scene/altar/key_1.png',
      'assets/images/scene/altar/key_2.png',
      'assets/images/scene/altar/key_3.png',
      'assets/images/scene/altar/key_4.png',
    ],
    choices: [
      StoryChoice(
        text: 'Take the key',
        nextNodeId: 'escapeEnding',
        resultText: 'The runes fade. The key unlocks a hidden exit from the dungeon.',
      ),
      StoryChoice(
        text: 'Touch the altar',
        nextNodeId: 'cursedEnding',
        healthChange: -1,
        resultText: 'Dark energy surges through your body.',
      ),
      StoryChoice(
        text: 'Back away quietly',
        nextNodeId: 'neutralEnding',
        resultText: 'You avoid the altar and search for a safer route out.',
      ),
    ],
  ),
  'escapeEnding': const StoryNode(
    id: 'escapeEnding',
    title: 'Victory',
    description:
        'You survive the dungeon and escape with both your life and a valuable reward. Your choices led you to the best possible outcome.',
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
        'You make it out of the dungeon, but something dark follows you. Whatever power rested below now clings to your soul.',
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
        'You leave the dungeon empty-handed, but alive. Not every adventure ends in glory, but survival is its own reward.',
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
        'Your strength fails, and the dungeon claims another victim. The darkness closes in around you.',
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