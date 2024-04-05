# flashcard-agg

This repo allows for multiple people to work on an anki flashcard deck. 
- The folders are titled with the topic of the flashcard ( e.g. `test` )
- To get the aggregated deck of all flashcards [go to releases](https://github.com/KaiErikNiermann/flashcard-agg/releases/tag/cards) and simply find your deck, it should be called `u_test`  

## How do I use this ? 

The nice thing here is that the `concat.sh` script does most of the work, you simply 

1. Clone the repo 

```bash
git clone https://github.com/KaiErikNiermann/flashcard-agg.git
```

2. Add your flashcards to the appropraite folder 

3. If you don't want to contribute your flashcard you can locally generate the combined file by doing 
```bash
bash concat.sh
```

This generates a folder `release` which contains the combined cards 

Otherwise you can simply push the changes which runs the script and adds the updated deck to [the release](https://github.com/KaiErikNiermann/flashcard-agg/releases/tag/cards)


