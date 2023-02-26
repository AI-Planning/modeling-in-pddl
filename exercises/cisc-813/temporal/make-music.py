
import argparse


# https://abc.rectanglered.com/


ABC_TEMPLATE = """X: 1
T: A temporal planner made this
M: 4/4
L: 1/8
R: cisc813
K: G
V: Melody
|:"""


CHORD_CONVERSION = {
    "y_gmaj": "\"Gmaj\"",
    "y_dmaj": "\"Dmaj\"",
    "y_emin": "\"Emin\"",
    "y_cmaj": "\"Cmaj\"",
}

NOTE_CONVERSION = {
    "a": "A",
    "b": "B",
    "c": "c",
    "d": "d",
    "e": "e",
    "f": "f",
    "g": "g",
    "ash": "^A",
    "csh": "^c",
    "dsh": "^d",
    "fsh": "^f",
    "gsh": "^g",
}

DURATION_CONVERSION = {
    "z_whole": 8,
    "z_half": 4,
    "z_quarter": 2,
    "z_eighth": 1,
}

GAP_CONVERSION = {
    0.0: 0,
    0.5: 1,
    1.0: 2,
    1.5: 3,
    2.0: 4,
    3.0: 6,
    4.0: 8
}

def main(fn):
    """Main entry point for the script."""
    with open(fn) as f:
        lines = f.readlines()
    abc = ABC_TEMPLATE

    chords = []
    bars = []
    now = 0.0
    straddle = False
    print("time\tnow\tline")
    for line in lines:
        if "progress" in line or line[0] == ';':
            continue
        time = round(round(float(line.split(":")[0])*10) / 10.0, 1)
        gap = time - now
        if gap > 0:
            bars[-1].append((now, "z", GAP_CONVERSION[gap]))
            now = time + gap
            print(f"\n  Gap: {gap} / now: {now}\n")

        print(f"{time}\t{now}\t{line.strip()}")
        if "play-chord" in line:
            assert time in [0, 4, 8, 12]
            chord = line.split()[2][:-1]
            chords.append((time, CHORD_CONVERSION[chord]))
            if straddle:
                straddle = False
            else:
                bars.append([])
        elif "play-note" in line or "play-tonic-note" in line:
            note = line.split()[2]
            dur = line.split()[3]
            bars[-1].append((time, NOTE_CONVERSION[note], DURATION_CONVERSION[dur]))
            now += DURATION_CONVERSION[dur] / 2
        elif "play-cheat-note" in line:
            note = line.split()[2]
            dur = line.split()[3][:-1]

            # Check if we should straddle the bar line
            endpoint = time + DURATION_CONVERSION[dur] / 2
            if bars[-1]:
                barstart = bars[-1][0][0]
            else:
                barstart = endpoint
            if (endpoint - barstart) > 4.0:
                first_dur = 2*(4 - (time - barstart))
                second_dur = 2*(endpoint - barstart - 4)
                bars[-1].append((time, NOTE_CONVERSION[note], f"{int(first_dur)}-"))
                bars.append([])
                bars[-1].append((time+(first_dur/2), NOTE_CONVERSION[note], int(second_dur)))
                straddle = True
            else:
                bars[-1].append((time, NOTE_CONVERSION[note], DURATION_CONVERSION[dur]))
            now += DURATION_CONVERSION[dur] / 2

    for chord, events in zip(chords, bars):
        abc += chord[1] + "".join([note[1] + str(note[2]) for note in events]) + "|"

    abc = abc[:-1] + ":|"
    return abc


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Make music.')
    parser.add_argument('file', help='Input file')
    args = parser.parse_args()
    print(main(args.file))

