echo # Set up for debugging PIC32MX \n

echo # set logging on \n
       set logging on

echo # set complaints 1 \n
       set complaints 1

echo # set architecture mips \n
       set architecture mips
     
echo # Even though PIC32MX is little-endian, Li Shao's GDB server requires big endian ??? \n
echo # set endian big \n
       set endian big

echo # target remote localhost:1000 \n
       target remote localhost:1000

echo # Load symbol file for program and examine a variable... \n

echo # symbol-file Tiny4.elf \n
       symbol-file Tiny4.elf

echo # p hello \n
       p hello
