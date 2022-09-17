# calling conventions

## x64 linux C style
`RDI, RSI, RDX, RCX, R8, R9`
- Arguments 1-6 are passed via registers `RDI, RSI, RDX, RCX, R8, R9` respectively;
- Arguments 7 and above are pushed on to the stack.

## x64 windows C style
`RCX, RDX, R8, and R9`.
- Integer arguments are passed in registers `RCX, RDX, R8, and R9`.
- Floating point arguments are passed in `XMM0L, XMM1L, XMM2L, and XMM3L`.
- 16-byte arguments are passed by reference.

#### volatile registers after call
`RCX, RDX, R8, R9, RAX, R10, R11, XMM4, XMM5`
Floating point arguments `XMM0L, XMM1L, XMM2L, and XMM3L.`
These registers are considered volatile, or potentially changed by a callee on return.
