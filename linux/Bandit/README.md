# OverTheWire: Bandit (Level 0→20)

A complete writeup of the OverTheWire Bandit wargame, documenting solutions, explanations, and reflections for levels 0 through 20. Each level is written in my own words, capturing not just the solution but the thinking and research behind it.

---

## What is Bandit?

Bandit is a wargame hosted by [OverTheWire](https://overthewire.org/wargames/bandit/) designed for beginners to learn Linux fundamentals, networking, and security concepts through hands-on challenges. Each level presents a problem to solve using the terminal.

---

## Levels

| Level | Topic |
|-------|-------|
| [Level 0](./Level%200.md) | SSH Login |
| [Level 0→1](./Level%200→1.md) | Special Character Filenames |
| [Level 1→2](./Level%201→2.md) | Filenames with Spaces |
| [Level 2→3](./Level%202→3.md) | Hidden Files |
| [Level 3→4](./Level%203→4.md) | File Types |
| [Level 4→5](./Level%204→5.md) | File Types |
| [Level 5→6](./Level%205→6.md) | Searching by File Properties |
| [Level 6→7](./Level%206→7.md) | Searching by File Properties pt.2 |
| [Level 7→8](./Level%207→8.md) | Searching using Grep |
| [Level 8→9](./Level%208→9.md) | Counting Lines |
| [Level 9→10](./Level%209→10.md) | Human Readable Strings |
| [Level 10→11](./Level%2010→11.md) | Base64 Decoding |
| [Level 11→12](./Level%2011→12.md) | ROT13 |
| [Level 12→13](./Level%2012→13.md) | Hexdump and Decompression |
| [Level 13→14](./Level%2013→14.md) | SSH Using a Key |
| [Level 14→15](./Level%2014→15.md) | Netcat and TCP |
| [Level 15→16](./Level%2015→16.md) | SSL/TLS |
| [Level 16→17](./Level%2016→17.md) | Port Scanning and SSL |
| [Level 17→18](./Level%2017→18.md) | Diff Command |
| [Level 18→19](./Level%2018→19.md) | Combining SSH and Commands |
| [Level 19→20](./Level%2019→20.md) | Setuid |

---

## Overall Thoughts

Looking back at level 0, it felt like a whole new world. So many commands, so much researching, so much unknown. But somewhere along the way something shifted, the research got faster, the documentation got easier, the commands started feeling familiar. What started as survival became efficiency.

The hardest moment was without a doubt the file compressed eight times. I had no idea what was going on and even the documentation was difficult to parse. What kept me going was a simple thought, if I'm struggling, I must be learning. So I carried on. That mindset carried me through more than just that level.

The biggest surprise wasn't a command or a concept, it was discovering that I could write. Documentation always seemed tedious to me, I've always preferred doing over writing. But I found that writing forces a kind of deep thinking that doing alone doesn't. It connects dots, cements understanding, and leaves something behind worth reading. I'll be doing it more often.

This is the first step up a mountain. The goal is to build fundamentals, increase the challenge gradually, and keep growing until the big projects don't feel big anymore. Bandit was the foundation.

And if I could go back and tell myself one thing before level 0?

**Everything is in `man`. Read it properly.**
