# :crystal_ball: :bird: amsel-core

This is the core of **Amsel** (engl: common blackbird) a tool for generative composition producing monophonic phrases influenced by:
- feedback loops (f.e.: visual input)
- musical definitions

## Introduction

Every generative system needs a set of input vectors to produce it's output. Frequently those input vectors are:
- noise (random approach)
- huge datasets of MIDI or audio files (AI based approach)
- external sensor data (measurement approach)

The output of such systems can stand on it's own as works of art - but often times those processes feel like a "black box approach" creating
distance between the musicians intent and the algorithm. 

With **Amsel** I want to create a generative system working **with** me rather than **besides** me. I'm interesting in building a tool offering
new means of expression for artists- combining intent and reaction.

## Ideas

### .compose files

Implement a very simple "harmony programming language":
```
loop, cycles: 8
    A  major, bars: 4
    E  minor, bars: 2
    F  minor, bars: 2
    G# major, bars: 4
end
```

Those files could be parsed and serve as simple scripts for which note pools to fill/flush and when to switch. 
They also could provide a concrete description of player behavior.

## Functionality

**This is a [Work In Progress](#wip).**

<p align="center">
<img src="https://github.com/nkleemann/amsel-core/blob/master/doc/schematic.png" width="90%" height="80%"/>
</p>

This is the core: IO, GUI and interaction will sit in a new repository, later merged with this one.

### WIP

- [ ] Generate meodic phrases
    - [x] Provide simple, functional & well typed model of musical notes and their interaction in scales and phrases
    - [ ] Simulate different playing styles (Impressions)
- [ ] Implement the *Compose* Language
    - [ ] Provide API for switching key and playing styles
    - [ ] Parse `.compose` files
- [ ] MIDI
	- [ ] Implement the MIDI protocol
    - [x] Set up with WebMIDI to send notes via the IAC Driver
    - [ ] Allow for MIDI Sync
    - [ ] Fix drifting of time
- [ ] Interaction
    - [ ] Offer meaningfull input parameters to influence the generation of phrases
    - [ ] Integrate a feedback loop from visual input
