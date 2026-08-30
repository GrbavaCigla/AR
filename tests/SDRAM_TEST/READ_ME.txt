Kontrole:
- RESET dugme resetuje tester i SDRAM kontroler
- WRITE dugme upisuje vrednost u SDRAM
- READ dugme cita vrednost iz SDRAM-a
- SW[1..0] bira adresu i test podatak

Mapiranje:
SW = 00 -> adresa 0x00 -> upisuje 0x11(decimalno 017)
SW = 01 -> adresa 0x04 -> upisuje 0x22(decimalno 034)
SW = 10 -> adresa 0x08 -> upisuje 0x33(decimalno 051)
SW = 11 -> adresa 0x0C -> upisuje 0x44(decimalno 068)