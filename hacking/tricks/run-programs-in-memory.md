# run executable binary programs within process memory

## linux
### base64 piped text using dd and shellcode
https://github.com/arget13/DDexec
` | ddexec.sh argv0 argv1 ...`

## windows
### cobalt strike
#### BOF C DLLs
build C assemblies as DLLs and run in memory on C2 client.
#### BOF.NET common language runtime CLR .NET assemblies
a BOF that loads CLR and runs .NET assemblies
