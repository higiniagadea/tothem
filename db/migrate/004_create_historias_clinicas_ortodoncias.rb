class CreateHistoriasClinicasOrtodoncias < ActiveRecord::Migration
  def self.up
    create_table "historias_clinicas_ortodoncias" do |t|
      t.column :paciente_id, :integer # Clave primaria

      # Historia Familiar
      t.column :nombre_apellido_padre, :string, :null => true
      t.column :ocupacion_padre, :string, :null => true
      t.column :nombre_apellido_madre, :string, :null => true
      t.column :ocupacion_madre, :string, :null => true
      t.column :cantidad_hermanos, :integer, :null => true
      t.column :nombres_edades_hermanos , :text, :null => true
      t.column :nombre_apellido_medico_familiar, :string, :null => true
      t.column :domicilio_medico, :string, :null => true
      t.column :vive_con, :string, :null => true # madre padre esposo solo otros
      t.column :nombre_conyuge, :string, :null => true

      #Historia médica
      t.column :tratamiento_medico, :boolean, :null => true
      t.column :tomando_medicamentos, :boolean, :null => true
      t.column :cual_medicamento, :string, :null => true
      t.column :atencion_medica_ultimos_dos_anios, :boolean, :null => true
      t.column :condicion, :string, :null => true
      t.column :peso, :string, :null => true
      t.column :altura, :string, :null => true
      t.column :trastorno_fisico, :boolean, :null => true
      t.column :cual_trastorno_fisico, :string, :null => true
      t.column :trastorno_psiquico, :boolean, :null => true
      t.column :cual_trastorno_psiquico, :string, :null => true
			t.column :fue_hospitalizado, :boolean, :null => true
			t.column :causa_hospitalizacion, :string, :null => true
			t.column :operado_amigdalas, :boolean, :null => true
			t.column :edad_operado_amigdalas, :integer, :null => true
			t.column :operado_adenoides, :boolean, :null => true
			t.column :edad_operado_adenoides, :integer, :null => true
			t.column :operado_apendice, :boolean, :null => true
			t.column :edad_operado_apendice, :integer, :null => true
			t.column :alergia_anestesia, :boolean, :null => true
      t.column :alergia_drogas_medicamentos, :boolean, :null => true
      t.column :desc_alergia_drogas_medicamentos, :string, :null => true
      t.column :asma_bronquial, :boolean, :null => true
      t.column :epilepsia, :boolean, :null => true
      t.column :ictericia, :boolean, :null => true
      t.column :perdida_peso, :boolean, :null => true
      t.column :fiebre_reumeatica, :boolean, :null => true
      t.column :enfermedades_sanguineas, :boolean, :null => true
      t.column :enfermedades_cardiacas, :boolean, :null => true
      t.column :diabetes, :boolean, :null => true
      t.column :problemas_endocrinos, :boolean, :null => true
      t.column :problemas_emocionales, :boolean, :null => true
      t.column :tuberculosis, :boolean, :null => true
      t.column :problemas_respiratorios, :boolean, :null => true
      t.column :problemas_gastrointestinales, :boolean, :null => true
      t.column :ulceras, :boolean, :null => true
      t.column :problemas_visuales, :boolean, :null => true
      t.column :glaucoma, :boolean, :null => true
      t.column :jaquecas, :boolean, :null => true
      t.column :desordenes_piel, :boolean, :null => true
      t.column :desordenes_tiroides, :boolean, :null => true
      t.column :sarampion, :boolean, :null => true
      t.column :trastornos_psicologicos, :boolean, :null => true
      t.column :parotiditis, :boolean, :null => true
      t.column :trastornos_auditivos, :boolean, :null => true
      t.column :varicela, :boolean, :null => true
      t.column :trastornos_oseos, :boolean, :null => true
      t.column :viruelas, :boolean, :null => true
      t.column :trastornos_renales, :boolean, :null => true
      t.column :escarlatina, :boolean, :null => true
      t.column :trastornos_hepaticos, :boolean, :null => true
      t.column :artritis, :boolean, :null => true
      t.column :artrosis, :boolean, :null => true
      t.column :hepatitis, :boolean, :null => true
      t.column :infecciones_bucales_frecuentes, :boolean, :null => true
      t.column :hemofilia, :boolean, :null => true
      t.column :enfermedades_transmision_sexual, :boolean, :null => true
      t.column :anemia, :boolean, :null => true
      t.column :herpes, :boolean, :null => true
      t.column :hiv, :boolean, :null => true
      t.column :homosexualidad, :boolean, :null => true
      t.column :transfusiones, :boolean, :null => true
      t.column :dialisis, :boolean, :null => true
      t.column :embarazo, :boolean, :null => true
      t.column :ganglios, :boolean, :null => true
      t.column :hipertension, :boolean, :null => true
      t.column :hipotension, :boolean, :null => true
      t.column :derrame_cerebral, :boolean, :null => true
      t.column :bronquitis_cronica, :boolean, :null => true
      t.column :fiebre, :boolean, :null => true
      t.column :sudoracion_fiebre_nocturna, :boolean, :null => true
      t.column :moretones_facilmente, :boolean, :null => true
      t.column :sangrado_excesivo_heridas, :boolean, :null => true
      t.column :vacuna_antihepatitis, :boolean, :null => true
      t.column :vacuna_antitetanica, :boolean, :null => true
      t.column :cuando_vacuna_antitetanica, :string, :null => true
      t.column :usado_usa_alcohol, :boolean, :null => true
      t.column :promedio_por_semana_en_litros, :string, :null => true
      t.column :usado_usa_drogas, :boolean, :null => true
      t.column :tipo_drogas_usadas, :string, :null => true
      t.column :cantidad_drogas_usadas, :string, :null => true
      t.column :usado_usa_tabaco, :boolean, :null => true
      t.column :tipo_tabaco_usado, :string, :null => true
      t.column :cantidad_tabaco_usado, :string, :null => true
      t.column :presion_arterial_promedio, :string, :null => true
      t.column :farmacos_consumidos_ultimos_anios, :text, :null => true
      t.column :otros, :text, :null => true
      t.column :observaciones, :text, :null => true
      



      # Historia bucodental
      t.column :fue_al_odontologo_anteriormente, :boolean, :null => true
      t.column :fecha_ultimo_control_odontologico, :string, :null => true #String po si no se acuerda exactamente
      t.column :razon_concurrencia, :string, :null => true
      t.column :dolor_ruido_articulaciones_maxilares, :boolean, :null => true
      t.column :dientes_traumatizados, :boolean, :null => true
      t.column :correccion_foniatrica, :boolean, :null => true
      t.column :succion_pulgar, :boolean, :null => true
      t.column :succion_pulgar_hasta_edad_de, :integer, :null => true
      t.column :rechinamiento_dentario, :boolean, :null => true
      t.column :cuando_rechinamiento_dentario, :string, :null => true
      t.column :succion_digital, :boolean, :null => true
      t.column :succion_digital_hasta_edad_de, :integer, :null => true
      t.column :empuje_lingual, :boolean, :null => true
      t.column :mordedura_succion_labio, :boolean, :null => true
      t.column :presion_labial, :boolean, :null => true
      t.column :respirador_bucal, :boolean, :null => true
      t.column :come_unas, :boolean, :null => true #Come las uñas
      t.column :uso_chupete, :boolean, :null => true
      t.column :uso_mamadera, :boolean, :null => true
      t.column :amamantamiento, :boolean, :null => true
      t.column :tiempo_amamantamiento, :string, :null => true
      t.column :dificultad_masticar, :boolean, :null => true
      t.column :dificultad_tragar, :boolean, :null => true
      t.column :dificultad_hablar, :boolean, :null => true
      t.column :estado_bucal_general, :string, :null => true #Bueno regular malo
      t.column :indice_caries, :string, :null => true #normal Bajo alto
      t.column :cierre_labial, :string, :null => true
      t.column :periodonto, :text, :null => true
      t.column :cepilla_dientes, :string, :null => true #si, no, a veces
      t.column :cepilla_dientes_cuando, :string, :null => true
      t.column :usa_hilo_dental, :boolean, :null => true
      t.column :indice_placa, :string, :null => true #Alto, medio, bajo
      t.column :tratamiento_fluor, :string, :null => true #si, no, no sabe
      t.column :topicaciones, :string, :null => true
      t.column :buches, :string, :null => true

      #Examen radiológico
      t.column :anomalias_forma, :boolean, :null => true
      t.column :perdida_osea_cresta_alveolar, :boolean, :null => true
      t.column :agenesias, :boolean, :null => true
      t.column :lesion_periapical, :boolean, :null => true
      t.column :supernumerarios, :boolean, :null => true
      t.column :lesion_intraradicular, :boolean, :null => true
      t.column :ectopicos, :boolean, :null => true
      t.column :fractura_coronaria, :boolean, :null => true
      t.column :retenidos, :boolean, :null => true
      t.column :fractura_radicular, :boolean, :null => true
      t.column :anquilosados, :boolean, :null => true
      t.column :reabsorcion_coronaria, :boolean, :null => true
      t.column :odontomas, :boolean, :null => true
      t.column :reabsorcion_radicular, :boolean, :null => true
      t.column :erupcion_retrasada, :boolean, :null => true
      t.column :erupcion_precoz, :boolean, :null => true
      t.column :exceso_obturacion, :boolean, :null => true
      t.column :caries_esmalte, :boolean, :null => true
      t.column :caries_dentina, :boolean, :null => true
      t.column :caries_cemento, :boolean, :null => true
      t.column :comentarios, :text, :null => true
      t.column :rx_panoramica, :text, :null => true
      t.column :rx_seriada, :text, :null => true
      t.column :teleradiografia_perfil, :text, :null => true
      t.column :rx_diagnostico_clinico, :text, :null => true
      
      
      #Historia ortodoncica
      t.column :consulta_ortodoncica_previa, :boolean, :null => true
      t.column :fecha_consulta_ortodoncica, :string, :null => true
      t.column :medico_consulta_ortodoncica, :string, :null => true
      t.column :interes_paciente_tratamiento_ortodoncico, :string, :null => true
      t.column :algun_familiar_tratamiento_ortodoncico_ortopedico, :boolean, :null => true
      t.column :otros_comentarios_ortodoncia, :text, :null => true

      #Examen bucal
      t.column :dientes_presentes_boca, :text, :null => true
      t.column :evaluacion_clinica, :text, :null => true

      #Articulacion temporo-mandibular
      t.column :limitacion, :boolean, :null => true
      t.column :desviacion, :boolean, :null => true
      t.column :hipermovilidad, :boolean, :null => true
      t.column :ruidos, :boolean, :null => true
      t.column :lateralidad, :boolean, :null => true
      t.column :hacia_derecha, :boolean, :null => true
      t.column :hacia_izquierda, :boolean, :null => true
      t.column :chasquido, :boolean, :null => true
      t.column :crepitacion, :boolean, :null => true
      t.column :dolor, :boolean, :null => true
      t.column :espontaneo, :boolean, :null => true
      t.column :localizado, :boolean, :null => true
      t.column :difuso, :boolean, :null => true
      t.column :durante_funcion, :boolean, :null => true
      t.column :palpacion_articular_lateral, :boolean, :null => true
      t.column :palpacion_articular_posterior, :boolean, :null => true
      t.column :radiografia_panoramica, :boolean, :null => true
      t.column :historial_traba_bloqueo_mandibular, :boolean, :null => true
      t.column :con_dolor, :boolean, :null => true
      t.column :con_ruido, :boolean, :null => true
      t.column :con_movimiento_limitado, :boolean, :null => true


      #Otros varios
      t.column :examen_tejidos_blandos, :text, :null => true
      t.column :examen_relaciones_dentarias, :text, :null => true
      t.column :ficha_tejidos_blandos_intraorales, :text, :null => true
      t.column :montaje_en_articulador, :text, :null => true
      t.column :diagnostico_ortodoncia, :text, :null => true
      t.column :tratamiento_objetivos_principales, :text, :null => true
      t.column :mecanica_arco_recto_propuesta_tratamiento, :text, :null => true
      t.column :tratamiento_primera_etapa, :text, :null => true
      t.column :tratamiento_segunda_etapa, :text, :null => true
      t.column :tratamiento_tercera_etapa, :text, :null => true
      
      
      
      
      
      t.column :leyenda_declaracion_jurada, :text, :null => true








      






    end
  end

  def self.down
    drop_table "historias_clinicas_ortodoncias"
  end
end
