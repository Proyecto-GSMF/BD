CREATE TABLE EQUIPO(
IdEquipo		varchar(10)	not null		PRIMARY KEY,
NombreEquipo	varchar(50)	not null,
CantJugador		int		not null
);

CREATE TABLE JUGADOR(
IdJugador		varchar(10)	not null		PRIMARY KEY,
NombreJugador	varchar(50)	not null
);

CREATE TABLE DEPORTE(
IdDeporte		varchar(10)	not null		PRIMARY KEY,
NombreDeporte	varchar(50)	not null
);

CREATE TABLE EVENTO(
IdEvento		varchar(10)	not null		PRIMARY KEY,
NombreEvento	varchar(50)	not null,
FechaInicio		datetime	not null,
FechaFin		datetime	not null,
Lugar			varchar(20)	not null,	
Estado			varchar(20)	not null
);

CREATE TABLE ENCUENTRO(
IdEncuentro		varchar(10)	not null		PRIMARY KEY,
NombreEncuentro	varchar(50)	not null,
FechaHora		datetime	not null,
Arbitro			varchar(30)	not null,	
Estado			varchar(20)	not null
);

CREATE TABLE INCIDENCIA(
IdIncidencia		varchar(10)	not null		PRIMARY KEY,
NombreIncidencia	varchar(50)	not null,
Tiempo		time		not null
);

CREATE TABLE RESULTADO(
IdResultado		varchar(10)	not null		PRIMARY KEY,
Tiempo		time		null,
Puntuacion		varchar(10)	null
);

CREATE TABLE USUARIO(
IdUsuario		int		not null		auto_increment	PRIMARY KEY,
Email		 	varchar(50)	not null,
NombreUsuario	varchar(50)	not null,
Contraseña	 	varchar(20)	not null,
Tipo		 	boolean	not null
);

CREATE TABLE COMPETICION(
IdCompeticion		varchar(10)	not null		PRIMARY KEY,
NombreCompeticion	varchar(50)	not null,
TipoCompeticion	varchar(40)	not null,
ImgCompeticion	varchar(200)	not null
);

CREATE TABLE PUBLICIDAD(
IdPublicidad		varchar(10)	not null		PRIMARY KEY,
NombrePublicidad	varchar(50)	not null,
Formato		varchar(10)	not null
);

CREATE TABLE SIGUE(
IdUsuario		int		not null	,
IdEvento		varchar(10)	not null,
Notificacion		boolean	not null,
PRIMARY KEY (IdUsuario, IdEvento),
CONSTRAINT FKIdUsuario FOREIGN KEY (IdUsuario) REFERENCES USUARIO (IdUsuario),
CONSTRAINT FKIdEvento FOREIGN KEY (IdEvento) REFERENCES EVENTO (IdEvento)
);

CREATE TABLE VE(
IdUsuario        int        not null,
IdPublicidad        varchar(10)    not null,
PRIMARY KEY (IdUsuario, IdPublicidad),
CONSTRAINT FKIdUsuario1 FOREIGN KEY (IdUsuario) REFERENCES USUARIO(IdUsuario),
CONSTRAINT FKIdPublicidad FOREIGN KEY (IdPublicidad) REFERENCES PUBLICIDAD(IdPublicidad)
); 

CREATE TABLE FORMA_PARTE_DE(
IdEvento		varchar(10)    not null,
IdCompeticion		varchar(10)    not null,
PRIMARY KEY (IdEvento, IdCompeticion),
CONSTRAINT FKIdEvento1 FOREIGN KEY (IdEvento) REFERENCES EVENTO (IdEvento),
CONSTRAINT FKIdCompeticion FOREIGN KEY (IdCompeticion) REFERENCES COMPETICION (IdCompeticion)
);

CREATE TABLE COMPONE(
IdEvento	varchar(10)	not null	,
IdEncuentro	varchar(10)	not null,
PRIMARY KEY (IdEvento, IdEncuentro),
CONSTRAINT FKIdEvento2 FOREIGN KEY (IdEvento) REFERENCES EVENTO (IdEvento),
CONSTRAINT FKIdEncuentro FOREIGN KEY (IdEncuentro) REFERENCES ENCUENTRO (IdEncuentro)
);

CREATE TABLE SUCEDE(
IdEncuentro        varchar(10)    not null,
IdIncidencia    varchar(10)    not null,
PRIMARY KEY (IdEncuentro, IdIncidencia),
CONSTRAINT FKIdEncuentro1 FOREIGN KEY (IdEncuentro) REFERENCES ENCUENTRO (IdEncuentro),
CONSTRAINT FKIncidencia FOREIGN KEY (IdIncidencia) REFERENCES INCIDENCIA(IdIncidencia)
);

CREATE TABLE TIENE(
IdEncuentro        varchar(10)    not null,
IdResultado        varchar(10)    not null,
PRIMARY KEY (IdEncuentro, IdResultado),
CONSTRAINT FKIdEncuentro2 FOREIGN KEY (IdEncuentro) REFERENCES ENCUENTRO (IdEncuentro),
CONSTRAINT FKIdResultado FOREIGN KEY (IdResultado) REFERENCES RESULTADO (IdResultado)
); 

CREATE TABLE PARTICIPA(
IdEncuentro	varchar(10)    not null,
IdJugador	varchar(10)    not null,
IdEquipo	varchar(10)	not null,
PRIMARY KEY (IdEncuentro, IdJugador, IdEquipo),
CONSTRAINT FKIdEncuentro3 FOREIGN KEY (IdEncuentro) REFERENCES ENCUENTRO (IdEncuentro),
CONSTRAINT FKIdJugador FOREIGN KEY (IdJugador) REFERENCES JUGADOR (IdJugador),
CONSTRAINT FKIdEquipo FOREIGN KEY (IdEquipo) REFERENCES EQUIPO(IdEquipo)
);

CREATE TABLE PERTENECE(
IdJugador		varchar(10)	not null,
IdEquipo		varchar(10)	not null,
PRIMARY KEY (IdJugador, IdEquipo),
CONSTRAINT FKIdJugador1 FOREIGN KEY (IdJugador) REFERENCES JUGADOR(IdJugador),
CONSTRAINT FKIdEquipo1 FOREIGN KEY (IdEquipo) REFERENCES EQUIPO(IdEquipo)
);

CREATE TABLE PRACTICA(
IdEquipo		varchar(10)	not null,
IdDeporte		varchar(10)	not null,
PRIMARY KEY (IdEquipo),
CONSTRAINT FKIdEquipo2 FOREIGN KEY (IdEquipo) REFERENCES EQUIPO(IdEquipo),
CONSTRAINT FKIdDeporte FOREIGN KEY (IdDeporte) REFERENCES DEPORTE(IdDeporte)
);

