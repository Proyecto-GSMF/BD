/*Consulta 1: Mostrar todos los encuentros de fútbol que se disputarán el día 17/12/2022 */
SELECT E.IdEncuentro, FechaHora
FROM ENCUENTRO E
JOIN PARTICIPA P2 ON E.IdEncuentro = P2.IdEncuentro
WHERE FechaHora >= '2022-12-17' AND P2.IdEquipo IN (
SELECT P3.IdEquipo
FROM PERTENECE P3
JOIN PRACTICA P4 ON P3.IdEquipo = P4.IdEquipo
WHERE P4.IdDeporte IN (
SELECT IdDeporte
FROM DEPORTE
WHERE NombreDeporte = 'Futbol'
)
GROUP BY P4.IdDeporte
)
GROUP BY IdEncuentro

/*Consulta 2: Mostrar los nombres de usuario de los usuarios premium */
SELECT NombreUsuario
FROM USUARIO
WHERE Tipo = 1

/*Consulta 3: Mostrar los nombres de usuario de aquellos que reciban notificaciones del equipo “Aguada” */
SELECT U.NombreUsuario
FROM SIGUE S
JOIN USUARIO U ON S.IdUsuario = U.IdUsuario
WHERE S.Notificacion = 1 AND S.IdEvento IN (
    SELECT E.IdEvento
    FROM EVENTO E
    JOIN COMPONE C ON C.IdEvento = E.IdEvento
    WHERE C.IdEncuentro IN (
        SELECT E2.IdEncuentro
        FROM ENCUENTRO E2
        JOIN PARTICIPA P ON P.IdEncuentro = E2.IdEncuentro
        WHERE IdEquipo = '3'
    )
)

/*Consulta 4: Listar los usuarios que pueden visualizar una publicidad dada */
SELECT NombreUsuario 
FROM USUARIO U
JOIN VE V ON U.IdUsuario = V.IdUsuario
WHERE V.IdUsuario IN (
SELECT V2.IdUsuario
FROM VE V2
JOIN PUBLICIDAD P ON V2.IdPublicidad = P.IdPublicidad
WHERE NombrePublicidad = 'Ropa Deportiva'
)
GROUP BY U.IdUsuario

/* Consulta 5: Mostrar la cantidad de torneos que sigue el sistema por cada deporte y se encuentran en competencia. */

/*Consulta 6: Mostrar las alineaciones de un encuentro dado */
SELECT *
FROM PERTENECE
WHERE IdEquipo IN (
    SELECT IdEquipo
    FROM PARTICIPA
    WHERE IdEncuentro IN (
        SELECT IdEncuentro
        FROM ENCUENTRO
        WHERE NombreEncuentro = 'Uruguay vs Argentina'
    )
)
order by CAST(IdJugador as UNSIGNED)

/*Consulta 7: Mostrar los máximos anotadores de cada equipo en un encuentro dado de basketball */
SELECT Puntuacion
FROM RESULTADO
WHERE IdResultado IN (
    SELECT IdResultado
    FROM TIENE
    WHERE IdEncuentro IN (
        SELECT IdEncuentro
        FROM ENCUENTRO
        WHERE NombreEncuentro = 'Aguada vs Malvin'
    )
)

/*Consulta 8: Listar los resultados de los últimos 5 encuentros de un equipo dado */
SELECT Puntuacion
FROM RESULTADO
WHERE IdResultado IN (
    SELECT IdResultado
    FROM TIENE
    WHERE IdEncuentro IN (
        SELECT IdEncuentro
        FROM ENCUENTRO
        WHERE IdEncuentro IN (
            SELECT IdEncuentro
            FROM PARTICIPA
            WHERE IdEquipo IN (
                SELECT IdEquipo
                FROM Equipo
                WHERE NombreEquipo = 'Uruguay'
            )
        )
        ORDER BY FechaHora DESC
    )
)
LIMIT 5

/*Consulta 9: Listar los equipos que participan actualmente del torneo “Copa Libertadores de América” */
SELECT NombreEquipo
FROM EQUIPO
WHERE IdEquipo IN (
    SELECT IdEquipo
    FROM PERTENECE
    WHERE IdEquipo IN (
        SELECT IdEquipo
        FROM PARTICIPA
        WHERE IdEncuentro IN (
            SELECT IdEncuentro
            FROM COMPONE
            WHERE IdEvento IN (
                SELECT IdEvento
                FROM FORMA_PARTE_DE
                WHERE IdCompeticion IN (
                    SELECT IdCompeticion
                    FROM COMPETICION
                    WHERE NombreCompeticion = 'Copa Libertadores de America'
                )
            )
        )
    )
)

/*Consulta 10: Mostrar los torneos de deportes individuales, qué deporte practica y cuántos deportistas tiene en competencia */
SELECT *
FROM COMPETICION
WHERE IdCompeticion IN (
    SELECT IdCompeticion
    FROM FORMA_PARTE_DE
    WHERE IdEvento IN (
        SELECT IdEvento
        FROM COMPONE
        WHERE IdEncuentro IN (
            SELECT IdEncuentro
            FROM PARTICIPA
            WHERE IdEquipo IN (
                SELECT IdEquipo
                FROM EQUIPO
                WHERE CantJugador = 1
            )
        )
    )
)


