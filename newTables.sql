--Criar tabela "Mensalidades" com :
	--codMensalidade (int primary)
	--codAluno (int foreign key)
	--dataPagamento (date)
	--mesReferente  (varchar)


--Criar tabela "Presenca" com :
	--codPresenca  (int primary key)
	--codAluno     (int foreign key)
	--dataPresenca (date)

-- Criação das Tabelas
create table tb_mensalidades(
  codMensalidade number not null, -- modificacao DER
  numeroMatricula number not null, -- modificacao DER
  dataPagamento date not null,
  mesReferencia varchar2(3) not null,
  primary key(codMensalidade)
);

create table tb_presenca(
  codPresenca number not null,
  numeroMatricula number not null,
  dataPresenca date not null,
  primary key(codPresenca)
);

-- Declaração de FK
alter table tb_mensalidades add (foreign key (numeroMatricula) references tb_aluno);

alter table tb_presenca add (foreign key (numeroMatricula) references tb_aluno);

-- Criação de Sequências
create sequence sq_tb_mensalidades
increment by 1
start with 1
minvalue 1
maxvalue 999999999999999999999999999
nocycle
nocache

create sequence sq_tb_presenca
increment by 1
start with 1
minvalue 1
maxvalue 999999999999999999999999999
nocycle
nocache