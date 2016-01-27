-- Criação de Tabelas 

create table tb_funcionario(
  codFuncionario  number not null, -- modificacao DER
  nome            varchar2(80) not null,
  cpf             varchar2(11) not null, -- modificacao DER
  rg              varchar2(15) not null,
  sexo            varchar2(10) not null,
  estadoCivil     varchar2(10),
  endereco        varchar2(120) not null,
  celular         varchar2(15) not null,
  dataNascimento  date not null,
  cargo           varchar2(30) not null,
  statusAtivacao  char(1) not null, -- modificacao DER
  salario         number(*,2) not null, -- modificacao DER
  observacao      varchar2(1000),
  horarioEntrada  varchar2(6) not null, -- modificacao DER
  horarioSaida    varchar2(6) not null, -- modificacao DER
  primary key (codFuncionario)
);
  
create table tb_uniformes(
  codUniforme     number not null, -- modificacao DER
  codFuncionario  number not null, -- modificacao DER
  nome            varchar2(50) not null,
  descricao       varchar2(100),
  tamanho         varchar2(3),
  quantidade      number not null, -- modificacao DER
  valor           number(*,2) not null, -- modificacao DER
  primary key(codUniforme)
);

create table tb_usuario(
  codUser        number not null, -- modificacao DER
  codFuncionario number not null, -- modificacao DER
  login          varchar2(30),
  senha          varchar2(20),
  permissao      char(1) not null, -- modificacao DER
  primary key(codUser)
);

create table tb_almoxarifado(
  codProduto    number not null, -- modificacao DER
  nome          varchar2(50) not null,
  descricao     varchar(100),
  quantidade    number not null, -- modificacao DER
  primary key(codProduto)
);

create table tb_locacao(
  codLocacao      number not null, -- modificacao DER
  nomeLocador     varchar2(80) not null,
  quadra          varchar2(30) not null,
  valor           number(*,2) not null, -- modificacao DER
  dataLocacao     date not null,
  inicioLocacao   varchar2(6) not null, -- modificacao DER
  terminoLocacao  varchar2(6) not null, -- modificacao DER
  primary key(codLocacao)
);

create table tb_aluno(
  numeroMatricula 	number not null, -- modificacao DER
  codTurma 		number not null, -- modificacao DER
  nome            	varchar2(80) not null,
  rg              	varchar2(15) not null,  
  cpf             	varchar2(11) not null, -- modificacao DER
  dataNascimento  	date not null,
  endereco        	varchar2(120) not null,
  bairro 		  	varchar2(50) not null,
  cidade 		  	varchar2(30),
  telefone        	varchar2(15),
  celular         	varchar2(15),
  email 		  	varchar2(40),
  escola 		  	varchar2(40) not null,
  nomeMae 		  	varchar2(80) not null,
  nomePai 		  	varchar2(80),
  nomeResponsavel 	varchar2(80),
  convenioMedico  	varchar2(20),
  observacoes 	  	varchar2(1000),
  mensalidade 	  	number(*,2) not null, -- modificacao DER
  statusMensalidade	char(1) not null, -- modificacao DER
  statusTransporte  	char(1) not null, -- modificacao DER
  primary key(numeroMatricula)
);

create table tb_turma(
  codTurma 		number not null, -- modificacao DER
  codProfessor 		number not null, -- modificacao DER
  horario 			varchar2(6) not null, -- modificacao DER
  transporte 		char(1) not null, -- modificacao DER
  statusAtivacao 	char(1) not null, -- modificacao DER
  observacao 		varchar2(1000),
  primary key(codTurma)
);

create table tb_carteirinha(
  codBarras 		number not null,
  numeroMatricula 	number not null,
  nome 			varchar2(80) not null,
  dataNascimento 	date not null,
  dataMatricula 		date not null,
  primary key(codBarras)
);

create table tb_professor(
  codProfessor 	  number not null, -- modificacao DER
  nome            varchar2(80) not null,
  rg              varchar2(15) not null,  
  cpf             varchar2(11) not null, -- modificacao DER
  endereco        varchar2(120) not null,
  telefone        varchar2(15) not null,  
  celular         varchar2(15) not null,  
  dataNascimento  date not null,  
  sexo            varchar2(10) not null,
  estadoCivil     varchar2(10),
  observacao      varchar2(1000),
  statusAtivacao  char(1) not null, -- modificacao DER
  salario         number(*,2) not null, -- modificacao DER
  horarioEntrada  varchar2(6) not null, -- modificacao DER
  horarioSaida    varchar2(6) not null, -- modificacao DER
  primary key(codProfessor)
);

  
-- Criação de Entidade de Chave Estrangeira

create table tb_almoxarifado_funcionario(
  codProduto      number not null, -- modificacao DER
  codFuncionario  number not null -- modificacao DER
);

create table tb_locacao_funcionario(
  codLocacao      number not null, -- modificacao DER
  codFuncionario  number not null -- modificacao DER
);

-- Declaração de FK

alter table tb_uniformes add (foreign key (codFuncionario) references tb_funcionario);

alter table tb_usuario add (foreign key (codFuncionario) references tb_funcionario);

alter table tb_almoxarifado_funcionario add (foreign key (codProduto) references tb_almoxarifado);
alter table tb_almoxarifado_funcionario add (foreign key (codFuncionario) references tb_funcionario);

alter table tb_locacao_funcionario add (foreign key (codLocacao) references tb_locacao);
alter table tb_locacao_funcionario add (foreign key (codFuncionario) references tb_funcionario);

alter table tb_aluno add (foreign key (codTurma) references tb_turma);

alter table tb_turma add (foreign key (codProfessor) references tb_professor);

alter table tb_carteirinha add (foreign key (numeroMatricula) references tb_aluno);


  