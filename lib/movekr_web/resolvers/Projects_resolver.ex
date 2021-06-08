defmodule MovekrWeb.ProjectsResolver do
  alias Movekr.Projects

  def create_project(_root, args, _info) do
    case Projects.create_project(args.project) do
      {:ok, project} ->
        {:ok, project}

      {:error, changeset} ->
        errors =
          Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
            Enum.reduce(opts, msg, fn {key, value}, acc ->
              String.replace(acc, "%{#{key}}", to_string(value))
            end)
          end)

        error_msg =
          errors
          |> Enum.map(fn {key, errors} -> "#{key}: #{Enum.join(errors, ", ")}" end)
          |> Enum.join("\n")

        {:error, "#{error_msg}"}
    end
  end

  def create_columns(_root, args, _info) do
    case Projects.create_columns(args.columns) do
      {:ok, columns} ->
        {:ok, columns}

      {:error, changeset} ->
        errors =
          Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
            Enum.reduce(opts, msg, fn {key, value}, acc ->
              String.replace(acc, "%{#{key}}", to_string(value))
            end)
          end)

        error_msg =
          errors
          |> Enum.map(fn {key, errors} -> "#{key}: #{Enum.join(errors, ", ")}" end)
          |> Enum.join("\n")

        {:error, "#{error_msg}"}
    end
  end
end
