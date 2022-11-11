PRS-EQUIPO (ATR, DMN, dom)
ATR = {IdEquipo, NombreEquipo, CantJugador}
DMN = {varchar}
dom = {IdEquipo -> varchar (10), NombreEquipo -> varchar(50), CantJugador->int}
RS-EQUIPO (PRS-EQUIPO, M, SC)
M = {“Guarda Equipo y cantidad de jugadores”}
SC = {IdEquipo -> PRIMARY KEY, NombreEquipo -> NOT NULL, CantJugador -> NOT NULL}

PRS-JUGADOR (ATR, DMN, dom)
ATR = {IdJugador, NombreJugador}
DMN = {varchar}
dom = {IdJugador -> varchar (10), NombreJugador -> varchar(50)}
RS-JUGADOR (PRS-JUGADOR, M, SC)
M = {“Guarda jugadores”}
SC = {IdJugador -> PRIMARY KEY, NombreJugador-> NOT NULL}

PRS-DEPORTE (ATR, DMN, dom)
ATR = {IdDeporte, NombreDeporte}
DMN = {varchar}
dom = {IdDeporte -> varchar (10), NombreDeporte -> varchar(50)}
RS-DEPORTE (PRS-DEPORTE, M, SC)
M = {“Guarda deportes”}
SC = {IdDeporte -> PRIMARY KEY, NombreDeporte-> NOT NULL}

PRS-ENCUENTRO (ATR, DMN, dom)
ATR = {IdEncuentro, NombreEncuentro, FechaHora, Arbitro, Estado}
DMN = {varchar}
dom = {IdEncuentro -> varchar (10), NombreEncuentro -> varchar (50), FechaHora -> datetime, Arbitro -> varchar (30), Estado -> varchar (20)}
RS-ENCUENTRO (PRS-ENCUENTRO, M, SC)
M = {“Guarda Encuentros”}
SC = {IdEncuentro -> PRIMARY KEY, NombreEncuentro -> NOT NULL, FechaHora -> NOT NULL, Arbitro -> NOT NULL, Estado -> NOT NULL}

PRS-EVENTO (ATR, DMN, dom)
ATR = {IdEvento, NombreEvento, Lugar, Estado, FechaInicio, FechaFin}
DMN = {varchar}
dom = {IdEvento -> varchar (10), NombreEvento-> varchar (50), Lugar -> varchar (20), Estado -> varchar (20), FechaInicio -> datetime, FechaFin -> datetime}
RS-EVENTO (PRS-EVENTO, M, SC)
M = {“Guarda Eventos”}
SC = {IdEvento -> PRIMARY KEY, NombreEvento -> NOT NULL, Lugar -> NOT NULL, Estado -> NOT NULL, FechaInicio -> NOT NULL, FechaFin -> NOT NULL}

PRS-RESULTADO (ATR, DMN, dom)
ATR = {IdResultado, Tiempo, Puntuacion}
DMN = {varchar, time}
dom = {IdResultado -> varchar (10), Tiempo -> (time), Puntuacion -> varchar (10)}
RS-RESULTADO (PRS-RESULTADO, M, SC)
M = {“Resultado de un partido”}
SC = {IdResultado -> PRIMARY KEY, Tiempo -> NOT NULL, Puntuacion -> NOT NULL}

PRS-INCIDENCIA (ATR, DMN, dom)
ATR = {IdIncidencia, NombreIncidencia, Tiempo}
DMN = {varchar}
dom = {IdIncidencia -> varchar (10), NombreIncidencia -> varchar (50), Tiempo -> (time)}
RS-INCIDENCIA (PRS-INCIDENCIA, M, SC)
M = {“Incidencia que sucede en un partido”}
SC = {IdIncidencia -> PRIMARY KEY, NombreIncidencia -> NOT NULL, Tiempo -> NOT NULL}

PRS-USUARIO (ATR, DMN, dom)
ATR = {IdUsuario, Email, NombreUsuario, Contraseña, Tipo}
DMN = {int, varchar, boolean}
dom = {IdUsuario -> int auto_increment, Email -> varchar (50), NombreUsuario -> varchar(50), Contraseña -> varchar (20), Tipo-> boolean}
RS-USUARIO (PRS-USUARIO, M, SC)
M = {“Registro de usuarios”}
SC = {IdUsuario -> PRIMARY KEY, Email -> NOT NULL, NombreUsuario -> NOT NULL, Contraseña -> NOT NULL, Tipo-> NOT NULL}

PRS-COMPETICION (ATR, DMN, dom)
ATR = {IdCompeticion, NombreCompeticion, TipoCompeticion, ImgCompeticion}
DMN = {varchar}
dom = {IdCompeticion -> varchar (10), NombreCompeticion-> varchar (50), TipoCompeticion -> varchar(40), ImgCompeticion -> varchar(200)}
RS-COMPETICION (PRS-COMPETICION, M, SC)
M = {“Guarda Competiciónes”}
SC = {IdCompeticion -> PRIMARY KEY, NombreCompeticion-> NOT NULL, TipoCompeticion -> NOT NULL}

PRS-PUBLICIDAD (ATR, DMN, dom)
ATR = {IdPublicidad, NombrePublicidad, Formato}
DMN = {varchar}
dom = {IdPublicidad -> varchar (10), NombrePublicidad-> varchar (50), Formato -> varchar(10)}
RS-PUBLICIDAD (PRS-PUBLICIDAD, M, SC)
M = {“Guarda Publicidades”}
SC = {IdPublicidad -> PRIMARY KEY, NombrePublicidad-> NOT NULL, Formato -> NOT NULL}

PRS-PRACTICA (ATR, DMN, dom)
ATR = {IdEquipo, IdDeporte}
DMN = {varchar}
dom = {IdEquipo -> varchar (10), IdDeporte -> varchar (10)}
RS-PRACTICA (PRS-PRACTICA, M, SC)
M = {“Equipo que practica deporte”}
SC = {IdEquipo -> PRIMARY KEY, IdDeporte -> PRIMARY KEY}

PRS-PARTICIPA (ATR, DMN, dom)
ATR = {IdJugador, IdEquipo, IdEncuentro}
DMN = {varchar}
dom = {IdJugador -> varchar(10), IdEquipo -> varchar (10), IdEncuentro -> varchar(10)}
RS-PARTICIPA (PRS-PARTICIPA, M, SC)
M = {“Jugador que pertenece a un equipo participa en un Encuentro”}
SC = {IdJugador -> PRIMARY KEY, IdEquipo -> PRIMARY KEY, IdEncuentro -> PRIMARY KEY}

PRS-COMPONE (ATR, DMN, dom)
ATR = {IdEncuentro, IdEvento}
DMN = {varchar}
dom = {IdEncuentro-> varchar (10), IdEvento -> varchar (10)}
RS-COMPONE (PRS-COMPONE, M, SC)
M = {“Un encuentro se compone de un evento”}
SC = {IdEncuentro -> PRIMARY KEY, IdEvento -> PRIMARY KEY}

PRS-SUCEDE (ATR, DMN, dom)
ATR = {IdEncuentro, IdIncidencia}
DMN = {varchar}
dom = {IdEncuentro -> varchar (10), IdIncidencia-> varchar (10)}
RS-SUCEDE (PRS-SUCEDE, M, SC)
M = {“En un encuentro suceden incidencias”}
SC = {IdEncuentro -> PRIMARY KEY, IdIncidencia-> PRIMARY KEY}

PRS-TIENE (ATR, DMN, dom)
ATR = {IdEncuentro, IdResultado}
DMN = {varchar}
dom = {IdEncuentro -> varchar (10), IdPartido -> varchar (10)}
RS-TIENE (PRS-TIENE, M, SC)
M = {“El encuentro tiene un resultado”}
SC = {IdEncuentro -> PRIMARY KEY, IdResultado-> PRIMARY KEY}

PRS-FORMA_PARTE_DE (ATR, DMN, dom)
ATR = {IdEvento, IdCompetición}
DMN = {varchar}
dom = {IdEvento -> varchar (10), IdCompetición -> varchar (10)}
RS-FORMA_PARTE_DE (PRS-FORMA_PARTE_DE, M, SC)
M = {“Evento forma parte de una competición”}
SC = {IdEvento -> PRIMARY KEY, IdCompetición-> PRIMARY KEY}

PRS-SIGUE (ATR, DMN, dom)
ATR = {IdUsuario, IdEvento}
DMN = {int, varchar}
dom = {IdUsuario -> int, IdEvento -> varchar (10)}
RS-SIGUE (PRS-SIGUE, M, SC)
M = {“Usuario sigue un evento”}
SC = {IdUsuario -> PRIMARY KEY, IdEvento -> PRIMARY KEY}

PRS-VE (ATR, DMN, dom)
ATR = {IdUsuario, IdPublicidad}
DMN = {int, varchar}
dom = {IdUsuario -> int, IdPublicidad -> varchar (10)}
RS-VE (PRS-SIGUE, M, SC)
M = {“Usuario ve publicidad”}
SC = {IdUsuario -> PRIMARY KEY, IdPublicidad -> PRIMARY KEY}

