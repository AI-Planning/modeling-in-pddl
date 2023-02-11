
import argparse, json, os, re, requests

USAGE = "usage: python fetch.py <formalism> <example>"


def fetch(formalism, example):

    r = requests.get(f"http://editor.planning.domains/planning-course/{formalism}/{example}")
    session_id = r.url.split('=')[-1]
    js_url = f"http://editor.planning.domains/session/{session_id}"

    # Get the JS file
    r = requests.get(js_url)
    json_settings = re.search('"save-tabs".*drag-and-drop"', r.text, re.DOTALL).group(0).split('"drag-and-drop"')[0]
    json_settings = '{' + json_settings.strip()[:-1] + '}'
    data = json.loads(json_settings)

    for fn in data['save-tabs']['settings']:
        # Confirm if file already exists
        if os.path.exists(fn):
            print(f"File {fn} already exists. Overwrite? (y/n)")
            if input() != 'y':
                continue
            else:
                print("Overwriting file.")
        print(f"Writing file {fn}...")
        with open(fn, 'w') as f:
            f.write(data['save-tabs']['settings'][fn])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(usage=USAGE)
    parser.add_argument("formalism", help="formalism name")
    parser.add_argument("example", help="example name")
    args = parser.parse_args()
    fetch(args.formalism, args.example)
