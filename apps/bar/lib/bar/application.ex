defmodule Bar.Application do
  @moduledoc false

  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      {Bar.Broadway, []}
    ]

    opts = [strategy: :one_for_one, name: Bar.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
