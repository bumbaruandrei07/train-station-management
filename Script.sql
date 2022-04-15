create table TIP_CLIENT
(ID_TIP_CLIENT number(5) primary key,
TIP_CLIENT varchar2(20)
constraint TIP_CLIENT_CK check(TIP_CLIENT in('PERSOANA FIZICA', 'PERSOANA JURIDICA')));

Select * from clienti;
ALTER TABLE clienti RENAME TO CLIENTII;
create table CLIENTI
(ID_CLIENT number(5) primary key,
ID_TIP_CLIENT number(5),
CNP number(13),
NUME varchar2(20),
PRENUME varchar2(20),
SEX varchar2(10),
EMAIL varchar2(30),
TELEFON varchar2(15),
TARA varchar2(20),
ORAS varchar2(20),
ADRESA varchar2(30),
COD_POSTAL number(6),
constraint ID_TIP_CLIENT_FK foreign key(ID_TIP_CLIENT) references TIP_CLIENT(ID_TIP_CLIENT),
constraint CNP_UQ unique(CNP),
constraint NUME_nn check(NUME is not null),
constraint SEX_CK check(SEX in('FEMININ', 'MASCULIN')));

create table COMPANII
(ID_COMPANIE number(5) primary key,
NUME_COMPANIE varchar2(20));

create table CLASA
(ID_CLASA number(3) primary key,
NUME_CLASA varchar2(10)
constraint NUME_CLASA_CK check(NUME_CLASA in('CLASA I', 'CLASA A II-A')));


create table TRENURI
(ID_TREN number(5) primary key,
ID_COMPANIE number(5),
MODEL varchar2(20),
CAPACITATE number(4),
constraint ID_COMPANIE_FK foreign key(ID_COMPANIE) references COMPANII(ID_COMPANIE));

create table TARI
(ID_TARA number(5) primary key,
NUME_TARA varchar2(20));

create table ORASE
(ID_ORAS number(5) primary key,
ID_TARA number(5),
NUME_ORAS varchar2(20));

create table GARA
(ID_GARA number(5) primary key,
ID_ORAS number(5),
NUME_GARA varchar2(50));

select * from gara;

create table CALATORIE
(ID_CALATORIE number(5) primary key,
ID_CLIENT number(5),
ID_CLASA number(5),
ID_COMPANIE number(5),
ID_TREN number(5),
ID_GARA number(5),
DATA_PLECARE date,
ORA_PLECARE varchar2(20),
DURATA_CALATORIE varchar2(10),
INTARZIERE varchar2(10),
PRET_BILET number(5),
constraint FK_ID_CLIENT foreign key(ID_CLIENT) references CLIENTI(ID_CLIENT),
constraint FK_ID_CLASA foreign key(ID_CLASA) references CLASA(ID_CLASA),
constraint FK_ID_COMPANIE foreign key(ID_COMPANIE) references COMPANII(ID_COMPANIE),
constraint FK_ID_TREN foreign key(ID_TREN) references TRENURI(ID_TREN),
constraint FK_ID_GARA foreign key(ID_GARA) references GARA(ID_GARA));

--Adaugarea unei noi coloane NR_LOC în tabela CALATORIE:
alter table CALATORIE add NR_LOC number(3);

--Modificarea tipului de dat? a coloanei NR_LOC din tabela CALATORIE:
alter table CALATORIE modify NR_LOC number(5);

--Stergerea coloanei NR_LOC din tabela CALATORIE:
alter table CALATORIE drop column NR_LOC;

alter table GARA rename to GARI;

alter table CLIENTI add constraint NUME_UQ unique(NUME);
select * from user_constraints;

alter table CLIENTI disable constraint NUME_UQ;
select * from user_constraints;

alter table CLIENTI drop constraint NUME_UQ;
select * from user_constraints;

insert into TIP_CLIENT values (101, 'PERSOANA FIZICA');
insert into TIP_CLIENT values (102, 'PERSOANA FIZICA');
insert into TIP_CLIENT values (103, 'PERSOANA JURIDICA');
insert into TIP_CLIENT values (104, 'PERSOANA FIZICA');
insert into TIP_CLIENT values (105, 'PERSOANA JURIDICA');
insert into TIP_CLIENT values (106, 'PERSOANA JURIDICA');
insert into TIP_CLIENT values (107, 'PERSOANA FIZICA');
insert into TIP_CLIENT values (108, 'PERSOANA FIZICA');
insert into TIP_CLIENT values (109, 'PERSOANA JURIDICA');
insert into TIP_CLIENT values (110, 'PERSOANA FIZICA');
select * from tip_client;

insert into CLIENTI values(111,101, 1910223338145, 'Mihai', 'Ionescu','MASCULIN',
'mihai.ionescu99@gmail.com', '0761.134.525', 'Romania', 'Bucuresti', 'B-dul Gheorghe Magheru, nr. 18', 534210);
insert into CLIENTI values(112,102, 1921203735981, 'Ionescu', 'Maria', 'FEMININ',
'ionescu.maria89@yahoo.com', '0765.551.490', 'Romania', 'Timisoara', 'strada Aurora, nr.34', 459032);
insert into CLIENTI values(113,103, 2780630678239, 'Dragoi', 'Paul', 'MASCULIN', 'dragoi.paul38@hotmail.com', '0758.933.990', 'Romania', 'Brasov', 'strada Traian, nr. 19', 736834);
insert into CLIENTI values(114,104, 2801020375912, 'Popescu', 'Cristina', 'FEMININ', 'popescu.cristina@yahoo.com', '0767.823,830', 'Romania', 'Constanta', 'strada Victoriei, nr. 12', 627267);
insert into CLIENTI values(115,105, 1890225764329, 'Angelescu', 'Cristian', 'MASCULIN',
'angelescu.cristian98@yahoo.com', '0766.552.611', 'Romania', 'Neptun', 'strada Plopilor, nr. 3', 122390);
insert into CLIENTI values(116,106, 6531626375516, 'Enache', 'Ioana', 'FEMININ','enache.ioana39@yahoo.com', '0761.3434,120', 'Romania', 'Constanta', 'strada Stejarilor, nr. 12', 123241);
insert into CLIENTI values(117,107, 2920511657493, 'Bucur', 'Florentina', 'FEMININ', 'elena.bucur93@yahoo.com', '0775.121.829', 'Romania', 'Bucuresti', 'B-dul Iuliu Maniu, nr. 41',882641);
insert into CLIENTI values(118,108, 1901221876543, 'Tudor', 'Andreea', 'FEMININ',
'andreea.tudor54@gmail.com', '0747.915.213', 'Romania', 'Craiova', 'strada Sperantei, nr. 23',847658);
insert into CLIENTI values(119,109, 2891101420061, 'Georgescu', 'Liviu', 'MASCULIN','georgescu.liviu87@gmail.com', '0774.297.037', 'Romania', 'Iasi', 'strada Lalelelor, nr. 24',426529);
insert into CLIENTI values(120,110, 1600616758264, 'Gheorghe', 'Andrei', 'MASCULIN', 'andrei.gheorghe@gmail.com', '0776.875.927', 'Romania', 'Timisoara', 'strada Stefan cel Mare, nr. 26',387568);
select * from clienti;

insert into COMPANII values(211, 'CFR Calatori');
insert into COMPANII values(212, 'Softrans');
insert into COMPANII values(213, 'Astra Trans Carpatic');
insert into COMPANII values(214, 'Alstom');
insert into COMPANII values(215,' Eurostar');
insert into COMPANII values(216, 'Deutsche Bahn AG');
insert into COMPANII values(217, 'Renfe Operadora');
insert into COMPANII values(218, 'Trenitalia');
insert into COMPANII values(219, 'Thalys International');
insert into COMPANII values(220, 'Rail Cargo Group');
select * from companii;

insert into CLASA values(311, 'CLASA I');
insert into CLASA values(312, 'CLASA A II-A');
insert into CLASA values(313, 'CLASA I');
insert into CLASA values(314, 'CLASA A II-A');
insert into CLASA values(315, 'CLASA I');
insert into CLASA values(316, 'CLASA A II-A');
insert into CLASA values(317, 'CLASA I');
insert into CLASA values(318, 'CLASA A II-A');
insert into CLASA values(319, 'CLASA I');
insert into CLASA values(320, 'CLASA A II-A');
select * from clasa;

insert into TRENURI values(411, 211, 'Regio 234523', 286);
insert into TRENURI values(412, 212, 'InterRegio 234567', 195);
insert into TRENURI values(413, 213, 'TGV 737-823', 210);
insert into TRENURI values(414, 214, 'AGV A323140', 234);
insert into TRENURI values(415, 215, 'TGV 4224-522', 89);
insert into TRENURI values(416, 216, 'TGV 731-130', 305);
insert into TRENURI values(417, 217, 'TGV A454', 800);
insert into TRENURI values(418, 218, 'TGV RT-242', 90);
insert into TRENURI values(419, 219, 'TGV 727', 130);
insert into TRENURI values(420, 220, 'TGV 728', 345);
select * from trenuri;

insert into TARI values(511, 'Romania');
insert into TARI values(512, 'Romania');
insert into TARI values(513, 'Italia');
insert into TARI values(514, 'Franta');
insert into TARI values(515, 'Anglia');
insert into TARI values(516, 'Franta');
insert into TARI values(517, 'Belgia');
insert into TARI values(518, 'Germania');
insert into TARI values(519, 'Turcia');
insert into TARI values(520, 'Cehia');
select * from tari;

insert into ORASE values(611, 511, 'Bucuresti');
insert into ORASE values(612, 512, 'Iasi');
insert into ORASE values(613, 513, 'Roma');
insert into ORASE values(614, 514, 'Paris');
insert into ORASE values(615, 515, 'Londra');
insert into ORASE values(616, 516, 'Lyon');
insert into ORASE values(617, 517, 'Bruxelles');
insert into ORASE values(618, 518, 'Berlin');
insert into ORASE values(619, 519, 'Ankara');
insert into ORASE values(620, 520, 'Praga');
select * from orase;

insert into GARI values(711, 611, 'Gara de Nord');
insert into GARI values(712, 612, 'Gara Iasi');
insert into GARI values(713, 613, 'Gara Roma Termini');
insert into GARI values(714, 614, 'Charles de Gaulle');
insert into GARI values(715, 615, 'Gara Victoria');
insert into GARI values(716, 616, 'Gara Lyon');
insert into GARI values(717, 617, 'Gara Centrala din Bruxelles');
insert into GARI values(718, 618, 'Gara Hauptbahnhof');
insert into GARI values(719, 619, 'Gara Bakery');
insert into GARI values(720, 620, 'Gara Principala din Praga');
select * from gari;

insert into CALATORIE values(801, 111, 311, 211, 411,711,to_date('03.06.2019','dd.mm.yyyy'),
'10:50','2 ore', '15 minute', 450);
insert into CALATORIE values(802, 112, 312, 212, 412,712,to_date('05.07.2019','dd.mm.yyyy'), '13:00', '4 ore', 'fara', 420);
insert into CALATORIE values(803, 113, 313, 213, 413,713,to_date('27.08.2019','dd.mm.yyyy'), '16:40', '2 ore','10 minute', 289);
insert into CALATORIE values(804, 114, 314, 214, 414,714,to_date('14.9.2019','dd.mm.yyyy'), '12:30', '3 ore', '20 minute', 349);
insert into CALATORIE values(805, 115, 315, 215, 415,715,to_date('15.10.2019','dd.mm.yyyy'), '05:30', '7 ore', 'fara', 129);
insert into CALATORIE values(806, 116, 316, 216, 416,716,to_date('23.11.2019','dd.mm.yyyy'), '09:00', '2 ore', '5 minute', 500);
insert into CALATORIE values(807, 117, 317, 217, 417,717,to_date('04.12.2019','dd.mm.yyyy'), '11:00', '1 ora', '10 minute', 220);
insert into CALATORIE values(808, 118, 318, 218, 418,718,to_date('04.01.2020','dd.mm.yyyy'), '22:00', '4 ore', 'fara', 500);
insert into CALATORIE values(809, 119, 319, 219, 419,719,to_date('07.01.2020','dd.mm.yyyy'), '17:30', '3 ore', '10 minute', 499);
insert into CALATORIE values(810, 120, 320, 220, 420,720,to_date('08.01.2020','dd.mm.yyyy'), '02;35', '10 ore', '5 minute', 370);
select * from calatorie;

--Actualizarea numelui clientului al carui ID este 111:
update CLIENTI
set NUME='Andrei'
where ID_CLIENT=111;
select nume
from clienti
where id_client=111;

--Stergerea tipului clientului care are id-ul 102
delete from TIP_CLIENT
where ID_TIP_CLIENT=102;
select * from TIP_CLIENT;

-- stergerea si recuperarea unei tabele
drop table ORASE cascade constraints;
Flashback table ORASE to before drop;

--union all
select prenume
from clienti
where initcap(prenume)='Liviu'
union all
select nume_companie
from companii
where initcap(nume_companie)='Softrans';

select id_companie id, nume_companie nume
from companii
union
select id_client id, nume
from clienti;

--intersect
select model, capacitate*1 from trenuri
intersect
select model, capacitate
from trenuri;

select data_plecare, pret_bilet*1
from CALATORIE
intersect
select data_plecare, pret_bilet
from CALATORIE;

--MINUS
SELECT * FROM CALATORIE WHERE pret_bilet BETWEEN 199 AND 300
MINUS
SELECT * FROM CALATORIE WHERE pret_bilet IN(200, 350);

SELECT * FROM TRENURI WHERE capacitate BETWEEN 200 AND 400
MINUS
SELECT * FROM TRENURI WHERE capacitate IN(300,500);

--DECODE
select id_calatorie, pret_bilet,
pret_bilet*decode(id_calatorie, 801, 1.1, 809, 1.2) pret_majorat
from CALATORIE;

select model, capacitate,
capacitate * decode(model, 'TGV RT-242', 0.7, 'TGV A454', 0.6) capacitate_scazuta
from trenuri;

--CASE
select id_calatorie, data_plecare, pret_bilet, case
when pret_bilet>400 then 'bilet scump'
when pret_bilet between 300 and 400 then 'pret mediu'
else 'bilet ieftin'
end clasificare_bilet
from calatorie;

select id_calatorie, data_plecare, pret_bilet*case
when id_calatorie = 807 then 1.1
when id_calatorie = 809 then 1.2
else 1.3
end scumpire_bilet
from calatorie;

--CERERI IMBRICATE(SUBCERERI)
update CALATORIE
set PRET_BILET = PRET_BILET*0.3
where PRET_BILET in (select PRET_BILET from CALATORIE where ID_CLIENT = 113);

update TRENURI
set CAPACITATE = CAPACITATE–40
where CAPACITATE in(select CAPACITATE from TRENURI where ID_TREN = 417);

--functii single-row
select * from CLIENTI
where ID_CLIENT in (select ID_CLIENT from CLIENTI where lower(NUME)='georgescu');
SELECT id_client, nume FROM clienti WHERE nume like upper('D%');

--functii de grup
select MIN(pret_bilet) , MAX(pret_bilet) from calatorie;
select MIN(capacitate), MAX(capacitate) from trenuri;
select MIN(data_plecare), MAX(data_plecare) from calatorie;

--jonctiuni
select cl.ID_CLIENT, cl.NUME, cl.PRENUME, c.DATA_PLECARE, c.PRET_BILET
from CLIENTI cl, CALATORIE c
where cl.ID_CLIENT = c.ID_CLIENT and PRET_BILET > 300
order by NUME asc;

select t.model, t.capacitate, c.data_plecare, c.pret_bilet
from trenuri t, calatorie c
where t.id_tren = c.id_tren and c.pret_bilet > 300
order by pret_bilet desc;

--vederi / view-uri
create or replace view V_CLIENTI_115
as select * from CLIENTI
where ID_CLIENT=115;
update V_CLIENTI_115
set NUME='Grigorescu';
select * from v_clienti_115;

create or replace view V_CALATORIE
as select DATA_PLECARE, PRET_BILET
from CALATORIE;
update V_CALATORIE
set PRET_BILET=PRET_BILET*1.3;
select * from V_CALATORIE
where extract(month from DATA_PLECARE)=2;
select * from user_views;

--indecsi
select * from CALATORIE
where PRET_BILET between 300 and 400;
create index idx_PRET_BILET on CALATORIE(PRET_BILET);
select * from TRENURI
where CAPACITATE between 200 and 300;
create index idx_CAPACITATE on TRENURI(CAPACITATE);
select * from user_indexes;

--sinonime
create synonym cl for CLIENTI;
create synonym t for TRENURI;
select * from user_synonyms;

--secvente
create sequence s_tari start with 1 increment by 1 maxvalue 100;
insert into TARI values (s_tari.nextval, 'NUME_TARA');
create sequence s_companii start with 1 increment by 1 maxvalue 100;
insert into COMPANII values (s_companii.nextval, 'NUME_COMPANIE');
select * from user_sequences;



--PL/SQL

--STRUCTURI DE CONTROL
--Sa se modifice pretul biletului de calatorie folosind o instructiune conditionala CASE fara selector.

select * from calatorie;
SET SERVEROUTPUT ON
DECLARE
v_pret calatorie.pret_bilet%type;
BEGIN
SELECT pret_bilet into v_pret from calatorie where id_calatorie=&p;
dbms_output.put_line ('Pretul initial al biletului de calatorie este: '||v_pret);
CASE
WHEN v_pret < 300 THEN
v_pret:=1.75* v_pret;
WHEN v_pret between 400 and 600 THEN
v_pret:=1.5 * v_pret;
ELSE
v_pret:=1.17* v_pret;
END CASE;
dbms_output.put_line('Pretul final al biletului este: '||v_pret);
end;
/

--2 Sa se creeze un bloc PL/SQL prin care,in functie de capacitatea unui tren având ID-ul citit de la tastatura;
--sa se afiseze noua valoare a capacitatii trenului.
SELECT * FROM TRENURI;
SET SERVEROUTPUT ON
DECLARE
v_capacitate trenuri.capacitate%type;
BEGIN
SELECT capacitate into v_capacitate from TRENURI where ID_TREN=&id;
dbms_output.put_line ('Capacitatea initiala a trenului este: '||v_capacitate);
IF v_capacitate < 200 THEN
v_capacitate:= v_capacitate+50;
ELSIF v_capacitate between 200 and 300 THEN
v_capacitate:=v_capacitate*1.27;
ELSE
v_capacitate:=v_capacitate+70;
END IF;
dbms_output.put_line('Capacitatea finala a trenului este: '||v_capacitate);
end;
/

--3
--Sa se afiseze în ordine calatoriile cu codurile în intervalul 801-810 atâta timp cât pretul biletului acestora este mai mic decât media:
SET SERVEROUTPUT ON
DECLARE
v_pretB calatorie.pret_bilet%type;
v_pretBilet_mediu v_pretB%type;
i number(12):=801;
BEGIN
SELECT avg(pret_bilet) into v_pretBilet_mediu from calatorie;
dbms_output.put_line('Pretul mediu pentru un bilet de calatorie este: '||v_pretBilet_mediu);
while i<=810 loop
select pret_bilet into v_pretB from CALATORIE where id_calatorie=i;
dbms_output.put_line('Pentru calatoria cu id-ul '||i||' trebuie sa platesti un bilet care costa : '||v_pretB);
i:=i+1;
exit when v_pretB<v_pretBilet_mediu;
end loop;
end;
/

--CURSORI IMPLICITI SI EXPLICITI

-- cursor explicit 1
-- Sa se creeze un bloc PL/SQL prin care sa se afiseze primele 3 calatorii care au pretul biletului cel mai mare.
SET SERVEROUTPUT ON
declare
cursor c is SELECT * FROM CALATORIE ORDER BY PRET_BILET DESC;
v_calatorie c%rowtype;
begin
open c;
loop
fetch c into v_calatorie;
exit when c%notfound or c%rowcount>3;
dbms_output.put_line(v_calatorie.id_calatorie|| ' ' ||v_calatorie.pret_bilet);
end loop;
close c;
end;
/

-- cursor explicit 2
--Sa se creeze un bloc PL/SQL in care sa se utilizeze un cursor parametrizat pentru a prelua data plecarii,
--durata calatoriei si pretul biletului dintr-un client furnizat parametru.
SET SERVEROUTPUT ON
DECLARE
cursor c(v_id number) is select id_calatorie, data_plecare, durata_calatorie, pret_bilet from CALATORIE
WHERE id_client = v_id;
i number:=0;
a number;
r_c c%rowtype;
v_id calatorie.id_client%type :=&id;

BEGIN
select count(*) into a
from CLIENTI where id_client = v_id;
open c(v_id);
loop
fetch c into r_c;
exit when c%notfound;
DBMS_OUTPUT.PUT_LINE('Data plecari este: ' ||r_c.data_plecare|| ' iar durata calatoriei este de ' ||r_c.durata_calatorie|| ' avand un pret al biletului de '||r_c.pret_bilet);
end loop;

i:=c%rowcount;
if i>0 then DBMS_OUTPUT.PUT_LINE(' Total Clienti participa in calatoria '||v_id||' : '||i);
close c;
end if;
END;
/

--cursor implicit 1
--Printr-un bloc PL/SQL, se se atribuie o reducere pentru bilete de calatorie în functie de cat de mare este intarzierea:
-- calatoriile care au o intarziere de 15 minute vor avea o reducere de 15%;
-- calatoriile care au o intarziere de 20 minute vor avea o reducere de 25%;
-- pentru calatoriile care nu au intarziere se va aplica o majorare asupra pretului biletului de 30%;
-- pentru celelalte calatorii care inregistreaza intarzieri nu se va aplica nicio reducere.
select * from calatorie;
SET SERVEROUTPUT ON
BEGIN
UPDATE calatorie
SET pret_bilet = pret_bilet - pret_bilet*0.15
WHERE intarziere LIKE'%15 minute%';
DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' modificari efectuate');

UPDATE calatorie
SET pret_bilet = pret_bilet - pret_bilet*0.25
WHERE intarziere LIKE'%20 minute%';
DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' modificari efectuate');
UPDATE calatorie
SET pret_bilet = pret_bilet + pret_bilet*0.30
WHERE intarziere LIKE'%fara%';
DBMS_OUTPUT.PUT_LINE (SQL%ROWCOUNT || ' modificari efectuate');
END;

-- cursor implicit 2
--Sa se stearga trenurile care au capacitatea mai mica decat 150 si sa se vizualizeze rezultatele folosind cursorul implicit
SELECT * FROM TRENURI;
SET SERVEROUTPUT ON
DECLARE
v_rez number(5);
BEGIN
DELETE from TRENURI WHERE CAPACITATE < 150;
v_rez:=sql%rowcount;
if sql%notfound then
DBMS_OUTPUT.PUT_LINE('Nu a fost stearsa nicio inregistrare!');
else
DBMS_OUTPUT.PUT_LINE('Au fost sterse '||v_rez||' inregistrari');
end if;
end;
/
rollback;



--EXCEPTII

-- exceptie implicita 1
-- Sa se creeze un bloc PL/SQL prin care se tripleaza pre?ul biletului de calatorie al c?rui cod este citit de la tastatur?. În cazul în care acesta nu exist?, se va invoca o excep?ie care va fi tratata prin afisarea unui mesaj.
SET SERVEROUTPUT ON
DECLARE
v_id_calatorie NUMBER :=&id;
nu_exista_calatoria exception;

BEGIN
UPDATE CALATORIE
SET pret_bilet = pret_bilet * 3
WHERE id_calatorie = v_id_calatorie;
if sql%rowcount=0 then
raise nu_exista_calatoria;
else DBMS_OUTPUT.PUT_lINE('Pretul biletului de calatorie a fost modificat');
end if;
EXCEPTION
WHEN nu_exista_calatoria THEN
DBMS_OUTPUT.PUT_lINE('Nu exista calatoria cu acest ID');
END;
/

-- exceptie implicita 2
-- Sa se creeze un bloc PL/SQL prin care sa se afiseze clientul cu id-ul 111 si sa se afiseze clientul cu prenumele Andrei impreuna cu numarul acestuia de telefon.
-- in cazul in care nu exista niciun client cu id-ul 111 se va invoca o exceptie care va fi tratata corespunzator;
-- in cazul in care exista mai multi clienti cu prenumele Andrei se va invoca o exceptie ce va fi tratata corespunzator.
SET SERVEROUTPUT ON
DECLARE
v_nume VARCHAR2(20);
tel clienti.telefon%type;
BEGIN
SELECT nume INTO v_nume
FROM clienti
WHERE id_client=111;
dbms_output.put_line(v_nume);
select telefon into tel from clienti where prenume='Andrei';
DBMS_OUTPUT.PUT_LINE('Andrei are numarul de telefon: '||tel);
EXCEPTION
WHEN NO_DATA_FOUND THEN
dbms_output.put_line('Nu exista clientul cu acest ID!');

WHEN TOO_MANY_ROWS THEN
DBMS_OUTPUT.PUT_LINE('Exista mai multi clienti cu numele Andrei!');
END;
/

--exceptie explicita 1
-- Sa se creeze un bloc PL/SQL care sa contina un cursor parametrizat pentru a prelua modelul si capacitatea trenurilor dintr-o companie furnizata drept parametru
-- in cazul in care nu exista compania indicata se va invoca o exceptie ce va fi tratata corespunzator;
-- in cazul in care nu exista trenuri in compania indicata se va invoca o exceptie ce va fi tratata corespunzator.
SET SERVEROUTPUT ON
DECLARE

Cursor c(v_id number) is select id_tren, model, capacitate from TRENURI
WHERE id_companie = v_id;
j number :=0;
b number;
nu_exista_trenuri exception;
nu_exista_companie exception;
r_c c%rowtype;
v_id trenuri.id_companie%type :=&id;
BEGIN
SELECT COUNT(*) INTO b
from COMPANII WHERE id_companie =v_id;
if b=0 THEN
raise nu_exista_companie;
else
open c(v_id);
loop
fetch c into r_c;
exit when c%notfound;
DBMS_OUTPUT.PUT_LINE('Model '||r_c.model||' are capacitatea '||r_c.capacitate);
end loop;
j:=c%rowcount;
if j>0 then
DBMS_OUTPUT.PUT_LINE(' Total trenuri in compania '||v_id||' :'||j);
else
raise nu_exista_trenuri;
end if;
close c;
end if;
EXCEPTION
WHEN nu_exista_trenuri THEN DBMS_OUTPUT.PUT_LINE('Nu exista trenuri in compania '||v_id);
WHEN nu_exista_companie THEN DBMS_OUTPUT.PUT_LINE('Nu exista compania '||v_id);
END;
/


--exceptie explicita 2
-- Sa se creeze un bloc PL/SQL prin care sa se afiseze primele 3 calatorii care au pretul biletului cel mai mare.
-- in cazul in care nu exista nicio calatorie se va invoca o exceptie ce va fi tratata corespunzator;
-- se va trata orice alta exceptie cu o rutina de tratare corespunzatoare.
SET SERVEROUTPUT ON
declare
cursor c is SELECT * FROM CALATORIE ORDER BY PRET_BILET DESC;
v_calatorie c%rowtype;
nu_exista_calatorii exception;
begin
open c;
loop
fetch c into v_calatorie;
exit when c%notfound or c%rowcount>3;
dbms_output.put_line(v_calatorie.id_calatorie|| ' ' ||v_calatorie.pret_bilet);
IF SQL%NOTFOUND THEN
RAISE nu_exista_calatorii;
END IF;
end loop;
close c;
EXCEPTION
when nu_exista_calatorii THEN DBMS_OUTPUT.PUT_LINE('Nu exista calatorii');
when others then dbms_output.put_line(SQLCODE||' ' ||SQLERRM);
end;
/


--PROCEDURI

--1 Sa se creeze o procedura care sa contina un cursor parametrizat pentru a prelua id-ul calatoriei, durata calatoriei si pretul biletului pentru un client furnizat drept parametru.
--in cazul in care nu exista calatorul indicat se va invoca o exceptie ce va fi tratata corespunzator;
--in cazul in care nu exista calatorii pentru calatorul indicat se va invoca o exceptie ce va fi tratata corespunzator.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE informatii_calatori
IS
Cursor c(v_id number) is select id_calatorie, durata_calatorie, pret_bilet from CALATORIE
WHERE id_client = v_id;
j number :=0;
b number;
nu_exista_calatoria exception;
nu_exista_calatorul exception;
r_c c%rowtype;
v_id calatorie.id_client%type :=&id;
BEGIN
SELECT COUNT(*) INTO b
from CLIENTI WHERE id_client =v_id;
if b=0 THEN
raise nu_exista_calatorul;
else
open c(v_id);
loop
fetch c into r_c;
exit when c%notfound;
DBMS_OUTPUT.PUT_LINE('Id-ul calatoriei: '||r_c.id_calatorie||' calatoria are o durata de '||r_c.durata_calatorie||' si se percepe un pret al biletului de: ' ||r_c.pret_bilet);
end loop;
j:=c%rowcount;
if j>0 then
DBMS_OUTPUT.PUT_LINE(' Total calatorii pentru calatorul '||v_id||' :'||j);
else
raise nu_exista_calatoria;
end if;
close c;
end if;
EXCEPTION
WHEN nu_exista_calatoria THEN DBMS_OUTPUT.PUT_LINE('Nu exista calatoria pentru calatorul '||v_id);
WHEN nu_exista_calatorul THEN DBMS_OUTPUT.PUT_LINE('Nu exista calatorul '||v_id);
END;
/
EXECUTE informatii_calatori;


--2 Sa se creeze o procedura prin care sa se modifice pretul biletului de calatorie.
--in cazul in care nu are loc nicio modificare atunci se va invoca o exceptie ce va fi tratata corespunzator.
--in cazul in care apare o alta eroare, atunci se va invoca o exceptie ce va fi tratata corespunzator.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE modificare_pret_bilet(v_proc IN number, v_nr IN number)
AS
nicio_modificare exception;

BEGIN
update CALATORIE
SET PRET_BILET = PRET_BILET + PRET_BILET*v_proc/100
WHERE id_client IN(SELECT id_client from clienti GROUP BY id_client HAVING COUNT(id_client)=v_nr);
IF SQL%NOTFOUND THEN
RAISE nicio_modificare;
ELSE
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
END IF;


EXCEPTION
WHEN nicio_modificare THEN DBMS_OUTPUT.PUT_LINE('Nu s-au efectuat modificari!!!');
WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLCODE||' ' ||SQLERRM);
END;
/
--apelul procedurii
EXECUTE modificare_pret_bilet(110, 117);



--FUNCTII
--1 Sa se creeze o functie prin care sa se calculeze impozitul in functie de pretul biletului de calatorie.
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Functie_Impozit(v_pret_bilet calatorie.pret_bilet%type)
return number
IS
e_ex exception;
begin
case when v_pret_bilet < 0 then
raise e_ex;
when v_pret_bilet < 200 then
return v_pret_bilet*0.16;
when v_pret_bilet between 500 and 300 then
return v_pret_bilet*0.18;
when v_pret_bilet between 700 and 600 then
return v_pret_bilet*0.2;
else return v_pret_bilet*0.25;
end case;
exception
when e_ex then
dbms_output.put_line('Pretul biletului nu poate fi negativ');
return null;
end;
/
begin
dbms_output.put_line(Functie_Impozit(650));
end;
/

--2 Sa se creeze o functie prin care sa se calculeze TVA-ul diferentiat in functie de modelul trenurilor.
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Functie_TVA(p_id number, p_val number, p_taxa1 number, p_taxa2 number, p_taxa3 number)
return number
is
v_model trenuri.model%TYPE;
begin
select model into v_model from trenuri where id_tren = p_id;
if v_model like '%TGV%' then return p_val*p_taxa1;
elsif v_model like '%InterRegio%' then return p_val*p_taxa2;
else return p_val*p_taxa3;
end if;
exception
when no_data_found then
return null;
end;
/
select avg(Functie_TVA(413, 5000, 0.19,0.15,0.05)) as medie_tva from dual;

begin
if Functie_TVA(413, 5000, 0.19,0.15,0.05) is null then
dbms_output.put_line('Trenul nu exista!');
else dbms_output.put_line(Functie_TVA(413, 5000, 0.19,0.15,0.05));
end if;
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Nu s-a aplicat TVA!!!');
WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLCODE||' ' ||SQLERRM);
end;
/


--3 Sa se implementeze o functie prin care sa se determine comisionul diferentiat pe care il incaseaza compania in functie de capacitatea trenurilor.
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION Functie_Comision(v_capacitate trenuri.capacitate%type)
return number
IS
e_ex exception;
begin
case when v_capacitate < 0 then
raise e_ex;
when v_capacitate < 200 then
return v_capacitate*0.25;
when v_capacitate between 300 and 200 then
return v_capacitate*0.30;
when v_capacitate between 400 and 300 then
return v_capacitate*0.35;
else return v_capacitate*0.45;
end case;
exception
when e_ex then
dbms_output.put_line('Capacitatea nu poate fi negativa');
return null;
end;
/
begin
dbms_output.put_line(Functie_Comision(89));
end;
/

--4 Sa se creeze o functie prin care sa se stabileasca taxa de intrare intr-un oras in functie de numele acestuia.
SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION TAXA_Intrare(p_id number, p_coeff_intrare number, p_taxa1 number, p_taxa2 number, p_taxa3 number)
return number
is
v_nume orase.nume_oras%TYPE;
begin
select nume_oras into v_nume from orase where id_oras = p_id;
if v_nume like '%Paris%' then return p_coeff_intrare*p_taxa1;
elsif v_nume like '%Ankara%' then return p_coeff_intrare*p_taxa2;
else return p_coeff_intrare*p_taxa3;
end if;
exception
when no_data_found then
return null;
end;
/
begin
if TAXA_Intrare(613, 2000, 0.29,0.45,0.04) is null then
dbms_output.put_line('Orasul nu exista!');
else dbms_output.put_line(TAXA_Intrare(613, 2000, 0.29,0.45,0.04));
end if;
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Nu s-a aplicat taxa de intrare!!');
WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLCODE||' ' ||SQLERRM);
end;
/


--Pachet de subprograme


-- Sa se construiasca un pachet care sa contina:
-- 1 O procedura cu 2 parametri de tip IN ce realizeaza modificari asupra capacitatii trenurilor.
-- 2 O procedura care primeste p_id si p_pretB ca parametrii de tip IN si p_code de tip OUT.
--Procedura verifica daca pretul biletului (p_pretB) calatoriei cu id-ul primit ca parametru (p_id) este cuprins intre 20 si 1000.
--Dac? pretul biletului este între limitele permise se actualizeaza pretul calatoriei ?i se returneaz? p_code:=1.
--Daca pretul biletului este in afara limitelor, se va declasa o exceptie p_code =0.
--3 O functie ce primeste doi parametri, numele clientului si id-ul calatoriei si returneaza codul postal al clientului.
--4 O functie ce primeste ca parametru data si returneaza numarul de luni de cand a avut loc calatoria cu aceasta data si pana in prezent - functia f_luni_calatorie
-- sa se afiseze, folosind un cursor, data plecarii si numarul de luni de cand a avut loc o anumita calatorie.
--5 O functie check_capacitate ce returneaz? 1 sau 0 daca trenul are capacitatea mai mare/mai mica sau egala fata de --capacitatea medie si NULL daca trenul nu exista
--specificatia pachetului


create or replace package pachet_calatorii
is
procedure modif_capacitate(p_id_tren IN trenuri.id_tren%type, procent IN number default 10, p_errcode out number);
procedure verifica_PretBilet(p_pretB calatorie.pret_bilet%type, p_id calatorie.id_calatorie%type, p_code OUT number);
function caut_client(p_nume clienti.nume%type, p_id_calatorie calatorie.id_calatorie%type) return clienti.cod_postal%type;
function f_luni_calatorie (p_data calatorie.data%type) return number;
function check_capacitate(p_id_tren IN trenuri.id_tren%type, p_capacitate_medie IN number) RETURN Boolean;
exc exception;
exc1 exception;
PretB_out_of_limits exception;
end;
/
--corpul pachetului
create or replace package body pachet_calatorii
is
PROCEDURE modif_capacitate(p_id_tren IN trenuri.id_tren%type,procent IN number default 10,p_errcode out number)
IS
exc exception;
exc1 exception;
BEGIN
if capacitate not between -40 and 40 then
raise exc1;
else
Update trenuri
Set capacitate=capacitate*(1+procent/100)
Where id_tren=p_id_tren;
end if;
if sql%rowcount = 0 then
raise exc;
end if;
exception when exc then
p_errcode:=1;
when exc1 then
p_errcode:=2;
END modif_capacitate;
procedure verifica_PretBilet(p_pretB calatorie.pret_bilet%type, p_id calatorie.id_calatorie%type, p_code OUT number)
is
PretB_out_of_limits exception;
pragma EXCEPTION_INIT (PretB_out_of_limits, -20200);
Begin
--verificam daca pretul biletului se incadreaza in limitele precizate
if p_pretB between 20 and 1000 then
update Calatorie
set pret_bilet = p_pretB
where id_calatorie = p_id;
if sql%found then
p_code:=1;
end if;
else
--declansam exceptia
raise_application_error(-20200, 'Pretul biletului de calatorie se afla in afara limitelor!');
end if;
exception
when PretB_out_of_limits then
p_code:=0;
when no_data_found then
p_code:=-1;
end verifica_PretBilet;
function caut_client(p_nume clienti.nume%type, p_id_calatorie calatorie.id_calatorie%type) return clienti.cod_postal%type
is
v_codP clienti.cod_postal%type;
begin
select cod_postal into v_codP from clienti where nume = p_nume and id_calatorie = p_id_calatorie;
return v_codP;
exception
when no_data_found or too_many_rows then
return null;
end caut_client;
function f_luni_calatorie(p_data calatorie.data_plecare%type) return number
is 
begin
return round(months_between(sysdate, p_data),0);
end f_luni_calatorie;
function check_capacitate(p_id_tren IN trenuri.id_tren%type, p_capacitate_medie IN number) RETURN Boolean
IS
v_capacitate trenuri.capacitate%type;
BEGIN
SELECT capacitate into v_capacitate from trenuri where id_tren = p_id_tren;
IF v_capacitate > p_capacitate_medie then
return true;
ELSE
return false;
end if;
EXCEPTION
WHEN no_data_found THEN
return NULL;
end check_capacitate;
END;
/
--apelul pachetului
select * from calatorie;
set serveroutput on
declare
v_codP number;
begin
--apelul procedurii modif_capacitate
declare
v_capacitate number(4);
v_Cap number(6);
v_nr number(1);
begin
select capacitate into v_Cap from trenuri where id_tren = 412;
modif_capacitate(412,210,v_nr);
select capacitate into v_capacitate from trenuri where id_tren = 418;
if v_nr=1 then
DBMS_OUTPUT.PUT_LINE('Trenul nu exista!!!');
elsif v_nr=2 then
DBMS_OUTPUT.PUT_LINE('procentul este in afara marjelor -40...40!!!');
else
DBMS_OUTPUT.PUT_LINE('Capacitatea initiala '|| v_Cap ||', capacitatea modificata '||v_capacitate);
end if;
end;
end;
/
SELECT* FROM TRENURI where id_tren = 413;
rollback;
update trenuri set capacitate = 500 where id_tren = 413;
--apelul procedurii verifica_PretBilet
--Pentru calatoria cu ID-ul 805:
select * from calatorie where id_calatorie = 805;

set serveroutput on
declare
v_code number;
begin
verifica_PretBilet(790, 814,v_code);
dbms_output.put_line ('A fost actualizat '||v_code||' calatorie');
end;
/
--apel functie caut_client (nume, id_client)
v_codP:=pachet_calatorii.caut_client('&nume','&id_calatorie');
dbms_output.put_line('Clientul are codul postal: '||v_codP);
--apelul functiei f_luni_calatorie
declare
cursor c is select data_plecare, f_luni_calatorie(data_plecare) as nr_luni from calatorie;
begin
open c;
for r in c loop
dbms_output.put_line ('Calatoria cu id-ul:' ||r.id_calatorie||' a avut loc in urma cu '||r.nr_luni||' luni');
exit when c%notfound;
end loop;
close c;
end;
/
--apelul functiei check_capacitate
DECLARE
v_capacitate_medie number;
p_capacitate_medie number;
BEGIN
AVERAGE_CAPACITY(p_capacitate_medie);
IF (check_capacitate(410, v_capacitate_medie) IS NULL) then
dbms_output.put_line('Tren cu ID invalid!');
elsif (check_capacitate(411, v_capacitate_medie)) then
dbms_output.put_line('Trenul are capacitatea mai mare decat media!');
else
dbms_output.put_line('Trenul are capacitatea mai mica decat media!');
end if;
end;
/


--TRIGGERI (DECLANSATORI)

--trigger 1
--Sa se construiasca un trigger pe tabela CALATORIE care se va declansa cand noua valoare a pretului a unui bilet va depasi 1000;
--Daca noua valoare a pretului unui bilet este mai mare decat cea veche atunci pretul va creste cu 100;
--Daca noua valoare a pretului unui bilet este mai mare decat 1000, atunci aceasta va lua valoarea 1000.
create or replace trigger trig_pretBilet
before update of pret_bilet on calatorie
for each row
begin
if :new.pret_bilet>:old.pret_bilet+100 then
:new.pret_bilet:=:old.pret_bilet+100;
end if;
if :new.pret_bilet>1000 then
:new.pret_bilet:=1000;
end if;
end;
/

update calatorie
set pret_bilet = 2000
where id_calatorie=802;
select * from calatorie where id_calatorie = 802;

--trigger 2
-- Sa se creeze o tabela numita evenimente ce contine un camp 'tip' de tip char, un camp 'utilizator' de tip varchar2 si data locala
-- Sa se construiasca un trigger numit trig_Tren care sa se declanseze inainte de inserarea, actualizarea sau stergerea din tabela TRENURI prin care vom insera in tabela evenimente 3 inregistrari
create table evenimente
(tip char(9),
utilizator varchar2(50),
data TIMESTAMP WITH LOCAL TIME ZONE);
SET SERVEROUTPUT ON
create or replace trigger trig_Tren
before insert or update or delete on TRENURI
declare
v_tip evenimente.tip%type;
begin
if inserting then
v_tip:='I';
DBMS_OUTPUT.PUT_LINE('A avut loc inserarare!');
elsif updating then
v_tip:='U';
else
v_tip:='D';
end if;
insert into evenimente values(v_tip, user, sysdate);
end;
/
select * from Trenuri;
insert into Trenuri (id_tren, model) values (421, 'InterRegio 345678');
update trenuri
set model = 'Regio 129067'
where id_tren = 421;
delete from trenuri where id_tren=421;
select * from evenimente;


--trigger 3
--Sa se creeze un trigger care se declanseaza atunci cand utilizatorul incearca sa introduca un client neautorizat.
CREATE OR REPLACE TRIGGER client_neautorizat
BEFORE INSERT or UPDATE on CLIENTI
FOR EACH ROW
DECLARE
v_nume varchar2(20);
v_prenume varchar2(40);
BEGIN
select nume into v_nume from CLIENTI where nume=:new.nume;
select prenume into v_prenume from clienti where prenume = :new.prenume;
IF :new.nume ='Ion' and :new.prenume='Liviu' then
RAISE_APPLICATION_ERROR (-20202, 'Nu se poate inregistra acest client!');
end if;
END;
/
insert into CLIENTI values(121,111, 1600616758264, 'Ion', 'Liviu', 'MASCULIN', 'ion.liviu@gmail.com',
'0772.821.923', 'Romania', 'Timisoara', 'strada Carpati, nr. 26',387568);