
with open("../docs/balance_sheet_doc.txt", "rt", encoding='utf8') as f:
    lines = [l.strip() for l in f.readlines()]

    nums = int(len(lines) / 2)
    s = ["('{l}', bs.{v})".format(l=lines[i * 2 + 1], v=lines[i * 2]) for i in range(nums)]
    print(", ".join(s))
