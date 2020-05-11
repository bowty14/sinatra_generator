#!/usr/bin/env ruby
require ('fileutils')

class Project 
  def initialize (project_name)
    @project_name = project_name
  end
  def project_gen 
    FileUtils.mkdir_p "../#{@project_name}/lib"
    FileUtils.mkdir_p "../#{@project_name}/views"
    FileUtils.mkdir_p "../#{@project_name}/spec"
    FileUtils.mkdir_p "../#{@project_name}/public" 
    FileUtils.touch "../#{@project_name}/app.rb"
    FileUtils.touch "../#{@project_name}/Gemfile"
    FileUtils.touch "../#{@project_name}/lib/#{@project_name}.rb"
    FileUtils.touch "../#{@project_name}/spec/#{@project_name}_spec.rb" 
    FileUtils.touch "../#{@project_name}/spec/#{@project_name}_integration_spec.rb" 
    FileUtils.touch "../#{@project_name}/views/layout.erb"
    File.open("../#{@project_name}/Gemfile", 'a') {|f| f.write(
      "source 'https://rubygems.org' " +
      "\n" + 
      "gem ('sinatra') " +
      "\n" +
      "gem ('pry') " +
      "\n"+
      "gem ('rspec') " +
      "\n" +
      "gem ('sinatra-contrib')" ) }
      File.open("../#{@project_name}/app.rb", 'a') {|f| f.write(
      "require('sinatra') " +
      "\n" +
      "require('sinatra/reloader') " +
      "\n" +
      "require('./lib/#{@project_name}.rb')" +
      "\n"+
      "also_reload('lib/**/*.rb') " ) }
      File.open("../#{@project_name}/script.rb", 'a') {|f| f.write("#!/usr/bin/env/ ruby" +
        "\n" +
        "require('./lib/#{@project_name}.rb')") }
    File.open("../#{@project_name}/lib/#{@project_name}.rb", 'a') {|f| f.write(
      "require ('pry')" + 
      "\n" + 
      "\n" +
      "class #{@project_name}" + 
      "\n" + 
      "end") }
    File.open("../#{@project_name}/spec/#{@project_name}_spec.rb", 'a') {|f| f.write("require ('#{@project_name}.rb')" +
      "\n" + 
      "require ('pry')" +
      "\n" +
      "require ('rspec')" +
      "\n" +
      "\n" +
      "describe('') do" +
      "\n " + " " +
          "it('') do" +
        "\n" + " " + " " + " " + 
            "blah = #{@project_name}.new('')" +
        "\n " + " " + " " + 
            "expect(blah()).to(eq('blah'))" +
          "\n " + " " + 
          "end" +
      "\n" +
    "end" ) }
File.open("../#{@project_name}/README.md", 'a') {|f| f.write(
  "##" + " " + "Project created on" + " " + "#{Time.now.month}/" + "#{Time.now.day}/" + "#{Time.now.year}" + 
  "\n" + 
  "\n" + 
  "# Project name" + 
  "\n" + 
  "\n" + 
  "#### By **Author(s)**" + 
  "\n" + 
  "\n" + 
  "## Description" + 
  "\n" + 
  "\n" + 
  "Tell your audience what your app does." + 
  "\n" + 
  "\n" + 
  "## Specifications" + 
  "\n" + 
  "\n" + 
  "|   Behavior Description       |  Input Ex.   |        Output Ex.        |" + "\n" + 
  "|------------------------------|--------------|--------------------------|" + "\n" + 
  "|1.                            |              |                          |" + "\n" +
  "|2.                            |              |                          |" + "\n" +
  "|3.                            |              |                          |" + "\n" +
  "|4.                            |              |                          |" + "\n" +
  "|5.                            |              |                          |" + "\n" +
  "|6.                            |              |                          |" + "\n" +
  "|7.                            |              |                          |" + "\n" +
  "|8.                            |              |                          |" + "\n" + "\n" + 
  "## Setup/Installation Requirements" + 
  "\n" + 
  "*" +
  "\n" + 
  "*" +
  "\n" +
  "*" +
  "\n" +
  "*" +
  "\n" + 
  "\n" +
  "## Known Bugs" +
  "\n" +
  "No known bugs at this time." +
  "\n" +
  "\n" +
  "## Support and contact details" +
  "\n" +
  "_Have a bug or an issue with this application? [Open a new issue](https://github.com/github-user-name/github-project-name/issues) here on GitHub.com_" +
  "\n" +
  "\n" +
  "## Technologies Used" +
  "\n" + 
  "*" + 
  "\n" +
  "*" + 
  "\n" +
  "*" + 
  "\n" +
  "*" + 
  "\n" + 
  "### License" + 
  "\n" + 
  "\n" + 
  "*This software is licensed under the MIT license* " + 
  "\n" + 
  "\n" + 
  "Copyright (c) 2020 **Author(s)**" )}
  end
end

puts "What would you like your Ruby file to be called?"
file_name = gets.chomp
project = Project.new(file_name)
puts (project.project_gen) 
