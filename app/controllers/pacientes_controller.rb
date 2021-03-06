
class PacientesController < ApplicationController
 
  before_filter  :generar_submenus
  before_filter :login_required, :only => [:edit, :update]
  layout 'default'

#only => [:edit, :update solo para autenticas algunas acciones]

  def ver_saldo_pac    
      respond_to do |format|
      @ver_saldo =  SaldoPaciente.find_by_sql('select ver_saldo_pac(' + params[:periodo][:periodo_id].to_s + params[:paciente_id].to_s + ') as saldo '  )
      format.html {render :partial => 'ver_saldo', :layout => false}
    end
  end


  def new_tratamiento
    #params[:paciente][:consultorio_id] = session[:consultorio][:id]
    @paciente = Paciente.find(params[:paciente_id])    
    @tratamiento = Tratamiento.new
    @arancel = Arancel.find_by_prestacion_id(params[:arancel].to_i)
    respond_to do |format|
     format.html {render :partial=> 'tratamientos/new', :layout=> false}
     format.html {redirect_to edit_paciente_path(@paciente) + '#tratamientos'}
    end
  end



  def index
    @pagetitle = "Pacientes"
    consultorios = []
    current_usuario.consultorios.each {|x| consultorios << x.consultorio_id}
    @pacientes = Paciente.paginate :page=> params[:page], :per_page=> 15, :order => 'nombre ASC'   
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @pacientes }
    end
  end

  #busqueda de pacientes
  def search
   respond_to do |format|
      format.html
    end
  end

  #resultado de la busqueda de pacientes
  def result
    respond_to do |format|
      if params[:nro_documento].size <= 1
      #if params[:nro_documento].blank?  
      format.html{render :text => '<span style="color:red">Ingrese nro. de documento para realizar la b&uacute;squeda de pacientes </span>' }
   
      elsif
       #params[:nro_documento].size == 8
       format.html{render :partial=> 'result', :layout => false }
       @pacientes = Paciente.basic_search(params).paginate  :page=> params[:page], :per_page=> 10
      end 
    end
  end
   
 
 def show
  
    @paciente = Paciente.find(params[:id])    
    @imagenes = Imagen.find_all_by_paciente_id(@paciente)
    unless @paciente.archivo_id.blank?
     @archivo = Archivo.find(@paciente.archivo_id)
    end     
    respond_to do |format|
      format.html# {redirect_to edit_paciente_path(@paciente)}
      
    end
 end

  def show_imagen
   @imagen = Imagen.find(params[:id])
   respond_to do |format|
      format.html {redirect_to show_imagen_path(@imagen)}
    end
  end


  #imagen del paciente en la pestaña datos personales
  def changephoto
    @paciente = Paciente.find(params[:id])   
    unless @paciente.archivo_id.blank?
      @archivo_ant = Archivo.find(@paciente.archivo_id)
    end
    @archivo = Archivo.new
    respond_to do |format|
      format.html {render :layout => false}# changephoto.html.erb
  
    end
  end


  
  def new
    @paciente = Paciente.new   
    respond_to do |format|
      format.html
      format.xml  { render :xml => @paciente }
    end
  end

  
  def edit
    params[:paciente_id]
    @archivo = Archivo.new
    @paciente = Paciente.find_by_id(params[:id])
    @odontograma = Odontograma.find(:first, :conditions => ['paciente_id = ?', @paciente.id.to_s], :order => 'created_at desc', :include => 'dientes')
    #@odontogramas = Odontograma.paginate(:page => params[:page], :per_page => 5, :conditions => ['paciente_id = ?' , @paciente.id.to_s], :order => 'created_at desc', :include => 'dientes')
   # @odontogramas = Odontograma.paginate(:page => params[:page], :per_page => 1, :conditions => ['paciente_id = ?', @paciente.id.to_s,], :order => 'created_at desc', :include => 'dientes')
    @odonto = Odontograma.paginate(:page => params[:page], :per_page => 12, :conditions => ['paciente_id = ?', @paciente.id.to_s,], :order => 'created_at desc', :include => 'dientes')
    @imagenes = Imagen.find_all_by_paciente_id(@paciente.id)
    @tratamientos = Tratamiento.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['paciente_id = ?', @paciente.id.to_s], :order => 'fecha ASC')
    @trat = Tratamiento.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['paciente_id = ? and estado_tratamiento_id = ?',  @paciente.id.to_s  , 5 ], :order => 'fecha ASC')
    @pagos_pacientes = PagoPaciente.paginate(:page=> params[:page], :per_page=> 12, :conditions => ['paciente_id = ?', @paciente.id.to_s] , :order => 'fecha ASC')   
    #@profesionales = Profesional.paginate(:page => params[:page], :per_page => 10)
    #@prestaciones = Prestacion.find(:all)  
    @sald_pac = SaldoPaciente.find_by_sql('select ver_saldo_paciente(' + @paciente.id.to_s + ') as saldo ' )

    unless @paciente.archivo_id.blank?
      @archivo_ant = Archivo.find(@paciente.archivo_id)
    end
      respond_to do |format|
      unless @paciente.blank?
        unless @paciente.archivo_id.blank?
          @archivo = Archivo.find(@paciente.archivo_id)
        end

        if params[:paginacion]
            format.html   {redirect_to edit_paciente_path(@paciente, :page => params[:page]) + '#tratamientos'}
        else
            format.html unless @paciente.id.blank?
        end
      else
       format.html {redirect_to search_pacientes_path}
      end
    end
  end

  
  

#busqueda de titulares
  def search_titular
    @paciente = Paciente.find(params[:id])
    @titulares = Titular.new
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  #resultado de la busqueda de titulares
  def results_titular
    @paciente = Paciente.find(params[:id])
    @titulares = Titular.basic_search_in_pacientes(params[:titular])          
    #@titulares = Titular.find_all_by_obra_social_id(params[:obra_social].to_i)
    respond_to do |format|
      format.html {render :layout => false}

  end
  end
  
  def update_titular
    @paciente =  Paciente.find(params[:paciente_id])
    @titular =  Titular.find(params[:id])
    @paciente.update_attribute(:titular_id, @titular.id)
    respond_to do |format|
    format.html {redirect_to edit_paciente_path(@paciente) + '#obra_social'}
    end
  end 

  
  def new_titular
    @paciente = Paciente.find(params[:id])
    @titular = Titular.new
    respond_to do |format|    
      format.html {render :layout => false}
    end
  end

  def create_titular
    @paciente = Paciente.find(params[:id])
    @titular = Titular.new(params[:titular])    
    respond_to do |format|
      if @titular.save
      @paciente.update_attribute(:titular_id, @titular.id)
        flash[:notice] = 'Titular creado.'
        #format.html {render :partial=> 'pacientes/edit_obra_social', :layout => 'default'}
      format.html {redirect_to edit_paciente_path(@paciente) }
      else
        format.html { render :action => ""  }
      end
    end
  end

     
  def create
    #params[:paciente][:consultorio_id]= current_usuario.consultorios
    #params[:paciente][:usuario_id]= current_usuario.id
    @paciente = Paciente.new(params[:paciente])
    respond_to do |format|
      if @paciente.save
        flash[:notice] = 'Paciente Registrado.'
        format.html { redirect_to edit_paciente_path(@paciente)}
        #format.xml  { render :xml => @paciente, :status => :created, :location => @paciente }
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end
  

 
  def update
    @paciente = Paciente.find(params[:id])
    @imagenes = Imagen.find_all_by_paciente_id(@paciente)
    unless @paciente.archivo_id.blank?
      @archivo = Archivo.find(@paciente.archivo_id)
    end   
    respond_to do |format|
      if @paciente.update_attributes(params[:paciente])       
        flash[:notice] = 'Paciente actualizado'      
         format.html {redirect_to(edit_paciente_path(@paciente) + '#datos_personales') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @paciente.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @paciente = Paciente.find(params[:id])   
    respond_to do |format|
     if @paciente.destroy
      @paciente.tratamientos.destroy
      @paciente.imagenes.destroy
      @paciente.historia_clinica_general.destroy
      @paciente.historia_clinica_ortodoncia.destroy
      @paciente.odontogramas.destroy
      flash[:notice] = 'Paciente Eliminado.'
      format.html { redirect_to(search_pacientes_url) }
      format.xml  { head :ok }
     else       
     end
    end
  end
  
  def listado_historias_clinicas
   @paciente = Paciente.find(params[:id])
   @pagetitle = "Historias Clinicas de "+ @paciente.nombre
   respond_to do |format|
    format.html{ render :partial => 'listado_historias_clinicas', :layout => 'default' }
   end
  end

  def ver
    @paciente = Paciente.find(params[:id])
    @imagenes = Imagen.find_all_by_paciente_id(@paciente)
     unless @paciente.archivo_id.blank?
     @archivo = Archivo.find(@paciente.archivo_id)
     end
     respond_to do |format|
     format.html{ render  :partial => 'ver', :layout => false}
     end
  end

#imprime un reporte del paciente
  def imprimir
    @paciente = Paciente.find(params[:id])
    respond_to do |format|
      format.html {render :layout=> "print", :action => "reporte"}   #ccs :layout=>false
    end
  end


#valida dni duplicado
def verificar_matricula
  @paciente = Paciente.find(:first, :conditions => {:nro_documento => params[:paciente][:nro_documento]})
    respond_to do |format|
    format.json { render :json => !@paciente}
    end
end

#elimina el titular asignado al paciente
def elimina_tit
  @paciente = Paciente.find(params[:id])
  @paciente.update_attribute(:titular_id, nil)
   respond_to do |format|
      format.html {redirect_to(edit_paciente_path(@paciente) + '#obra_social') }
     
   end
end

def buscar_dni
  @paciente = Paciente.new
  respond_to do |format|
      format.html {render :layout => false}
  end
end


def result_dni
   respond_to do |format|
      if  params[:paciente][:nro_documento].blank?
      format.html {render :text => '<span style="color:red"> Ingrese un numero de documento para realizar la busqueda</span> ' }
      elsif
        @pacientes = Paciente.buscar(params[:paciente])
        format.html {render :layout => false, :partial=> 'result_dni'}
      end
    end
end

def asignar 
   @paciente = Paciente.find(params[:id])
    respond_to do |format|
      format.js
    end
end


def liquidar
  @paciente = Paciente.find(params[:id])
  @periodos = Periodo.find(:all)
    respond_to do |format|
    format.html{render :partial => 'liquidacion', :layout => 'default'}
    end
end

end
