-- create database db_fraquiaapp;

-- use db_fraquiaapp;

create table tb_Site(
	id int not null auto_increment primary key,
    titulo varchar(200) not null,
    subtitulo varchar(200) not null,
    slug varchar(200) not null,
    palavras_chaves varchar(200) not null,
    autor varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
    direitos varchar(600) not null,
    link varchar(600) not null,
    data timestamp not null
);

create table tb_sobre(
	id int not null auto_increment primary key,
    titulo varchar(200) not null,
    subtitulo varchar(200) not null,
    slug varchar(200) not null,
    palavras_chaves varchar(200) not null,
    autor varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
    direitos varchar(600) not null,
    link varchar(600) not null,
    data timestamp not null
);

create table tb_Banner(
	id int not null auto_increment primary key,
    titulo varchar(200) not null,
    subtitulo varchar(200) not null,
    slug varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
    link varchar(600) not null,
    embed longtext not null,
    data timestamp not null
);




create table tb_Servicos(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    texto longtext not null,
    imagem varchar(600) not null default 'FILE',
    data timestamp not null
);


create table tb_contato(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    texto longtext not null,
    imagem varchar(600) not null default 'FILE',
    data timestamp not null
);

create table tb_redesocial(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    texto longtext not null,
    imagem varchar(600) not null default 'FILE',
    data timestamp not null
);




create table tb_Tipo_Planos(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    valor decimal(10 ,2) not null,
    texto longtext not null,
    imagem varchar(600) not null default 'FILE',
    data timestamp not null
);

create table tb_Planos(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    valor decimal(10,2) not null,
	tb_Tipo_Planos int not null default 1,
    texto longtext not null,
    imagem varchar(600) not null default 'FILE',
    data timestamp not null
);


create table tb_Icone(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    icone varchar(200) not null ,
    data timestamp not null
);

create table tb_Menu(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
	tb_Icone int not null default 1,
    data timestamp not null
);


create table tb_Projetos(
	id int not null auto_increment primary key,
    titulo varchar(200) not null,
    subtitulo varchar(200) not null,
    slug varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
    link varchar(600) not null,
    embed longtext not null,
    data timestamp not null
);


create table tb_Empresa(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
    link varchar(600) not null,
    embed longtext not null,
    data timestamp not null
);


create table tb_App(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
   
    link varchar(600) not null,
    valor decimal(10,2) not null,
    desconto decimal(10,2) not null,
    data timestamp not null
);


create table tb_Categorias(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    data timestamp not null
);


create table tb_Tags(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    data timestamp not null
);


create table tb_Blogs(
	id int not null auto_increment primary key, 
	slug varchar(200) not null,
    subtitulo varchar(200) not null,
    texto longtext not null,
    imagem varchar(600) not null default 'FILE',
    tb_Categorias  int default 1,
    fonte varchar(200) not null,
    data timestamp not null
);

create table tb_Videos(
	id int not null auto_increment primary key,
    titulo varchar(200) not null,
	subtitulo varchar(200) not null,
	slug varchar(200) not null,
    texto longtext not null,
	link varchar(600) not null,
    data timestamp not null
);


create table tb_Duvidas(
	id int not null auto_increment primary key,
    titulo varchar(200) not null,
	slug varchar(200) not null,
    tb_Servicos int not null default 1,
    texto longtext not null,
    data timestamp not null
);

create table tb_Pais(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
	data timestamp not null
);

create table tb_Estado(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    tb_Pais int default 1,
	data timestamp not null
);

ALTER TABLE tb_Estado
ADD FOREIGN KEY (tb_Pais)
REFERENCES tb_Pais(id);

create table tb_Cidade(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    tb_Estado int default 1,
	data timestamp not null
);

ALTER TABLE tb_Cidade
ADD FOREIGN KEY (tb_Estado)
REFERENCES tb_Estado(id);

-- ----------------------------------------------------

create table tb_Clientes(
	id int not null auto_increment primary key,
    usuario varchar(200) not null default 'LOGIN',
	senha varchar(200) not null default 'SENHA',
	slug varchar(200) not null,
    apelido varchar(200) not null,
	email varchar(200) not null default 'EMAIL',
	imagem varchar(600) not null default 'FILE',
    cpf int(20) not null,

    tb_Pais int default 1,
    tb_Estado int default 1,
    tb_Cidade int default 1,
    
    codigo_postal int not null,
    logradouro varchar(200) not null,
    complemento varchar(200) not null,
    numero int not null,

    data timestamp not null
);


ALTER TABLE tb_Clientes
ADD FOREIGN KEY (tb_Pais)
REFERENCES tb_Pais(id);

ALTER TABLE tb_Clientes
ADD FOREIGN KEY (tb_Estado)
REFERENCES tb_Estado(id);

ALTER TABLE tb_Clientes
ADD FOREIGN KEY (tb_Cidade)
REFERENCES tb_Cidade(id);


create table tb_Permissao(
	id int not null auto_increment primary key,
    slug varchar(200) not null default 'LOGIN',
	senha varchar(200) not null default 'SENHA'
);


create table tb_Galeria_clientes(
    id int not null auto_increment primary key,
    slug varchar(200) not null,
    tb_Clientes int not null default 1,
    imagem varchar(600) not null default 'FILE',
	data timestamp not null
);

create table tb_Depoimentos(
	id int not null auto_increment primary key,
    id_cliente int not null default 10,
    descricao longtext not null,
    nota int not null,
    data timestamp not null
);

create table tb_Ddd(
	id int not null auto_increment primary key,
    slug varchar(200) default 1,
	data timestamp not null
);


create table tb_Telefone(
	id int not null auto_increment primary key,
    tb_Clientes varchar(200) default 10,
    tb_Ddd varchar(200) default 1,
	telefone varchar(200) not null,
    data timestamp not null
);
-- PAINEL

create table tb_Login(
	id int not null auto_increment primary key,
    usuario varchar(200) not null default 'LOGIN',
	senha varchar(200) not null default 'SENHA',
    email varchar(200) not null default 'EMAIL'
);

create table tb_Posicao(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    class varchar(200) not null ,
    idcss varchar(200) not null ,
    data timestamp not null
);

create table tb_Layout(
	id int not null auto_increment primary key,
    tabelas varchar(200) not null default 'tb',
    tb_Posicao int default 1,
    titulo varchar(200) not null,
    texto longtext not null,
    notificacao longtext not null,
	limite int not null,
    ordeby varchar(200) not null,
    fixo varchar(45) not null default 'RADIO',
    data timestamp not null
);


create table tb_Menu_painel(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    link varchar(200) not null,
    title varchar(200) not null,
    icone varchar(200) not null default 'FILE',
    data timestamp not null
);

create table tb_Submenu_painel(
	id int not null auto_increment primary key,
    tb_Menu_painel int default 1,
    slug varchar(200) not null,
    link varchar(200) not null,
    title varchar(200) not null,
    icone varchar(200) not null default 'FILE',
    data timestamp not null
);

-- fim de configuração 
 
create table tb_Links(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    data timestamp not null
);


create table tb_Links_dashboard(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    data timestamp not null
);


create table tb_Ads(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    imagem varchar(600) not null default 'FILE',
    texto longtext not null,
    data timestamp not null
);

create table tb_Suporte(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    imagem varchar(600) not null default 'FILE',
    texto longtext not null,
    data timestamp not null
);

create table tb_Funcionalidades(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    imagem varchar(600) not null default 'FILE',
    texto longtext not null,
    data timestamp not null
);

create table tb_Informacao_extras(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    imagem varchar(600) not null default 'FILE',
    texto longtext not null,
    data timestamp not null
);

create table tb_Regulamentos(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
	imagem varchar(600) not null default 'FILE',
    texto longtext not null,
    data timestamp not null
);


create table tb_Tutoriais(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
	imagem varchar(600) not null default 'FILE',
    texto longtext not null,
    data timestamp not null
);



create table tb_Info_formas_pagamento(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    imagem varchar(600) not null default 'FILE',
    data timestamp not null
);

create table tb_Paginas(
	id int not null auto_increment primary key,
    slug varchar(200) not null ,
    link varchar(200) not null ,
    imagem varchar(600) not null default 'FILE',
    texto longtext not null,
    data timestamp not null
);



create table tb_Contato(
	id int not null auto_increment primary key,
	titulo varchar(200) not null ,
    nome varchar(200) not null ,
    email varchar(200) not null ,
	telefone varchar(200) not null ,
	descricao longtext not null ,
    data timestamp not null
);


-- DASHBOARD CLIENTE




create table tb_Dashboard(
	id int not null auto_increment primary key,
    titulo varchar(200) not null,
    subtitulo varchar(200) not null,
    slug varchar(200) not null,
    palavras_chaves varchar(200) not null,
    autor varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
    direitos varchar(600) not null,
    link varchar(600) not null,
    data timestamp not null
);



create table tb_Menu_dashboard(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    link varchar(200) not null,
    title varchar(200) not null,
    link_icone varchar(200) not null default 'FILE',
    data timestamp not null
);


--  REGRA DE NEGOCIO APPS


create table tb_Status(
	id int not null auto_increment primary key,
	slug varchar(200) not null,
    data timestamp not null
);

create table tb_Formas_envios(
	id int   not null auto_increment primary key,
	slug varchar(200) not null,
    descricao varchar(200) not null,
    valor decimal(10,2) not null,
    data timestamp not null
);

create table tb_Carrinho(
	id int   not null auto_increment primary key,
    slug varchar(200) not null,
    imagem varchar(200) not null,
	quantidade int null,
    valor decimal(10,2) not null,
    sub_total decimal(10,2) not null,
    data timestamp not null
);

create table tb_Itens_ordens(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    imagem varchar(200) not null,
	quantidade int null,
    valor decimal(10,2) not null,
    sub_total decimal(10,2) not null,
    referencia varchar(200) null default 'pagseguro_referencia',
    data timestamp not null
);


create table tb_Ordens(
	id int not null auto_increment primary key,
    tb_Formas_envios int null default 1,
    tb_Clientes int null default 10,
    referencia varchar(200) null default 'pagseguro_referencia',
    codigo_transacao  varchar(200) null default 'pagseguro_codigo',
    tb_Status  varchar(200) null default 'pagseguro_status',
    data timestamp not null
);



-- PRODUTOS GRAFICOS 


create table tb_Categorias_graficas(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    data timestamp not null
);



create table tb_Produtos_grafica(
	id int not null auto_increment primary key,
    slug varchar(200) not null,
    descricao longtext not null,
    imagem varchar(600) not null default 'FILE',
	gabarito varchar(600) not null default 'FILE',
    embed longtext not null,
    valor decimal(10,2) not null,
    desconto decimal(10,2) not null,
    tb_Categorias_graficas int not null default 1,
    gabarito varchar(600) not null default 'FILE',
    data timestamp not null
);


create table tb_Producao_grafica(
	id int not null auto_increment primary key,
    tb_Clientes int null default 10,
    tb_Produtos_grafica int not null default 10,
	tb_Tamanho_arte int not null default 1,
    tb_Tipo_papel int not null default 1,
    tb_Tipo_impressao int not null default 1,
    tb_Tipo_acabamento int not null default 1,
    tb_Quantidade int not null default 1,
	descricao longtext not null,
    arquivo varchar(600) not null default 'FILE',
    data timestamp not null
);


 create table tb_Tamanho_arte(
	id int not null auto_increment primary key,
	slug varchar(200) not null,
	tb_Produtos_grafica int not null default 1,
    data timestamp not null
);

create table tb_Tipo_papel(
	id int not null auto_increment primary key,
	slug varchar(200) not null,
    tb_Produtos_grafica int not null default 1,
    data timestamp not null
);

create table tb_Tipo_impressao(
	id int not null auto_increment primary key,
	slug varchar(200) not null,
	tb_Produtos_grafica int not null default 1,
    data timestamp not null
);

create table tb_Tipo_acabamento(
	id int not null auto_increment primary key,
	slug varchar(200) not null,
    tb_Produtos_grafica int not null default 1,
    data timestamp not null
);

create table tb_Quantidade(
	id int not null auto_increment primary key,
	slug int not null,
    tb_Produtos_grafica int not null default 1,
    data timestamp not null
);



--  REGRA DE NEGOCIO PRODUTOS GRAFICOS


create table tb_Formas_recebimento(
	id int   not null auto_increment primary key,
	slug varchar(200) not null,
    texto longtext not null,
    valor decimal(10,2) not null,
    tb_Estado int not null default 1,
    data timestamp not null
);

create table tb_Ordens_graficas(
	id int   not null auto_increment primary key,
    tb_Clientes int null default 10,
    tb_Produtos_grafica int not null default 10,
	tb_Tamanho_arte int not null default 10,
    tb_Tipo_papel int not null default 10,
    tb_Tipo_impressao int not null default 10,
    tb_Tipo_acabamento int not null default 10,
    tb_Quantidade int not null default 10,
	valor decimal(10,2) not null,
    sub_total decimal(10,2) not null,
	descricao longtext not null,
    arquivo varchar(600) not null,
    tb_Formas_recebimento int null default 10,
	referencia varchar(200) null default 'pagseguro_referencia',
    codigo_transacao  varchar(200) null default 'pagseguro_codigo',
    tb_Status  varchar(200) null default 'pagseguro_status',
    data timestamp not null
);


create table tb_Finalizar(
	id int   not null auto_increment primary key,
    tb_Clientes int null default 10,
    code_pagseguro varchar(200) null default 10,
    xml varchar(200) not null default 10,
    data timestamp not null
);


create table tb_Login_produtos_graficos(
	id int not null auto_increment primary key,
    tb_Clientes int null default 1,
    usuario varchar(200) not null default 'LOGIN',
	senha varchar(200) not null default 'SENHA',
    email varchar(200) not null default 'EMAIL',
	logo varchar(200) not null default 'FILE'
);




