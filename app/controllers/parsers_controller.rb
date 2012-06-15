require 'xmlsimple'
class ParsersController < ApplicationController
  # GET /parsers
  # GET /parsers.json
  def index
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @parsers }
    end
  end

  # GET /parsers/1
  # GET /parsers/1.json
  def show
    @parser = Parser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @parser }
    end
  end

  # GET /parsers/new
  # GET /parsers/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @parser }
    end
  end

  # GET /parsers/1/edit
  def edit
    @parser = Parser.find(params[:id])
  end

  # POST /parsers
  # POST /parsers.json
  def create
    #Load file
    
    if  params[:xml_file].content_type =~  /xml/
      begin
        plain_string = XmlSimple.xml_in(params[:xml_file].read,{'ForceArray' => false, 'NoAttr' => true,'SuppressEmpty' => true })
        flash[:notice]="File parsed successfully."
      rescue
        flash[:notice]="Error in parsing file."
      end
      if plain_string["keyword"].kind_of?(Array) && !plain_string["keyword"].empty?
        plain_string["keyword"].each do|kwd|
          next if kwd.blank?
          # Language will be updated later after identifying keyword language
          Keyword.create({:keyword=>kwd,:language=>"english"})
        end
      end

      AsyncRequest.execute

    end
    respond_to do |format|
      format.html{render :action=>:new}
    end
  end

  # PUT /parsers/1
  # PUT /parsers/1.json
  def update
    @parser = Parser.find(params[:id])

    respond_to do |format|
      if @parser.update_attributes(params[:parser])
        format.html { redirect_to @parser, :notice => 'Parser was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @parser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parsers/1
  # DELETE /parsers/1.json
  def destroy
    @parser = Parser.find(params[:id])
    @parser.destroy

    respond_to do |format|
      format.html { redirect_to parsers_url }
      format.json { head :ok }
    end
  end

  def export
    respond_to do|format|
       format.xml{}
       format.html{}
       format.csv{}
    end
  end

end
