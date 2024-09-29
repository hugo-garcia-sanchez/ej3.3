#include <mysql/mysql.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	MYSQL *puntero;
	MYSQL_RES *resultado;
	MYSQL_ROW row;
	puntero = mysql_init(NULL);
	puntero = mysql_real_connect(puntero, "localhost", "root", "mysql", "DDBB", 0, NULL, 0);
	
	char player[15];
	printf("Introduce jugador: \n");
	scanf("%14s", player);
	char query[256];
	snprintf(query, sizeof(query),
			 "SELECT Mesa.numJugadores FROM Usuario, Mesa, Relaciones "
			 "WHERE Usuario.nombre = '%s' AND "
			 "Usuario.idUsuario = Relaciones.PlayerID AND "
			 "Mesa.idMesa = Relaciones.MesaId;", player);
	
	
	if (mysql_query(puntero, query)) {
		fprintf(stderr, "Error en la consulta: %s\n", mysql_error(puntero));
		mysql_close(puntero);
		return EXIT_FAILURE;
	}
	resultado = mysql_store_result(puntero);
	while ((row = mysql_fetch_row(resultado))) { // Obtener cada fila de resultados
		printf("El numero de jugadores es '%s'.\n", row[0]);
	}
	return 0;
}
