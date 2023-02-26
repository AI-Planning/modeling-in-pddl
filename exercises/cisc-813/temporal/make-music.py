
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

    # Check if we dond't have any chords
    if "play-chord" not in ''.join(lines):
        chords.append((0.0, ""))
        bars.append([])

    # print("Time\tLine")
    for line in lines:

        if "progress" in line or line[0] == ';':
            continue

        time = round(round(float(line.split(":")[0])*10) / 10.0, 1)

        # print(f"{time}\t{line.strip()}")

        if "play-chord" in line:
            assert time in [0, 4, 8, 12]
            chord = line.split()[2][:-1]
            chords.append((time, CHORD_CONVERSION[chord]))
            bars.append([])
        elif "play-note" in line or "play-tonic-note" in line or "play-cheat-note" in line:
            note = line.split()[2]
            dur = line.split()[3]
            # Fix for cheat notes
            if dur[-1] == ')':
                dur = dur[:-1]
            bars[-1].append((time, NOTE_CONVERSION[note], DURATION_CONVERSION[dur]))

    if len(chords) > 1:
        # Maximum duration of the final note is capped to the last chord time + 4.0
        max_time = chords[-1][0] + 4.0
        final_start = bars[-1][-1][0]
        final_duration = bars[-1][-1][2] / 2

        if final_start + final_duration > max_time:
            gap = GAP_CONVERSION[max_time - final_start]
            bars[-1][-1] = (final_start, bars[-1][-1][1], gap)


        # Next we want to go through and add straddle notes if necessary
        for i in range(len(bars)-1):
            max_time = chords[i][0] + 4.0
            final_start = bars[i][-1][0]
            final_duration = bars[i][-1][2] / 2
            if final_start + final_duration > max_time:
                extra = GAP_CONVERSION[(final_start + final_duration) - max_time]
                gap = GAP_CONVERSION[max_time - final_start]
                bars[i][-1] = (final_start, bars[i][-1][1], f"{gap}-")
                bars[i+1].insert(0, (chords[i+1][0], bars[i][-1][1], extra))

    # Finally, add any rests that are necessary
    for i in range(len(bars)):
        max_time = chords[i][0] + 4.0
        now = chords[i][0]
        j = -1
        while j < len(bars[i])-1:
            j += 1
            note = bars[i][j]
            if note[1] == "z":
                continue
            if note[0] > now:
                gap = GAP_CONVERSION[note[0] - now]
                bars[i] = bars[i][:j] + [(now, "z", gap)] + bars[i][j:]
                j += 1
            now = note[0] + note[2] / 2
        # Final rests
        if now < max_time:
            gap = GAP_CONVERSION[max_time - now]
            bars[i].append((now, "z", gap))


    for chord, events in zip(chords, bars):
        abc += chord[1] + "".join([note[1] + str(note[2]) for note in events]) + "|"

    abc = abc[:-1] + ":|"
    return abc


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Make music.')
    parser.add_argument('file', help='Input file')
    args = parser.parse_args()
    print(main(args.file))

