/*
	DIAGNÓSTICO DE UN FALLO EN LA CONSOLA: PlayStation 2

	-- Artur Aubach Altes & Pablo Barrenechea Perea --
*/

    inicio :- deshacer,
    nl,nl,
    hipotesis(Hipotesis_confirmada),
    write('Por favor: '),
    write(Hipotesis_confirmada),
    nl,nl,nl,

    write('Quieres saber por que? '),
    read(Confirmacion_porque),
    nl,
    ((Confirmacion_porque == si ; Confirmacion_porque == s)-> (explicacion(Hipotesis_confirmada), nl,nl); nl),
    nl,
    write('Quieres realizar un consulta nueva?'),
    read(Confirmacion_consulta),
    ((Confirmacion_consulta == si ;
      Confirmacion_consulta == s) ->
                          (nl,nl,nl,
                          write(q_________________________________NUEVA_CONSULTA_________________________________p),
                          nl,
                          inicio) ;

                              deshacer).


/* Hipótesis por confirmar */

%1  La consola no se enciende
hipotesis(asegurese_de_que_los_cables_estan_correctamente_conectados_a_las_ranuras)   :- hipotesis_E_1, !.
hipotesis(intente_reparar_el_cable_o_compre_uno_nuevo)     :- hipotesis_E_2, !.
hipotesis(encienda_el_boton_de_alimentacion_principal)   :- hipotesis_E_3, !.
hipotesis(compre_otra_consola_o_intente_repararla_internamente) :- verifica(se_enciende_la_consola,no,no), !.


%2  Los controladores no funcionan
hipotesis(asegurese_de_que_los_cables_del_controlador_estan_correctamente_conectados_a_las_ranuras)   :- hipotesis_C_1, !.
hipotesis(intente_reparar_el_cable_del_controlador_o_compre_uno_nuevo)     :- hipotesis_C_2, !.
hipotesis(limpie_con_cautela_las_ranuras_utilizando_un_trapo_envuelto_en_la_punta_del_dedo_indice)   :- hipotesis_C_3, !.
hipotesis(compre_otra_consola_o_intente_repararla_internamente) :- verifica(funcionan_los_controladores,no,no), !.


%3  La bandeja del disco no se abre
hipotesis(compruebe_que_el_problema_estaria_solucionado)   :- hipotesis_S_1, !.
hipotesis(compruebe_que_el_problema_estaria_solucionado)     :- hipotesis_S_2, !.
hipotesis(compre_otra_consola_o_intente_repararla_internamente)   :- hipotesis_S_3, !.
hipotesis(fuera_del_dominio):- verifica(se_abre_la_bandeja_del_juego,no,no), !.


%4  Un disco de un juego no funciona
hipotesis(compre_un_disco_nuevo)  :- hipotesis_J_1_1, !.
hipotesis(coloque_un_trozo_de_una_pulgada_de_cinta_adhesiva_a_cada_lado_del_disco_muy_cerca_del_horificio_central) :- hipotesis_J_1_2_1, !.
hipotesis(compruebe_que_el_problema_estaria_solucionado)  :- hipotesis_J_1_2_2, !.
hipotesis(limpie_con_delicadeza_el_laser_optico_utilizando_alcohol) :- hipotesis_J_1_2_3, !.
hipotesis(limpie_con_cuidado_el_disco) :- hipotesis_J_2_1, !.
hipotesis(pruebe_a_arreglar_el_disco_con_un_kit_de_reparacion) :- hipotesis_J_2_2, !.





hipotesis(fuera_del_dominio).




%1  La consola no se enciende
hipotesis_E_1 :- (verifica(se_enciende_la_consola,no,no),
          verifica(estan_correctamente_conectados_todos_los_cables,si,no)).

hipotesis_E_2 :- (verifica(se_enciende_la_consola,no,no),
          verifica(algun_cable_esta_roto,si,no)).

hipotesis_E_3 :- verifica(se_enciende_la_consola,no,no),
          verifica(esta_encendido_el_boton_de_alimentacion_principal,no,no).


%2  Los controladores no funcionan
hipotesis_C_1 :- verifica(funcionan_los_controladores,no,no),
          verifica(estan_correctamente_conectados_todos_los_cables_de_los_controladores,no,no).

hipotesis_C_2 :- verifica(funcionan_los_controladores,no,no),
          verifica(el_cable_del_controlador_esta_roto,si,no).

hipotesis_C_3 :- verifica(funcionan_los_controladores,no,no),
          verifica(las_ranuras_estan_obstruidas,si,no).


%3  La bandeja del disco no se abre
hipotesis_S_1 :- verifica(se_abre_la_bandeja_del_juego,no,no),
          verifica(reiniciando_la_consola_se_abre_la_bandeja,si,no).

hipotesis_S_2 :- verifica(se_abre_la_bandeja_del_juego,no,no),
          verifica(moviendo_la_bandeja_con_el_dedo_se_abre,si,no).

hipotesis_S_3 :- verifica(se_abre_la_bandeja_del_juego,no,no),
          verifica(se_escucha_un_ruido_raro_si_le_quitas_la_tapa_a_la_consola,si,no).


%4  Un disco de un juego no funciona
hipotesis_J_1_1 :- verifica(funciona_el_disco_de_un_juego, no, si),
				verifica(esta_en_mal_estado_el_disco, no, si),
				verifica(funciona_con_otros_discos, si, si),
				verifica(siguen_algun_patron_los_discos,no, si).

hipotesis_J_1_2_1 :- verifica(funciona_el_disco_de_un_juego, no, si),
					verifica(esta_en_mal_estado_el_disco, no, si),
					verifica(funciona_con_otros_discos, si, si),		
					verifica(siguen_algun_patron_los_discos, si, si), 
					verifica(son_del_mismo_color_los_discos, si, si),
					verifica(son_de_color_azul_o_morado_los_discos, si, si).

hipotesis_J_1_2_2 :- verifica(funciona_el_disco_de_un_juego, no, si),
					verifica(esta_en_mal_estado_el_disco, no, si),
					verifica(funciona_con_otros_discos, si, si),
					verifica(siguen_algun_patron_los_discos,si, si), 
					verifica(son_del_mismo_color_los_discos, si, si),
					verifica(son_de_color_azul_o_morado_los_discos, no, si),
					verifica(funciona_despues_de_poner_un_disco_de_limpieza, si, si).

hipotesis_J_1_2_3 :-  verifica(funciona_el_disco_de_un_juego, no, si),
					verifica(esta_en_mal_estado_el_disco, no, si),
					verifica(funciona_con_otros_discos, si, si),
					verifica(siguen_algun_patron_los_discos,si, si), 
					verifica(son_del_mismo_color_los_discos, si, si),
					verifica(son_de_color_azul_o_morado_los_discos, no, si),
					verifica(funciona_despues_de_poner_un_disco_de_limpieza, no, si).

hipotesis_J_2_1 :- verifica(funciona_el_disco_de_un_juego, no, si),
				verifica(esta_en_mal_estado_el_disco, si, si),
				verifica(esta_sucio_el_disco, si, si).

hipotesis_J_2_2 :- verifica(funciona_el_disco_de_un_juego, no, si),
				verifica(esta_en_mal_estado_el_disco, si, si),
				verifica(esta_rayado_el_disco, si, si).



%	Confirmación de un hecho
verifica(Hecho, Confirmar_hecho, Doble_explicacion) :-
          ((Confirmar_hecho == no) ,
          (no(Hecho) ->
              true ;
              (si(Hecho)) ->
                  fail ;
                  pregunta(Hecho, Confirmar_hecho, Doble_explicacion))) ;

          ((Confirmar_hecho == si) ,
            (si(Hecho) ->
                true ;
                (no(Hecho) ->
                    fail ;
                    pregunta(Hecho,Confirmar_hecho, Doble_explicacion)))).



%	Preguntar al usuario
pregunta(Pregunta, Confirmar_hecho, Doble_explicacion) :-
  write(Pregunta),
  write('? '),
  read(Respuesta),
  nl,
  (( (Confirmar_hecho == si) ,
      ((Respuesta == si ; Respuesta == s)
        ->  (assert(si(Pregunta)), assert(explicacion_si(Pregunta))) ;
            
			(assert(no(Pregunta)),
                (Doble_explicacion == si -> 
					(assert(explicacion_no(Pregunta))); 
					
					fail)),
                fail)) ;

   ( (Confirmar_hecho == no) ,
      ((Respuesta == no ; Respuesta == n)
        ->  (assert(no(Pregunta)), assert(explicacion_no(Pregunta))) ;
            (assert(si(Pregunta)),
                (Doble_explicacion == si -> (assert(explicacion_si(Pregunta))); fail)),
                fail))).



%	EStructurar la explicacion
explicacion(Hipotesis_confirmada) :-
  write(Hipotesis_confirmada),
  write(', porque: '),
  Hipotesis_confirmada \= fuera_del_dominio
    -> (validar_porque(Llista), write(Llista));
    
	write('no existen suficientes bases en nuestro conocimiento del dominio como para diagnosticar su problema.').


validar_porque([Cabeza_lista|Cola_lista]) :- (si(Cabeza_lista),    
                                           explicacion_si(Cabeza_lista),
                                           expl_retract(Cabeza_lista),
                                           validar_porque(Cola_lista)) ;

                                           (no(Cabeza_lista_sin_no), 
                                           explicacion_no(Cabeza_lista_sin_no),
                                           expl_retract(Cabeza_lista_sin_no), atom_concat('no_',Cabeza_lista_sin_no,Cabeza_lista),
                                           validar_porque(Cola_lista)).
validar_porque([]).


expl_retract(Hecho) :- (retract(si(Hecho)),
                    retract(explicacion_si(Hecho)));
                  
				   (retract(no(Hecho)),
                    retract(explicacion_no(Hecho))).



%	Declaracion dinamica de todas aquellas funciones que vayamos a modificar durante el programa
:- dynamic si/1, no/1, explicacion_si/1, explicacion_no/1.



%	Deshacer todo aquello que haya podido quedar antes de iniciar y al acabar el programa
deshacer :- retract(si(_)), fail.
deshacer :- retract(no(_)), fail.
deshacer :- retract(explicacion_si(_)), fail.
deshacer :- retract(explicacion_no(_)), fail.
deshacer.