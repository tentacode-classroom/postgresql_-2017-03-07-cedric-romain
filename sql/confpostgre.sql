--Modifie le port et la mémoire
ALTER SYSTEM SET port = 1234;
ALTER SYSTEM SET work_mem = '128MB';

--Montre le port et la mémoire définie
SHOW port;
SHOW work_mem;

--Reset toute la configuration
ALTER SYSTEM RESET all;
