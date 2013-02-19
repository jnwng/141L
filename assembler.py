import re

opcodes = {
    "res": 0,
    "add": 0,
    "load": 1,
    "store": 2,
    "jump": 3,
    "branch": 4,
    "epar": 5,
    "cpin": 7,
    "cpout": 7, 
    "shift": 10, 
    "halt": 11,
}

registers = {
    "$s0": 0,
    "$s1": 1,
    "$t0": 2,
    "$t1": 3,
    "$t2": 4, 
    "$t3": 5,
    "$0": 6,
    "$c1": 7,
    "$c2": 8,
}

labels = {}

register_exp = r'(?P<reg>([0-8]|\$((t[0-3])|(s[0-1])|(c[1-2])|res|0)))'
halt_regexp = re.compile(r'(?P<instr>(halt))')
op_regexp = re.compile(r'(?P<instr>(add|shift|store|epar|cpin|cpout|jump|load))\s+((?P<flag>([01])),\s*)?' + register_exp)
branch_regexp = re.compile(r'(?P<instr>(branch))\s+(?P<comp>[><=])+(,\s*(?P<equals>=))*')
res_regexp = re.compile(r'(?P<instr>(res))\s+((?P<offset>[-0-9]+)|(?P<label>\w+))')
comment_regexp = re.compile(r'(^#|^\/{2})')
label_regexp = re.compile(r'(?P<label>(\w+):)')

def get_labels(infile):
    instruction_count = 0
    for line in infile:
        comment = comment_regexp.match(line)
        label = label_regexp.match(line)

        if line != "\n":
            if label: 
                count = instruction_count + 1
                strip_label = label.group('label').rstrip(':')
                print "Label: %(label)s @: %(count)s" % {'label': strip_label, 'count': count}

                labels[strip_label] = count
                instruction_count += 1
            elif comment:
                pass
            else:
                instruction_count += 1

def assemble(infile):
    instruction_count = 0

    infile.seek(0)
    for line in infile:
        comment = comment_regexp.match(line)
        label = label_regexp.match(line)

        op = op_regexp.match(line)
        branch = branch_regexp.match(line)
        res = res_regexp.match(line)
        halt = halt_regexp.match(line)

        line = line.rstrip()

        if label:
            pass

        elif comment:
            print "Comment"

        elif halt:
            opcode = int(opcodes[halt.group('instr')])
            instr = (1 << 4) ^ opcode
            instr <<= 4
            print "HALT"

        elif op:
            opcode = int(opcodes[op.group('instr')])
            flag = op.group('flag')
            reg = int(registers[op.group('reg')])
            cpout = op.group('instr') == 'cpout'

            debug = "%(instr)s "
            instr = (1 << 4) ^ opcode
            instr <<= 1

            if flag:
                debug += "%(flag)s, "

            if cpout:
                flag = 1

            if flag or cpout:
                instr ^= int(flag)

            debug += "%(reg)s"
            instr = (instr << 3) ^ reg

            print debug % op.groupdict()
            print bin(instr)

        elif branch:
            opcode = int(opcodes[branch.group('instr')])
            comp_flag = 0 if branch.group('comp') == '<' else 1
            equals_flag = branch.group('equals')

            instr = (1 << 4) ^ opcode
            instr = (instr << 1) ^ comp_flag
            branch_str = "%(instr)s %(comp)s"
            instr <<= 3

            if equals_flag:
                instr ^= int(equals_flag)
                branch_str +=  ", %(equals)s"

            print branch_str % branch.groupdict()
            print bin(instr)

        elif res:
            res_dict = res.groupdict()
            label = res_dict.get('label')
            offset = res_dict.get('offset')
            opcode = opcodes[res_dict['instr']]

            instr = 0 << 8
            offset = int(offset) if offset else offset
            if label is not None:
                instr ^= labels[label]
                res_str = label
            else:
                if offset < 0:
                    twos =  (1<<8)-1
                    offset = (twos ^ offset) + 1
                    offset *= -1
                instr ^= offset
                res_str = res_dict.get('offset')

            print "Res %s" % res_str
            print bin(instr)
        else:
            if len(line):
                print "INVALID INSTRUCTION: %s" % line

        if instr is not None:
            instruction_count += 1
            write_str = (bin(instr)[2:] + "\n").zfill(10)
            outfile.write(write_str)
            instr = None

if __name__ == "__main__":
    import sys
    try: 
        filename = sys.argv[1]
    except Exception, e:
        print "You need to specify a file!"
        sys.exit()
    infile = open(filename)
    outfile = open(filename + '.hex', 'w')
    get_labels(infile)
    assemble(infile)
    infile.close()
    outfile.close()

    

