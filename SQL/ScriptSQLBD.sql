create table cliente (id int primary key not null auto_increment, nome varchar(50) not null, cpf varchar(11) unique not null, nascimento date not null, email varchar(40), saldo int);

insert into cliente (nome, cpf,nascimento,email,saldo) values ("Rodrigo de freitas carvalho","12345678922", 2002-04-09, "rodrigo@hotmail.com", 300);

insert into cliente (nome, cpf,nascimento,email,saldo) values ("roberto de lima novaes","12465034912", 20010605, "roberto@hotmail.com", 600);


insert into cliente (nome, cpf,nascimento,email,saldo) values ("rita anita de silva","14354930449", 20000108, "ritaanita@hotmail.com", 30);


create table pagamento(id int primary key not null auto_increment, client_id int not null, metodo_pagamento varchar(50) not null, status varchar(40), valor int, foreign key (client_id) references cliente(id));


insert into pagamento (client_id,metodo_pagamento, status,valor) values (2,"pix", "aprovado", 600);


insert into pagamento (client_id,metodo_pagamento, status,valor) values (3,"boleto", "aprovado", 500);


insert into pagamento (client_id,metodo_pagamento, status,valor) values (2,"cartao", "reprovado", 400);

create table modalidades (id int primary key not null auto_increment, categoria varchar(30), categoria_id int);

insert into modalidades (categoria, categoria_id) values ("Jogos eletronicos", 1);

insert into modalidades (categoria, categoria_id) values ("futebol", 2);

insert into modalidades (categoria, categoria_id) values ("corrida", 3);

insert into modalidades (categoria, categoria_id) values ("luta", 4);


create table jogos_eletronicos (id int primary key not null auto_increment, campeonato varchar(30) not null, jogo varchar(50) not null,data date not null);


insert into jogos_eletronicos (campeonato, jogo, data)values ("VCT", "FURIA x LOUD", 20220817);

insert into jogos_eletronicos (campeonato, jogo, data)values ("VCT", "KLB x NAVI", 20220816);

insert into jogos_eletronicos (campeonato, jogo, data)values ("VCT", "KLB x LOUD", 20220816);

insert into jogos_eletronicos (campeonato, jogo, data)values ("pro league", "FURIA x NAVI", 20220816);

insert into jogos_eletronicos (campeonato, jogo, data)values ("pro league", "G2 x NAVI", 20220816);

insert into jogos_eletronicos (campeonato, jogo, data)values ("CBLOL", "RED x FURIA", 20220914);

insert into jogos_eletronicos (campeonato, jogo, data)values ("CBLOL", "KABUM x FURIA", 20220914);

insert into jogos_eletronicos (campeonato, jogo, data)values ("CBLOL", "KABUM x LOUD", 20220914);

create table aposta_lol (id int primary key not null auto_increment, apst_vitoria int, apst_mostkill int, apst_firstblood int, apst_map1 int, apst_map2 int, apst_knifekill int , apst_overtime int , id_je int not null , foreign key (id_je) references jogos_eletronicos(id));

insert into aposta_lol(id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (6,0,1,0,0,1,1,0);

insert into aposta_lol(id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (7,0,0,0,0,1,0,0);

insert into aposta_lol(id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (8,0,2,1,0,1,1,0);


create table aposta_cs (id int primary key not null auto_increment, apst_vitoria int, apst_mostkill int, apst_firstblood int, apst_map1 int, apst_map2 int, apst_knifekill int , apst_overtime int , id_je int not null , foreign key (id_je) references jogos_eletronicos(id));


insert into aposta_cs (id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (4,0,1,0,1,1,1,0);

insert into aposta_cs (id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (4,0,0,0,0,1,1,0);

insert into aposta_cs (id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (5,0,0,0,0,1,1,0);


create table aposta_vava (id int primary key not null auto_increment, apst_vitoria int, apst_mostkill int, apst_firstblood int, apst_map1 int, apst_map2 int, apst_knifekill int , apst_overtime int , id_je int not null , foreign key (id_je) references jogos_eletronicos(id));


insert into aposta_vava (id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (1,0,1,0,2,1,1,0);

insert into aposta_vava (id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (2,0,1,2,2,0,1,0);

insert into aposta_vava (id_je, apst_vitoria, apst_mostkill, apst_firstblood, apst_map1, apst_map2 ,apst_knifekill, apst_overtime)values (3,0,1,0,0,0,1,0);


create table futebol (id int primary key not null auto_increment, campeonato varchar(30) not null, jogo varchar(50) not null,data date not null);



insert into futebol (campeonato, jogo, data) values ("Libertadores", "atletico x flamengo", 20221102);



insert into futebol (campeonato, jogo, data) values ("brasileirao", "palmeiras x flamengo", 20221015);



insert into futebol (campeonato, jogo, data) values ("copa_do_brasil", "corinthians x flamengo", 20220930);



create table aposta_futebol (id int primary key not null auto_increment, id_futebol int not null,foreign key (id_futebol) references futebol(id), apst_vitoria int, apst_firstGoal int, apst_firsttempo int);


insert into aposta_futebol (id_futebol, apst_vitoria, apst_firstGoal, apst_firsttempo) values (1,2,2,0);

insert into aposta_futebol (id_futebol, apst_vitoria, apst_firstGoal, apst_firsttempo) values (2,1,0,0);

insert into aposta_futebol (id_futebol, apst_vitoria, apst_firstGoal, apst_firsttempo) values (3,0,2,0);


create table corrida (id int primary key not null auto_increment, campeonato varchar(30) not null, corrida varchar(50) not null,data date not null);

insert into corrida (campeonato, corrida, data) values ("f1", "interlagos", 20220930);

insert into corrida (campeonato, corrida, data) values ("f1", "interlagos", 20220930);

insert into corrida (campeonato, corrida, data) values ("f1", "interlagos", 20220930);



create table formula (id int primary key not null auto_increment, corrida_id int not null, foreign key (corrida_id) references corrida(id), apst_vitoria int);



insert into formula (corrida_id, apst_vitoria) values (2,15);



insert into formula (corrida_id, apst_vitoria) values (1,10);



insert into formula (corrida_id, apst_vitoria) values (2,05);



create table luta (id int primary key not null auto_increment, campeonato varchar(30) not null, luta varchar(50) not null,data date not null);



insert into luta(campeonato, luta, data) values ("UFC-2022", "peso_pesado", 20221130);



insert into luta(campeonato, luta, data) values ("UFC-2022", "peso_pesado", 20221130);



insert into luta(campeonato, luta, data) values ("UFC-2022", "peso_pena", 20221130);



create table ufc (id int primary key not null auto_increment, luta_id int not null, foreign key (luta_id) references luta(id), apst_vitoria int);



insert into ufc(luta_id, apst_vitoria) values (2,1);



insert into ufc(luta_id, apst_vitoria) values (2,2);



insert into ufc(luta_id, apst_vitoria) values (1,2);

create table aposta (id int primary key not null auto_increment, cliente_id int not null, aposta int not null, provisionado int not null, valor_aposta int not null, foreign key (aposta) references modalidades(id));

insert into aposta (cliente_id, aposta, provisionado, valor_aposta) values (1,2,10,10);

insert into aposta (cliente_id, aposta, provisionado, valor_aposta) values (1,3,8,8);

insert into aposta (cliente_id, aposta, provisionado, valor_aposta) values (1,4,25,25);

