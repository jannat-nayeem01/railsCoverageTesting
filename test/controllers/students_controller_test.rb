require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("Student.count") do
      post students_url, params: { student: { name: @student.name, project_id: @student.project_id, url: @student.url } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should be failed to create students due to the absence of name,url,project_id" do
    assert_no_difference("Student.count") do
      post students_url, params: { student: { junk: 'XYZ' } }
    end
    assert_select "li", "Name can't be blank"
    assert_select "li", "Url can't be blank"
    assert_select "li", "Project must exist"

  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { name: @student.name, project_id: @student.project_id, url: @student.url } }
    assert_redirected_to student_url(@student)
  end

  test "should be failed to update student in absence of student name,url,project_id" do
    patch student_url(@student), params: { student: { name: '', project_id: '', url: 'Valid Description' } }
  end

  test "should destroy student" do
    assert_difference("Student.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
