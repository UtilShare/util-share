defmodule Utilshare.ReleaseTasks do

  @start_apps [
    :crypto,
    :ssl,
    :postgrex,
    :ecto
  ]

  @myapps [
    :utilshare
  ]

  @repos [
    Utilshare.Repo
  ]

  def migrate do
    IO.puts "Loading utilshare application..."
    :ok = Application.load(:utilshare)

    IO.puts "Starting dependencies..."
    Enum.each(@start_apps, &Application.ensure_all_started/1)

    IO.puts "Starting repos..."
    Enum.each(@repos, &(&1.start_link(pool_size: 1)))

    IO.puts "Running micrgrations..."
    Enum.each(@myapps, &run_migrations_for/1)

    IO.puts "Success!"
    :init.stop()
  end

  def priv_dir(app), do: "#{:code.priv_dir(app)}"

  defp run_migrations_for(app) do
    IO.puts "Running migrations for #{app}"
    Ecto.Migrator.run(Utilshare.Repo, migrations_path(app), :up, all: true)
  end

  defp migrations_path(app), do: Path.join([priv_dir(app), "repo", "migrations"])
end
