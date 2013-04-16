class EmployeesController < ApplicationController
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @employees }
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @employee }
    end
  end

  # GET /employees/new
  # GET /employees/new.json
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @employee }
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @employee }
    end
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(params[:employee])
    @success = @employee.save
    respond_to do |format|
      if @success
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.js
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employees/1
  # PUT /employees/1.json
  def update
    @employee = Employee.find(params[:id])
    @success = @employee.update_attributes(params[:employee])
    respond_to do |format|
      if @success
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.js
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.js
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.js
      format.json { head :no_content }
    end
  end
end
