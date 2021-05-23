defmodule Foo.Application do
  @moduledoc false

  use Application

  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      {Foo.Broadway, []},
      %{
        id: Foo.RMQPublisher,
        start: {Foo.RMQPublisher, :start_link, []}
      }
    ]

    opts = [strategy: :one_for_one, name: Foo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
