require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count") do
      post projects_url, params: { project: { title: @project.title, url: @project.url } }
    end

    assert_redirected_to project_url(Project.last)
  end
  
  test "should be failed to create project due to the absence of project title/url" do
    assert_no_difference("Project.count") do
      post projects_url, params: { project: { junk: 'XYZ' } }
    end
    assert_select "li", "Title can't be blank"
    assert_select "li", "Url can't be blank"
    #assert_redirected_to project_url(Project.last)
  end



  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { title: @project.title, url: @project.url } }
    assert_redirected_to project_url(@project)
  end


  test "should be failed to update project in absence of project title" do
    patch project_url(@project), params: { project: { title: '', url: 'Valid Description' } }
    assert_select "li", "Title can't be blank"
  end
  
  test "should destroy project" do
    assert_difference("Project.count", -1) do
      @project.students.each do |s|
        s.delete
      end
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
