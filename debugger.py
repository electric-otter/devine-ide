import pdb

def debug():
    x = 10
    y = 20
    pdb.set_trace()  # Execution stops here, and the debugger starts
    z = x + y
    return z

my_function()
