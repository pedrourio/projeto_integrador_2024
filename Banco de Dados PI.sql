CREATE USER User1 IDENTIFIED BY 'User1';
CREATE DATABASE Estudy;
GRANT ALL ON Estudy.* TO 'User1' @'%';
use Estudy;
drop table if exists `Usuario`;


create table Usuario(
  idUsuario int primary key auto_increment not null,
  Nome varchar(100),
  Sobrenome varchar(100),
  NomeUsuario varchar(50),
  Senha varchar(50),
  Tipo varchar(1),
  Email varchar(100),
  Telefone varchar(11)
);

create table Usuario_Seguidor(
  idUsuario_Seguidor int primary key auto_increment not null,
  
  idUsuario int not null,
  CONSTRAINT Usuario_idUsuario_fk FOREIGN KEY (idUsuario) references Usuario (idUsuario)
);

create table ObjetoDeEstudo(
  idObjetoDeEstudo int primary key auto_increment not null,
  Título varchar(50),
  Texto varchar(255),
  contagemAvaliacoes int,
  DataPosatada date,
  Horario time,
  MediaAvaliacoes double,

  idUsuario int not null,
  CONSTRAINT Usuario_idUsuario_fk FOREIGN KEY (idUsuario) references Usuario (idUsuario),
  
  idDisciplina int not null,
  CONSTRAINT Disciplina_idDisciplina_fk FOREIGN KEY (idDisciplina) references Disciplina (idDisciplina),
  
  idTopicoEspecifico int not null,
  CONSTRAINT TopicoEspecifico_idTopicoEspecifico_fk FOREIGN KEY (idTopicoEspecifico) references TopicoEspecifico (idTopicoEspecifico)
);

create table Arquivo(
  idArquivo int primary key auto_increment not null,
  Nome varchar(200),
  Tipo varchar(15),
  Tamanho double,
  _Arquivo blob,
  
  idObjetoDeEstudo int not null,
  CONSTRAINT ObjetoDeEstudo_idObjetoDeEstudo_fk FOREIGN KEY (idObjetoDeEstudo) references ObjetoDeEstudo (idObjetoDeEstudo)
);

create table Comentario(
  idComentario int primary key auto_increment not null,
  Texto varchar(50),
  Horario varchar(280),
  DataComentario int,
  
  idUsuario int not null,
  CONSTRAINT Usuario_idUsuario_fk FOREIGN KEY (idUsuario) references Usuario (idUsuario),
  
  idObjetoDeEstudo int not null,
  CONSTRAINT ObjetoDeEstudo_idObjetoDeEstudo_fk FOREIGN KEY (idObjetoDeEstudo) references ObjetoDeEstudo (idObjetoDeEstudo)
);

create table Avaliacao(
  idAvaliacao int primary key auto_increment not null,
  nota int,
  
  idUsuario int not null,
  CONSTRAINT Usuario_idUsuario_fk FOREIGN KEY (idUsuario) references Usuario (idUsuario),
  
  idObjetoDeEstudo int not null,
  CONSTRAINT ObjetoDeEstudo_idObjetoDeEstudo_fk FOREIGN KEY (idObjetoDeEstudo) references ObjetoDeEstudo (idObjetoDeEstudo)
);

create table Disciplina(
  idDisciplina int primary key auto_increment not null,
  nome varchar(20)
);

create table TopicoEspecifico(
  idTopicoEspecifico int primary key auto_increment not null,
  nome varchar(20)
);

create table TopicoEspecifico_Disciplina(
  idTopicoEspecifico_Disciplina int primary key auto_increment not null,

  idTopicoEspecifico int not null,
  CONSTRAINT TopicoEspecifico_idTopicoEspecifico_fk FOREIGN KEY (idTopicoEspecifico) references TopicoEspecifico (idTopicoEspecifico),

  idDisciplina int not null,
  CONSTRAINT Disciplina_idDisciplina_fk FOREIGN KEY (idDisciplina) references Disciplina (idDisciplina)
);

create table AreaDoConhecimento(
  idAreaDoConhecimento int primary key auto_increment not null,
  nome varchar(20)
);


create table Feed(
  idFeed int primary key auto_increment not null
);

create table ObjetoDeEstudo_Feed(
  idObjetoDeEstudo_Feed int primary key auto_increment not null,
  
  idObjetoDeEstudo int not null,
  CONSTRAINT ObjetoDeEstudo_idObjetoDeEstudo_fk FOREIGN KEY (idObjetoDeEstudo) references ObjetoDeEstudo (idObjetoDeEstudo),
  
  idFeed int not null,
  CONSTRAINT Feed_idFeed_fk FOREIGN KEY (idFeed) references Feed (idFeed)
); 

INSERT INTO usuario (Nome, Telefone) values ('Pedro Henrique', '54993239862');
select * FROM usuario;
select * FROM ObjetoDeEstudo;
drop table ObjetoDeEstudo;

drop table Arquivo;
