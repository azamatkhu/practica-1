- Ejecucion 25/09/2026:
	+ El juego ha sido exportado sin problemas y se ejecuta perfectamente.

- Ejecucion 09/10/2026:
	+ un jugador que se controla con teclas de acciones definidas
	+ Un objeto que se siempre gira en circulos

- Ejecucion 21/10/2026:
	+ Un boton funcionable
	+ Al pulsar boton, el jugador empieza a pulsar.

- Ejecucion 04/11/2026:
	+ Al cambiar el radio de interaction_radius por ejemplo al 10 y utilizando breakpoint,
	+ se puede observar que si jugador esta igual justo al target se queda todavia distancia
	+ y por eso no se activa la seccion completa de move_target(). Si lo corrijo a un radio de 45
	+ se funciona bien y move_target() con update_score() se activan sin problemas
	
	+ A mi mejor me va a servir utilizar vectores (vector2) para movimientos de jugadores o enemigos
	+ porque es mas flexible y facil de implementar y orientar. Encima, los nodos como CharacterBody2D
	+ y etc dependen mucho por vectores
