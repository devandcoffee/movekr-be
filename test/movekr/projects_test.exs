defmodule Movekr.ProjectsTest do
  use Movekr.DataCase

  alias Movekr.Projects

  describe "projects" do
    alias Movekr.Projects.Project

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Projects.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Projects.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Projects.create_project(@valid_attrs)
      assert project.description == "some description"
      assert project.name == "some name"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Projects.update_project(project, @update_attrs)
      assert project.description == "some updated description"
      assert project.name == "some updated name"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_project(project, @invalid_attrs)
      assert project == Projects.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Projects.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Projects.change_project(project)
    end
  end

  describe "columns" do
    alias Movekr.Projects.Column

    @valid_attrs %{name: "some name", order: 42}
    @update_attrs %{name: "some updated name", order: 43}
    @invalid_attrs %{name: nil, order: nil}

    def column_fixture(attrs \\ %{}) do
      {:ok, column} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_column()

      column
    end

    test "list_columns/0 returns all columns" do
      column = column_fixture()
      assert Projects.list_columns() == [column]
    end

    test "get_column!/1 returns the column with given id" do
      column = column_fixture()
      assert Projects.get_column!(column.id) == column
    end

    test "create_column/1 with valid data creates a column" do
      assert {:ok, %Column{} = column} = Projects.create_column(@valid_attrs)
      assert column.name == "some name"
      assert column.order == 42
    end

    test "create_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_column(@invalid_attrs)
    end

    test "update_column/2 with valid data updates the column" do
      column = column_fixture()
      assert {:ok, %Column{} = column} = Projects.update_column(column, @update_attrs)
      assert column.name == "some updated name"
      assert column.order == 43
    end

    test "update_column/2 with invalid data returns error changeset" do
      column = column_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_column(column, @invalid_attrs)
      assert column == Projects.get_column!(column.id)
    end

    test "delete_column/1 deletes the column" do
      column = column_fixture()
      assert {:ok, %Column{}} = Projects.delete_column(column)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_column!(column.id) end
    end

    test "change_column/1 returns a column changeset" do
      column = column_fixture()
      assert %Ecto.Changeset{} = Projects.change_column(column)
    end
  end

  describe "tasks" do
    alias Movekr.Projects.Task

    @valid_attrs %{column_id: 42, description: "some description", end_date: ~D[2010-04-17], start_date: ~D[2010-04-17], status: true}
    @update_attrs %{column_id: 43, description: "some updated description", end_date: ~D[2011-05-18], start_date: ~D[2011-05-18], status: false}
    @invalid_attrs %{column_id: nil, description: nil, end_date: nil, start_date: nil, status: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Projects.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Projects.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Projects.create_task(@valid_attrs)
      assert task.column_id == 42
      assert task.description == "some description"
      assert task.end_date == ~D[2010-04-17]
      assert task.start_date == ~D[2010-04-17]
      assert task.status == true
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Projects.update_task(task, @update_attrs)
      assert task.column_id == 43
      assert task.description == "some updated description"
      assert task.end_date == ~D[2011-05-18]
      assert task.start_date == ~D[2011-05-18]
      assert task.status == false
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_task(task, @invalid_attrs)
      assert task == Projects.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Projects.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Projects.change_task(task)
    end
  end

  describe "tasks" do
    alias Movekr.Projects.Task

    @valid_attrs %{description: "some description", end_date: ~D[2010-04-17], start_date: ~D[2010-04-17], status: true}
    @update_attrs %{description: "some updated description", end_date: ~D[2011-05-18], start_date: ~D[2011-05-18], status: false}
    @invalid_attrs %{description: nil, end_date: nil, start_date: nil, status: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Projects.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Projects.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Projects.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Projects.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.end_date == ~D[2010-04-17]
      assert task.start_date == ~D[2010-04-17]
      assert task.status == true
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Projects.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Projects.update_task(task, @update_attrs)
      assert task.description == "some updated description"
      assert task.end_date == ~D[2011-05-18]
      assert task.start_date == ~D[2011-05-18]
      assert task.status == false
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Projects.update_task(task, @invalid_attrs)
      assert task == Projects.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Projects.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Projects.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Projects.change_task(task)
    end
  end
end
