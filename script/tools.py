import os

stmts = ["balance_sheet.txt", "income_statement.txt", "cash_flow_statement.txt"]
kws = ["bs", "is", "cs"]

ofn = os.path.relpath("docs/subject_mapper.txt", __file__)
with open(ofn,  "wt", encoding='utf8') as outf:
    for stmt, kw in zip(stmts, kws):
        ifn = os.path.relpath(f"docs/{stmt}", __file__)
        with open(ifn, "rt", encoding='utf8') as inf:
            subject_exps = list()
            for line in inf:
                sub, label = line.strip().split(" ")
                subject_exps.append(f"('{label.strip()}', {kw}.{sub.strip()})")
            outf.write("[" + ", ".join(subject_exps) + "]")
            outf.write("\n")
