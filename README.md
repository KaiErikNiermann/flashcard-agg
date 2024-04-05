# flashcard-agg

This repo allows for multiple people to work on an [anki](https://apps.ankiweb.net/) flashcard deck. 
- The folders are titled with the topic of the flashcard ( e.g. `test` )
- To get the aggregated deck of all flashcards [go to releases](https://github.com/KaiErikNiermann/flashcard-agg/releases/tag/cards) and simply find your deck, it should be called `u_test`  

## How do I get the flashcards ? 

1. You will want to download [anki](https://apps.ankiweb.net/) if you don't have it yet 
    
    - [windows](https://github.com/ankitects/anki/releases/download/24.04/anki-24.04-windows-qt6.exe)
    - [linux](https://github.com/ankitects/anki/releases/download/24.04/anki-24.04-linux-qt6.tar.zst)
    - [mac (intel)](https://github.com/ankitects/anki/releases/download/24.04/anki-24.04-mac-intel-qt6.dmg) \ [mac (apple sillicon)](https://github.com/ankitects/anki/releases/download/24.04/anki-24.04-mac-apple-qt6.dmg)

2. Simple go to the [releases](https://github.com/KaiErikNiermann/flashcard-agg/releases/tag/cards) and download whichever `.txt` deck you want, then import it in the anki app

## How do I contribute to this ? 

The nice thing here is that the `concat.sh` script does most of the work, you simply 

1. Clone the repo 

    ```bash
    git clone https://github.com/KaiErikNiermann/flashcard-agg.git
    ```

2. Export your flashcards **as a `.txt`** and move them into the right folder you want the combined deck with 

3. If you don't want to contribute your flashcard you can locally generate the combined file by doing 
    ```bash
    bash concat.sh
    ```

    This generates a folder `release` which contains the combined cards. 

### Script options 

| command                       | description                                                                                                                                                                  |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `bash concat true`            | This simply appends all flashcard decks.                                                                                                                                     |
| `bash concat false` (default) | What this does is that it only adds unique flashcards. Of note is that the script classifies unique as any difference on the front or back. It *does not* just use the front |

Otherwise you can simply push the changes which runs the script and adds the updated deck to [the release](https://github.com/KaiErikNiermann/flashcard-agg/releases/tag/cards)


