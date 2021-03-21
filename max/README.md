### notes on porting

* refactor idea of "time" out of amsel object -> better sync
    - [ ] no rests & restpool
    - [ ] 4 inlets: `[bang(tick), list: (root, scale, len), list: noteProbSeqList, float: noteOrRestProb]`
    - [ ] each tick: play note or rest

* playable via multislider (probSeq) & firing of sheet messages (for scales)