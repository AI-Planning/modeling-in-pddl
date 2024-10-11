

# WARNING: This file needs to be duplicated in both the root and rddl directories.


import argparse, os, requests

USAGE = "usage: python fetch.py <formalism> <example>"


def fetch(formalism, example):

    r = requests.get(f"https://editor.planning.domains/planning-course/{formalism}/{example}")
    session_id = r.url.split('=')[-1]
    js_url = f"https://editor.planning.domains/session/{session_id}"

    # Get the JS file
    r = requests.get(js_url)

    status = 'looking'
    for line in r.text.split('\n'):
        if 'save-tabs' in line:
            status = 'looking-for-files'
        elif 'settings' in line and status == 'looking-for-files':
            status = 'found-files'
        elif status == 'found-files':
            if line.strip().startswith('}'):
                break
            fn = line.split('"')[1]
            content = '"'.join(line.split('"')[3:-1])
            content = content.replace('\\n', '\n').replace('\\t', '\t').replace('\\"', '"')

            # Confirm if file already exists
            if os.path.exists(fn):
                print(f"File {fn} already exists. Overwrite? (y/n)")
                if input() != 'y':
                    continue
                else:
                    print("Overwriting file.")
            print(f"Writing file {fn}...")
            with open(fn, 'w') as f:
                f.write(content)



if __name__ == "__main__":
    parser = argparse.ArgumentParser(usage=USAGE)
    parser.add_argument("formalism", help="formalism name")
    parser.add_argument("example", help="example name")
    args = parser.parse_args()
    fetch(args.formalism, args.example)
