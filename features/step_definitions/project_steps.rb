Given('There is a project') do
    @project = FactoryBot.create :project
    puts "Project Created: #{@project}"
  end
  
  Given('the project has students') do
  
    # Create multiple students associated with the project and add them to the array
    s1 = FactoryBot.create :student, project: @project
  
    # Print details of each student
    @project.students.each do |s|
      puts "Got Student #{s.inspect}"
    end
  end
  
  When('I visit the project page') do

    visit '/projects'
    puts "Reached project page"
    save_and_open_page

  end
  
  Then('I should see the project in the list') do
    expect(page).to have_content(@project.title)
  end
  
  
  
  Then('I should see a show link for the project') do
    project = Project.find(@project.id)
    expect(page).to have_link('Show', href: project_path(project))
  end
  
  
  
  When('I show the project details') do
    project = Project.find(@project.id)
    visit project_path(project)
  end
  
  
  Then('I should see a list of students on the project') do
    project = Project.find(@project.id)
    students = project.students
  
    students.each do |student|
      puts "Got Student #{student.inspect}"
    end
  end
  

